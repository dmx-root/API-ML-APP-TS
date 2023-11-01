import { RowDataPacket} from 'mysql2';
import { StatusApiResponse } from './responseInterfaces';


export interface moduloInformation extends RowDataPacket {
    spe_op_id:string,
    spe_talla_id:string,
    mdl_label:string,
    number_employees:number
}

export interface ocrByModulo extends RowDataPacket {
    ocr_id:number,
    spe_color_id:string,
    spe_talla_id:string, 
    spe_op_id:string, 
    mdl_id:number, 
    dete_creation:Date, 
    start_operation:string, 
    finish_operation:string, 
    units_cant:number, 
    register_by_id:string, 
    ocr_state_description:string, 
    ocr_state:boolean, 
    anm_cod:string|null, 
    ctg_id:number, 
    checking_by_id:string,
    checking_dete:Date,
    checking_label:string
}

export interface apiResponseGetModuloInformation extends StatusApiResponse {
    data:{
        moduloInformation:moduloInformation,
        ocrList:ocrByModulo
    }|null
}