import {Request,Response}                                           from 'express';
import {FieldPacket}                                                from 'mysql2';
import {StatusApiResponse,statusDBResponse,BacryptStatusResponse}   from '../interfaces/responseInterfaces';
import {UserInterface}                                              from '../interfaces/authInterfaces';
import {apiResponse}                                                from '../interfaces/authInterfaces'
import {comparePassword}                                            from '../handlers/serverHandlers';
import {db}                                                         from '../db/conection';
import {getEnableUsers}                                             from '../services/queryWebService.service';
import {encryptPassword}                                            from '../handlers/serverHandlers';
import {sign} from 'jsonwebtoken'

export class AuthController{
    public async signIn(req:Request,res:Response){
        try {
            const documentId=req.query.documentId?.toString();
            const password=req.query.password?.toString();

            if(!documentId&&!password){

                const apiResponse:StatusApiResponse={
                    statusCodeApi:0,
                    statusMessageApi:'Argumentos de entrada no proporcionados'
                }

                return res.status(400).json(apiResponse);
            }

            const [userResponse]=await db.query<statusDBResponse[]&UserInterface[]&FieldPacket[]>('CALL SP_MANAGEMENT_ML_DB_USER_GET(?)',[documentId]);

            if(userResponse[0].RESPONSE===0){

                const apiResponse:StatusApiResponse={
                    statusCodeApi:0,
                    statusMessageApi:'Documento Incorrecto'
                };

                return res.status(200).json(apiResponse);
            }
            else{

                const authPass:BacryptStatusResponse=await comparePassword(userResponse[1][0].user_password,password===undefined?'none':password);

                if(authPass.statusCodeBycrypt){
                    let key='';

                    !process.env.SECRETKEY?key='':key=process.env.SECRETKEY;

                    const token =sign({id:documentId,role:userResponse[1][0].profile_id},key,{
                        expiresIn:604800//una semana,
                    });

                    const apiResponse:apiResponse={
                        statusCodeApi:1,
                        statusMessageApi:'Consulta exitosa',
                        data:userResponse[1],
                        token
                    }
                    return res.status(200).json(apiResponse)
                }
                const apiResponse:StatusApiResponse={
                    statusCodeApi:0,
                    statusMessageApi:'Contraseña incorrecta'
                };
                return res.status(200).json(apiResponse)
            }

            
        } catch (error) {
            console.log(error)
            const apiErrorResponse:StatusApiResponse={
                statusCodeApi:-1,
                statusMessageApi:'Error de servidor'
            };
            res.status(500).json(apiErrorResponse);
        }
    }
    public async signUp(req:Request,res:Response){

        const {password,documentId,profile,documentType,createBy}=req.body;

        try {
            const dataUserResponse=await getEnableUsers(documentId);
            // console.log(dataUserResponse)
            if(dataUserResponse.serviceStatusCode){

                const hash=await encryptPassword(password);

                if(hash.statusCodeBycrypt){
                    const [registerResponse]=await db.query<statusDBResponse[]&UserInterface[]&FieldPacket[]>('CALL SP_MANAGEMENT_ML_DB_USER_REGISTER(?,?,?,?,?,?,?)',
                    [dataUserResponse.serviceData?.userName,hash.data,documentId,dataUserResponse.serviceData?.description,profile,documentType,createBy]);

                    if(registerResponse[0][0].RESPONSE===1){

                        const apiResponse:apiResponse={
                            data:registerResponse[1],
                            token:'',
                            statusCodeApi:1,
                            statusMessageApi:'Usuario creado'
                            
                        }

                        return res.status(200).json(apiResponse);

                    };

                    const apiResponse:StatusApiResponse={
                        statusCodeApi:0,
                        statusMessageApi:'El usuario ya existe'
                    };

                    return res.status(200).json(apiResponse);

                }

                const apiResponse:StatusApiResponse={
                    statusCodeApi:0,
                    statusMessageApi:hash.statusmessageBcrypt
                };

                return res.status(400).json(apiResponse);

            }

            const apiResponse:StatusApiResponse={
                statusCodeApi:0,
                statusMessageApi:dataUserResponse.serviceStatusMessage
            };

            return res.status(400).json(apiResponse);

        } catch (error) {
            console.log(error);
        }

    }
    
}