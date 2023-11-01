import bcrypt                                           from 'bcrypt';
import {BacryptStatusResponse,EncryptStatusResponse}    from '../interfaces/responseInterfaces'
import {completeDetOp}                                  from '../interfaces/webServiceInterfaces'
import {db}                                             from '../db/conection'

class DetOpQueve{

    #items:Array<()=>Promise<void>>=[];
    
    enqueve(item:()=>Promise<void>){
        this.#items.push(item);
    }
    dequeve(){
        return this.#items.shift();
    }
    isEmpty(){
        return this.#items.length===0;
    }

}
const queve=new DetOpQueve();

export async function runQueve(){ 

    while (!queve.isEmpty()) {

        const fn=queve.dequeve();
        if (fn!==undefined)
        await fn();

    }

}
export async function comparePassword(hash:string,password:string):Promise<BacryptStatusResponse>{
    try {
        console.log(password,hash);
        const response:boolean = await bcrypt.compare(password, hash);
        console.log(response)
        if(response){
            const bacryptResponse:BacryptStatusResponse={
                statusCodeBycrypt:response,
                statusmessageBcrypt:'Desencriptación exitosa'
            }
            return bacryptResponse;
        }
        const bacryptResponse:BacryptStatusResponse={
            statusCodeBycrypt:response,
            statusmessageBcrypt:'Falló la desencriptación'
        }
        return bacryptResponse;
    } catch (error) {
        console.log(error);
        const bacryptResponse:BacryptStatusResponse={
            statusCodeBycrypt:false,
            statusmessageBcrypt:'Error en el proceso de desencriptación'
        }
        return bacryptResponse;
    }
}

export async function  encryptPassword(password:string):Promise<EncryptStatusResponse>{
    try {
        const response:string|Buffer =await bcrypt.hash(password, 10);
        const bacryptResponse:EncryptStatusResponse={
            data:response,
            statusCodeBycrypt:true,
            statusmessageBcrypt:'Contaseña encriptada'
        }
        return bacryptResponse;
    } catch (error) {
        console.log(error);
        const bacryptResponse:EncryptStatusResponse={
            data:null,
            statusCodeBycrypt:false,
            statusmessageBcrypt:'Error en encriptación de contraseña'
        }
        return bacryptResponse;
    }
}

export async function enquveProcessInsertInfoOp(detOpList:Array<completeDetOp>,openBy:string){
    try {
        detOpList.forEach((element,index)=>{
            const insertInformation=async(message:string)=>{

                const [response]=await db.query('CALL SP_MANAGEMENT_ML_DB_OP_OPEN(?,?,?,?,?,?,?,?,?)',
                [element.op,
                element.referencia, 
                element.talla, 
                element.ean, 
                element.colorId, 
                element.colorLabel, 
                element.planeada, 
                element.pendiente,
                openBy]);
                console.log(message);
                
            };  

            function waitingPromise(message:string){ 

                return ()=>{
                    return insertInformation(message);
                }

            }
            
            queve.enqueve(waitingPromise(`Ejecuted async function det OP ${index}...`));
            
        });

    } catch (error) {

    }
}



