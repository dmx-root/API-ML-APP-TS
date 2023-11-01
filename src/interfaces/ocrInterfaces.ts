import {RowDataPacket} from 'mysql2/promise';
import {StatusApiResponse} from './responseInterfaces'

export interface GetOcrByOp extends RowDataPacket{
    op: string,
    ref: string,
    color_id: string,
    talla_id: number,
    color_label: string,
    ean: string,
    ocr_id: number,
    mdl_id: number,
    dete_creation: Date,
    start_operation: string,
    finish_operation: string,
    units_cant: number,
    register_by_id: string,
    ocr_state_description: string,
    ocr_state: number,
    anm_cod: number,
    anomaly_label:string
}

export interface OcrIdResponse extends RowDataPacket{
    ocr_id:number
}

export interface apiResponseRegisterOcr extends StatusApiResponse {
    ocrId:null|number
}

export interface apiResponseGetOcrByOp extends StatusApiResponse {
    data:null|GetOcrByOp
}