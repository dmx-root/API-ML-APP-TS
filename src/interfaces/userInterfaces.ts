import {RowDataPacket} from 'mysql2';
import {StatusApiResponse} from './responseInterfaces'


export interface opSesion extends RowDataPacket{
    op: string,
    ref: string,
    cant_ocr:number,
    cant_planned: number,
    cant_completed: number
}

export interface ocrSesion extends RowDataPacket{
    op: string,
    ref: string,
    color_id: string,
    talla_id: string,
    color_label: string,
    tll_label: string,
    ean: string,
    anomaly_label: string,
    ocr_id: number,
    mdl_id: number,
    dete_creation:Date,
    start_operation:string,
    finish_operation: string,
    units_cant:number,
    register_by_id: string,
    ocr_state_description:string,
    ocr_state: number,
    anm_cod: number
}
export interface anomalySesion extends RowDataPacket{
    anm_cod:string,
    anomaly_label:string
}
export interface tallaSesion extends RowDataPacket{
    tll_id:string
}
export interface moduloSesion extends RowDataPacket{
    mdl_id:number, 
    number_employees:number, 
    number_machine:number|null, 
    operation_state:boolean, 
    modulo_state:boolean, 
    mdl_label:string
}
export interface apiResponseGetSesion extends StatusApiResponse{
    data:{
        opList:opSesion,
        ocrList:ocrSesion,
        anomalyList:anomalySesion,
        tallaList:tallaSesion,
        moduloList:moduloSesion
    }|null
}