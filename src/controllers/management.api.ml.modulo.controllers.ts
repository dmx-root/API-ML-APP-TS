import {Response,Request}                                                   from 'express';
import {db}                                                                 from '../db/conection';
import {FieldPacket}                                                        from 'mysql2/promise';
import { moduloInformation, ocrByModulo, apiResponseGetModuloInformation }  from '../interfaces/moduloInterfaces';
import {statusDBResponse}                                                   from '../interfaces/responseInterfaces';


export class ModuloControllers{

    public async getModuloInformation(req:Request,res:Response):Promise<Response>{

        const {moduloId}=req.params;

        try {
            if(!moduloId){
                
                const apiResponse:apiResponseGetModuloInformation={
                
                    data:null,
                    statusCodeApi:-1,
                    statusMessageApi:'No se obtuvieon los campos esperados'
                
                }

                return res.status(200).json(apiResponse);
            } 
              
            const [response]=await db.query<statusDBResponse[]&moduloInformation[]&ocrByModulo[]&FieldPacket[]>('CALL SP_MANAGEMENT_ML_DB_MODULO_GET(?)',[moduloId]);

            if(response[0][0].RESPONSE===-1){

                const apiResponse:apiResponseGetModuloInformation={

                    data:null,
                    statusCodeApi:-1,
                    statusMessageApi:'Hubo un error a la hora de hacer la consulta a la base de datos'

                }

                return res.status(500).json(apiResponse);

            }
            if(response[0][0].RESPONSE===0){
                const apiResponse:apiResponseGetModuloInformation={
                    data:null,
                    statusCodeApi:0,
                    statusMessageApi:'No se encotró el módulo'
                }
            }

            const apiResponse:apiResponseGetModuloInformation={
                data:{
                    moduloInformation:response[1],
                    ocrList:response[2]
                },
                statusCodeApi:1,
                statusMessageApi:'Consulta exitosa'
            }

            return res.status(200).json(apiResponse);

        } catch (error) {

            console.log(error);
            const apiResponse:apiResponseGetModuloInformation={
                data:null,
                statusCodeApi:-1,
                statusMessageApi:'Error de servidor'
            }

            return res.status(500).json(apiResponse);
        }
    }
   
}