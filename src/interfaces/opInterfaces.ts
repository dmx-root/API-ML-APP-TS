import {RowDataPacket} from 'mysql2'
import {StatusApiResponse} from './responseInterfaces'

export interface op extends RowDataPacket {
    op:string,
    ref:string,
    cant_ocr:number,
    cant_planned: number,
    cant_completed:number
}
export interface statusResponse extends RowDataPacket {
    RESPONSE: number,
    MESSAGE: string 
}
export interface CompleteOp extends RowDataPacket {
    op:string,
    ref:string,
    cant_ocr:number,
    cant_planned_op:number,
    cant_completed_op:number,
    amount_ocr_det_op:number,
    amount_planned_det_op:number,
    amount_completed_det_op:number,
    color_label:string, 
    color_id:string,
    tll_id:string,
    ean_id:string
}

export interface CompleteOpInterface{
    op:string,
    ref:string,
    cant_ocr:number,
    cant_planned_op:number,
    cant_completed_op:number,
    amount_ocr_det_op:number,
    amount_planned_det_op:number,
    amount_completed_det_op:number,
    color_label:string, 
    color_id:string,
    tll_id:string,
    ean_id:string
}

export interface apiResponseOpenOp extends StatusApiResponse{
    data: CompleteOpInterface|null
}
export interface apiResponseGetCompleteOP extends StatusApiResponse{
    data:CompleteOpInterface|null
}
