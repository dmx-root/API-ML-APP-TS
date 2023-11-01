import {RowDataPacket} from 'mysql2';

export interface statusDBResponse extends RowDataPacket{
    RESPONSE: number,
    MESSAGE: string 
};

export interface StatusApiResponse{
    statusCodeApi:number,
    statusMessageApi:string
};

export interface BacryptStatusResponse{
    statusCodeBycrypt:boolean,
    statusmessageBcrypt:string 
}
export interface EncryptStatusResponse extends BacryptStatusResponse{
    data:string|Buffer|null
}