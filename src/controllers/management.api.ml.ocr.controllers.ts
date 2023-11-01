import {Response,Request}                   from 'express';
import {db}                                 from '../db/conection';
import {FieldPacket}                        from 'mysql2/promise';
import {apiResponseRegisterOcr}             from '../interfaces/ocrInterfaces';
import {StatusApiResponse, statusDBResponse}from '../interfaces/responseInterfaces';
import {OcrIdResponse}                      from '../interfaces/ocrInterfaces';
import {apiResponseGetOcrByOp,GetOcrByOp}   from '../interfaces/ocrInterfaces';

export class OcrControllers{

    public async registerOCR(req:Request,res:Response):Promise<Response>{

        try {
            const {startTime,finishTime,registerById,moduloId,unitsCant,colorId,tallaId,opId,anomalyCode,categoryId}=req.body;

            if(!startTime||!finishTime||!registerById||!moduloId||!unitsCant||!colorId||!tallaId||!opId||!categoryId){

                const apiResponse:apiResponseRegisterOcr={

                    ocrId:null,
                    statusCodeApi:-1,
                    statusMessageApi:'Error de servidor, no se obtuvieron los campos necesarios'

                }

                return res.status(200).json(apiResponse);

            }
            const [response]=await db.query<statusDBResponse[]&OcrIdResponse[]&FieldPacket[]>('CALL SP_MANAGEMENT_ML_DB_OCR_REGISTER(?,?,?,?,?,?,?,?,?,?)',[startTime.slice(0,8),finishTime.slice(0,8),registerById,moduloId,unitsCant,colorId,tallaId,opId,anomalyCode,categoryId]);

            if(response[0][0].RESPONSE===0){
                const apiResponse:apiResponseRegisterOcr={

                    ocrId:null,
                    statusCodeApi:0,
                    statusMessageApi:'No se encontró el detalle de la op ingresado'
    
                }
                
                return res.status(200).json(apiResponse);
            }


            const apiResponse:apiResponseRegisterOcr={

                ocrId:response[1][0].ocr_id,
                statusCodeApi:1,
                statusMessageApi:'Consulta exitosa'

            }

            return res.status(200).json(apiResponse);

        } catch (error) {

            const apiResponse:apiResponseRegisterOcr={

                ocrId:null,
                statusCodeApi:-1,
                statusMessageApi:'Error de servidor'

            }
            return res.status(500).json(apiResponse);
        }

    }

    public async getBySpeOp(req:Request,res:Response):Promise<Response>{

        const {op,color,talla}=req.query;

        try {

            if(!op||!color||!talla){

                const apiResponse:apiResponseGetOcrByOp={

                    data:null,
                    statusCodeApi:-1,
                    statusMessageApi:'No se obtuvieron los campos necesarios'

                }

                return res.status(200).json(apiResponse);

            }

            const [response]=await db.query<statusDBResponse[]&GetOcrByOp[]&FieldPacket[]>('CALL SP_MANAGEMENT_ML_DB_OCR_GET_ALL_BY_SPE_OP(?,?,?)',[op,color,talla]);

            if(response[0][0].RESPONSE===-1){

                const apiResponse:apiResponseGetOcrByOp={
                    data:null,
                    statusCodeApi:-1,
                    statusMessageApi:'Hubo un error con la conexión a la base de datos'
                }

                return res.status(200).json(apiResponse);

            }
            if(response[0][0].RESPONSE===0){

                const apiResponse:apiResponseGetOcrByOp={

                    data:null,
                    statusCodeApi:0,
                    statusMessageApi:'la OP seleccionada no se encotró'

                }

                return res.status(200).json(apiResponse);

            }
            console.log(op,color,talla);
            const apiResponse:apiResponseGetOcrByOp={

                data:response[1],
                statusCodeApi:1,
                statusMessageApi:'Consulta exitosa'

            }

            return res.status(200).json(apiResponse);
            
        } catch (error) {
            console.log(error);
            const apiResponse:apiResponseGetOcrByOp={
                data:null,
                statusCodeApi:-1,
                statusMessageApi:'Error de servidor'
            }
            return res.status(500).json(apiResponse);
        }
    }
    
    public async checkOcr(req:Request,res:Response):Promise<Response>{

        const {ocrId,documentId}=req.body;

        try {
            if(!ocrId||!documentId){

                const apiResponse:StatusApiResponse={

                    statusCodeApi:-1,
                    statusMessageApi:'No se obtuvieron los campos esperados'

                }

                return res.status(200).json(apiResponse);

            }

            const [response]=await db.query<statusDBResponse[]&FieldPacket[]>('CALL SP_MANAGEMENT_ML_DB_OCR_CHECK_IN(?,?)',[ocrId,documentId]);

            if(response[0].RESPONSE===0){

                const apiResponse:StatusApiResponse={
                    statusCodeApi:0,
                    statusMessageApi:'No se encontró la OCR especicicada'
                }

                return res.status(200).json(apiResponse);

            }
            if(response[0].RESPONSE===-1){

                const apiResponse:StatusApiResponse={
                    statusCodeApi:-1,
                    statusMessageApi:'Error de servidor. Hubo un error al consultar a la base de datos '
                }

                return res.status(200).json(apiResponse);

            }

            const apiResponse:StatusApiResponse={

                statusCodeApi:1,
                statusMessageApi:'Consulta exitosa'

            }

            return res.status(200).json(apiResponse);
            
        } catch (error) {

            const apiResponse:StatusApiResponse={

                statusCodeApi:-1,
                statusMessageApi:'Error de servidor'

            }

            return res.status(500).json(apiResponse)
        }
    }
}