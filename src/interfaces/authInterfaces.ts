import {RowDataPacket} from 'mysql2';
import {StatusApiResponse} from './responseInterfaces'

export interface UserInterface extends RowDataPacket{
    user_document_id:string,
    user_name:string,
    user_password:Buffer,
    user_description:string,
    user_state:Number,
    user_state_description:string,
    user_create_dete:string,
    profile_id:Number,
    document_type_id:Number,
    profile_label:string,
    master_id:Number
}
export interface UserInterfaceResponse{
    user_document_id:string,
    user_name:string,
    user_password:Buffer,
    user_description:string,
    user_state:Number,
    user_state_description:string,
    user_create_dete:string,
    profile_id:Number,
    document_type_id:Number,
    profile_label:string,
    master_id:Number
}
export interface apiResponse extends StatusApiResponse{
    data:UserInterfaceResponse,
    token:string
}
