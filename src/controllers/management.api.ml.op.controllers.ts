import {statusResponse,apiResponseOpenOp,apiResponseGetCompleteOP}  from '../interfaces/opInterfaces';
import {CompleteOp}                                                 from '../interfaces/opInterfaces';
import {getInsertionInformation}                                    from '../services/queryWebService.service';
import {enquveProcessInsertInfoOp,runQueve}                         from '../handlers/serverHandlers';
import {db}                                                         from '../db/conection';
import {FieldPacket}                                                from 'mysql2/promise';
import {Response,Request}                                           from 'express';

export class OpControllers{
   
    public async openOp(req:Request,res:Response):Promise<Response>{
        try {
            const {op,openById}=req.body;
            const [opResponse]=await db.query<statusResponse[]&CompleteOp[]&FieldPacket[]>('CALL SP_MANAGEMENT_ML_DB_OP_GET_COMPLETE(?)',[op]);
            if(opResponse[0][0].RESPONSE===1){

                const apiResponse:apiResponseOpenOp={
                    data:opResponse[1],
                    statusCodeApi:1,
                    statusMessageApi:'Consulta exitosa'
                }

                return res.status(200).json(apiResponse);
            }
            else if(opResponse[0][0].RESPONSE===-1){
                const apiResponse:apiResponseOpenOp={
                    data:null,
                    statusCodeApi:-1,
                    statusMessageApi:'Hubo un problema con la consulta a la base de datos'
                }

                return res.status(200).json(apiResponse);
            }
            else if(opResponse[0][0].RESPONSE===0){
                const response=await getInsertionInformation(op);
                if(response.serviceStatusCode===1){
                    
                   await enquveProcessInsertInfoOp(response.serviceData,openById); 
                   runQueve();

                   const apiResponse:apiResponseOpenOp={
                       data:null,
                       statusCodeApi:0,
                       statusMessageApi:'datos ingresados'
                   }
   
                   return res.status(200).json(apiResponse);
                }
                const apiResponse:apiResponseOpenOp={
                    data:null,
                    statusCodeApi:0,
                    statusMessageApi:'Hubo un problema con la insersión de datos'
                }

                return res.status(200).json(apiResponse);
                
            }
            return res
            
        } catch (error) {
            console.log(error)
            const apiResponse:apiResponseOpenOp={
                data:null,
                statusCodeApi:0,
                statusMessageApi:'Hubo un problema con la insersión de datos'
            }

            return res.status(200).json(apiResponse);
        }
    }
    public async getOpComplete(req:Request,res:Response):Promise<Response>{
        try {
            const {op}=req.params;

            if(!op){

                const apiResponse:apiResponseGetCompleteOP={
                    data:null,
                    statusCodeApi:-1,
                    statusMessageApi:'Error de servidor, no se obtuvieron los campos esperados'
                }

                return res.status(500).json(apiResponse);

            }
            const [opResponse]=await db.query<statusResponse[]&CompleteOp[]&FieldPacket[]>('CALL SP_MANAGEMENT_ML_DB_OP_GET_COMPLETE(?)',[op]);
          
            if(opResponse[0][0].RESPONSE===0){

                const apiResponse:apiResponseGetCompleteOP={
                    data:null,
                    statusCodeApi:0,
                    statusMessageApi:'No se encontro la OP ingresada'
                }

                return res.status(200).json(apiResponse);

            }
            if(opResponse[0][0].RESPONSE===-1){
                
                const apiResponse:apiResponseGetCompleteOP={
                    data:null,
                    statusCodeApi:-1,
                    statusMessageApi:'Hubo un error intentando conectarse a la base de datos'
                }

                return res.status(500).json(apiResponse);
            }

            const apiResponse:apiResponseGetCompleteOP={
                data:opResponse[1],
                statusCodeApi:1,
                statusMessageApi:'Consulta exitosa'
            }

            return res.status(200).json(apiResponse);

        } catch (error) {
            return res.status(500).json({});
        }
    }
}