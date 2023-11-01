import {db}                                     from '../db/conection';
import {FieldPacket}                            from 'mysql2/promise';
import {Response,Request}                       from 'express';
import {ocrSesion,opSesion,tallaSesion,anomalySesion,apiResponseGetSesion,moduloSesion}  from '../interfaces/userInterfaces';
import {statusDBResponse}                                                   from '../interfaces/responseInterfaces';



export class UserControllers{
    public async getSesion(req:Request,res:Response):Promise<Response>{
        
        const {userDocumentId}=req.params;
        
        try {
            
            if(!userDocumentId){

                const apiResponse:apiResponseGetSesion={

                    data:null,
                    statusCodeApi:-1,
                    statusMessageApi:'No se obtuvieron los campos esperados'

                }

                return res.status(200).json(apiResponse);

            }

            const [response]=await db.query<statusDBResponse[]&opSesion[]&ocrSesion[]&anomalySesion[]&tallaSesion[]&moduloSesion[]&FieldPacket[]>('CALL SP_MANAGEMENT_ML_DB_SESION(?)',[userDocumentId]);

            if(response[0][0].RESPONSE===-1){

                const apiResponse:apiResponseGetSesion={

                    data:null,
                    statusCodeApi:1,
                    statusMessageApi:'Hubo un error con las consultas de la base de datos'

                }

                return res.status(200).json(apiResponse);

            }
            const apiResponse:apiResponseGetSesion={

                data:{
                    opList:response[1],
                    ocrList:response[2],
                    anomalyList:response[3],
                    tallaList:response[4],
                    moduloList:response[5]
                },
                statusCodeApi:1,
                statusMessageApi:'Consulta exitosa'

            }
            
            return res.status(200).json(apiResponse);
            
        } catch (error) {
            console.log(error);
            const apiResponse:apiResponseGetSesion={
                data:null,
                statusCodeApi:-1,
                statusMessageApi:'Error de servidor'
            }
            return res.status(500).json(apiResponse);
        }
    }
}