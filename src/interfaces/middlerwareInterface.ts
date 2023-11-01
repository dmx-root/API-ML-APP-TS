import {RowDataPacket} from 'mysql2';

export interface authRoles extends RowDataPacket{
    profile_label:string,
    pro_id:number
}

export interface payLoadAuth{
    id:string,
    role:string
}