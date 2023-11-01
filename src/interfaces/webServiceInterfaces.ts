interface user{
    typeId:string,
    documetId:string,
    userName:string,
    description:string
}
interface serviceStatus{
    serviceStatusCode:number,
    serviceStatusMessage:string
}

export interface detOp{
    op:string,
    referencia:string,
    colorId:string,
    colorLabel:string,
    talla:string,
    planeada:number,
    completada:number,
    pendiente:number
}
export interface barCode{
    ean:string,
    referencia:string,
    colorId:string,
    colorLabel:string,
    talla:string
}

export interface detOpResponseWS{
    OP:Array<string>,
    Referencia:Array<string>,
    Id_Color:Array<string>,
    Color:Array<string>,
    Talla:Array<string>,
    Planeada:Array<string>,
    Completada:Array<string>,
    Pendiente:Array<string>  
}
export interface barCodeResponseWS{
    Barras:Array<string>,
    Referencia:Array<string>,
    EXT1:Array<string>,
    DESCRIPCION_EXT1:Array<string>,
    EXT2:Array<string>
}

export interface StatuServiceUsersResponse extends serviceStatus{
    serviceData:user|null
}

export interface StatuServiceOpResponse extends serviceStatus{
    serviceData:Array<detOp>
}

export interface StatuServiceBarCodeResponse extends serviceStatus{
    serviceData:Array<barCode>
}
export interface StatuServiceInsertInfoResponse extends serviceStatus{
    serviceData:Array<completeDetOp>
}

export interface completeDetOp extends detOp{
    ean:string,
    openBy:string 
}