import {authRoles,payLoadAuth}                      from '../interfaces/middlerwareInterface'
import {UserInterface}                  from '../interfaces/authInterfaces';
import {statusDBResponse}               from '../interfaces/responseInterfaces';
import {db}                             from '../db/conection';
import jwt,{JwtPayload}                             from 'jsonwebtoken';
import {config}                         from 'dotenv';
import {FieldPacket}                    from 'mysql2';
import {Request,Response,NextFunction, response}  from 'express'

config();

// MIDDLERWARE QUE SE ENCARGARÁ DE DAR ACCESO A LAS RUTAS 
export function authenticateRoutes(rolArray:Array<string>|null) {
    
    const verifyUserExistence=async (userId:string):Promise<UserInterface|null>=>{
        try {
            const [response]=await db.query<statusDBResponse[]&UserInterface[]&FieldPacket[]>('CALL SP_MANAGEMENT_ML_DB_USER_GET(?)',[userId]);
            if(response[0][0].RESPONSE===1){
                return response[1];
            }  
            return null;
            
        } catch (error) {
            console.log(error)
            return null;
        }
    }
    
    const verifyRoles=async ():Promise<authRoles|null>=>{
        try {
            const [roles]=await db.query<statusDBResponse[]&authRoles[]&FieldPacket[]>('call SP_MANAGEMENT_ML_DB_AUTH_ROLES()');
            if(roles[0][0].RESPONSE===1){
                return roles[1];
            }
            return null;
        } catch (error) {
            console.log(error)
            return null;
        }
    }

    return (req:Request, res:Response, next:NextFunction)=>{

        const token = req.header('access-token-auth');// TOKEN(ID USUARIO Y ROL PERFIL)

        //SE ASEGURA DE QUE SE PROPORCIONE UN TOKEN
        if(rolArray===null) return next();// SE PUEDE ACCEDER DESDE CUALQUIER PERFIL ESTABLECIENDO ROLARRAY EN NULL

        if (!token) return res.status(401).json({ message: 'Acceso no autorizado' });

        if(!process.env.SECRETKEY) return res.status(401).json({message:'Key no proporcionada'});

        jwt.verify(token, process.env.SECRETKEY,(err,decoded:string | jwt.JwtPayload | undefined)=>{//DECODIFICA EL TOKEN

            if(err) return res.status(403).send({message:'Error de autenticación'});

            if (typeof(decoded)==='string' || typeof(decoded)==='undefined') return res.status(403).json({message: 'No se obtuvo los campos esperados en el payload'});

            verifyUserExistence(decoded.id). //SE VERIFICA QUE EL USUARIO PROPORCIONADO EXISTA PARA SESIONES ACTIVAS 
            then(response1=>{

                verifyRoles().then(response2=>{// SE VERIFICA QUE LOS ROLES PROPORCIONADOS SE EN CUENTREN EN LA BASE DE DATOS 
                    
                    if(response2===null) return res.status(403).json({message:'Roles no disponibles en la base de datos'});

                    rolArray.forEach(element1 => {

                        // if(!response2.some(rol=>rol.profile_label===element1)) return res.status(403).json({ message: 'Rol no existe' });

                    });
                    console.log(response2);

                    next();// SI LOS ROLES PROPORCIONADOS SON CORRECTOS SE DA ACCESO A LA RUTA

                }).catch(err2=>{

                    console.log(err2);
                    return res.status(403).json({ message: 'Error en la autenticación de roles' });

                });

            }).catch(err1=>{

                console.log(err1)
                return res.status(401).json({ message: 'Error en la autenticación, usuario no encontrado' });

            });
        });
    }
}