import {StatuServiceUsersResponse,StatuServiceOpResponse,detOp,detOpResponseWS} from '../interfaces/webServiceInterfaces';
import {barCode,barCodeResponseWS,StatuServiceBarCodeResponse,completeDetOp}    from '../interfaces/webServiceInterfaces';
import {StatuServiceInsertInfoResponse}                                         from '../interfaces/webServiceInterfaces'
import axios,{AxiosRequestConfig,AxiosResponse}                                 from 'axios';
import {config}                                                                 from 'dotenv';
import {parseString}                                                            from 'xml2js';

config();

export async function getEnableUsers(document:string):Promise<StatuServiceUsersResponse>{
    
    const userdata=`<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:tem="http://tempuri.org/">\n   
                <soap:Header/>\n   
                    <soap:Body>\n<tem:EjecutarConsultaXML>\n
                        <!--Optional:-->\n         
                        <tem:pvstrxmlParametros>\n         
                        <![CDATA[\n<Consulta><NombreConexion>Real</NombreConexion>\n    
                        <IdCia>${process.env.ID_CIA_WS}</IdCia>\n    
                        <IdProveedor>${process.env.ID_PROVEDOR_WS}</IdProveedor>\n    
                        <IdConsulta>ML_AppML_1_UsuariosApp</IdConsulta>\n    
                        <Usuario>${process.env.USUARIO_WS}</Usuario>\n    
                        <Clave>${process.env.CLAVE_WS}</Clave>\n    
                        <Parametros>\n      
                            <cedula>${document}</cedula>\n    
                        </Parametros>\n</Consulta>\n         ]]>\n         
                        </tem:pvstrxmlParametros>\n      </tem:EjecutarConsultaXML>\n   
                        </soap:Body>\n</soap:Envelope>`;
    try {

        const statusServiceResponse:StatuServiceUsersResponse={
            serviceData:null,
            serviceStatusCode:1,
            serviceStatusMessage:'Consulta exitosa'
        };

        const axiosConfig:AxiosRequestConfig={
            method:'post',
            url:process.env.URL_WS,
            headers:{
                "Content-Type":'text/xml;charset=UTF-8',
                'SOAPAction': 'http://tempuri.org/EjecutarConsultaXML'
            },
            data:userdata
        };

        const dataResponse:AxiosResponse=await axios(axiosConfig);

        parseString(dataResponse.data, function (err, result) {
            
            const user=result['soap:Envelope']['soap:Body'][0]['EjecutarConsultaXMLResponse'][0]['EjecutarConsultaXMLResult'][0]['diffgr:diffgram'][0]['NewDataSet'][0]['Resultado'];
            const newUser={
                typeId:user[0].TIPO_ID[0],
                documetId:user[0].CC[0],
                userName:user[0].NOMBRE[0],
                description:user[0].Descripcion[0]
            }
            statusServiceResponse.serviceData=newUser;
        });

        return statusServiceResponse;

    } catch (error) {

        const statusServiceResponse:StatuServiceUsersResponse={
            serviceData:null,
            serviceStatusCode:0,
            serviceStatusMessage:'Usuario no asociado a los recursos de la compañía'
        };

        return statusServiceResponse;
    }
    
}
export async function getEnableOp(op:string):Promise<StatuServiceOpResponse>{

    var data = `<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:tem="http://tempuri.org/">\n   
                <soap:Header/>\n   
                <soap:Body>\n      
                <tem:EjecutarConsultaXML>\n         
                <!--Optional:-->\n         
                <tem:pvstrxmlParametros>\n         
                <![CDATA[\n<Consulta><NombreConexion>Real</NombreConexion>\n    
                <IdCia>${process.env.ID_CIA_WS}</IdCia>\n    
                <IdProveedor>${process.env.ID_PROVEDOR_WS}</IdProveedor>\n    
                <IdConsulta>ML_AppWEBML_1_Asignacion_OP_Modulos</IdConsulta>\n    
                <Usuario>${process.env.USUARIO_WS}</Usuario>\n    
                <Clave>${process.env.CLAVE_WS}</Clave>\n 
                    <Parametros>\n      
                        <docto>${op}</docto>\n    
                    </Parametros>\n</Consulta>\n         ]]>\n         
                </tem:pvstrxmlParametros>\n      
                </tem:EjecutarConsultaXML>\n   
                </soap:Body>\n</soap:Envelope>`;

    try {

        const statusServiceResponse:StatuServiceOpResponse={
            serviceData:[],
            serviceStatusCode:1,
            serviceStatusMessage:'Consulta exitosa'
        };

        var config:AxiosRequestConfig = {
            method: 'post',
            url:process.env.URL_WS,
            headers: { 
                'Content-Type': 'text/xml;charset=UTF-8', 
                'SOAPAction': 'http://tempuri.org/EjecutarConsultaXML'
            },
            data : data
        };

        const response:AxiosResponse=await axios(config);

        var res:Array<detOp>=[];
        
        parseString(response.data, function (err, result) {

            const ops:Array<detOpResponseWS>=result['soap:Envelope']['soap:Body'][0]['EjecutarConsultaXMLResponse'][0]['EjecutarConsultaXMLResult'][0]['diffgr:diffgram'][0]['NewDataSet'][0]['Resultado']; 
            
            ops.forEach((element:detOpResponseWS) => {

                const detOp:detOp={
                    op:element.OP[0].trim(),
                    referencia:element.Referencia[0].trim(),
                    colorId:element.Id_Color[0].trim(),
                    colorLabel:element.Color[0].trim(),
                    talla:element.Talla[0].trim(),
                    planeada:parseInt(element.Planeada[0].trim()),
                    completada:parseInt(element.Completada[0].trim()),
                    pendiente:parseInt(element.Pendiente[0].trim())
                };

                res.push(detOp);

            });

            statusServiceResponse.serviceData=res;

        });

        return statusServiceResponse;
        
    } catch (error) {

        const statusServiceResponse:StatuServiceOpResponse={
            serviceData:[],
            serviceStatusCode:-1,
            serviceStatusMessage:'Error de consulta'
         };

        return statusServiceResponse;

    }
}
export async function getEnableBarCode(reference:string):Promise<StatuServiceBarCodeResponse>{

    var data = `<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:tem="http://tempuri.org/">\n   
    <soap:Header/>\n   
    <soap:Body>\n      
    <tem:EjecutarConsultaXML>\n         
    <!--Optional:-->\n         
    <tem:pvstrxmlParametros>\n        
    <![CDATA[\n<Consulta>\n        
        <NombreConexion>Real</NombreConexion>\n        
        <IdCia>2</IdCia>\n        
        <IdProveedor>FZ</IdProveedor>\n        
        <IdConsulta>ML_AppML_2_Items_Barras</IdConsulta>\n        
        <Usuario>procesos_ws</Usuario>\n        
        <Clave>SISTconsul1450*1</Clave>\n        
        <Parametros>\n        
        <referencia>${reference}</referencia>\n        
        <extension1>-1</extension1>\n        
        <extension2>-1</extension2>\n        
        </Parametros>\n
        </Consulta>\n         
    ]]>\n         
    </tem:pvstrxmlParametros>\n      
    </tem:EjecutarConsultaXML>\n   
    </soap:Body>\n
    </soap:Envelope>`;

    try {

        const statusServiceResponse:StatuServiceBarCodeResponse={
            serviceData:[],
            serviceStatusCode:1,
            serviceStatusMessage:'Consulta exitosa'
        };
    
        var config:AxiosRequestConfig = {
          method: 'post',
          url: 'http://autogestion.feriadelbrasier.com.co/WSUNOEE/WSUNOEE.asmx',
          headers: { 
            'Content-Type': 'text/xml;charset=UTF-8', 
            'SOAPAction': 'http://tempuri.org/EjecutarConsultaXML'
          },
          data : data
        };
    
        var res:Array<barCode>=[]

        const response:AxiosResponse=await axios(config);

        parseString(response.data, function (err, result) {

            const ean:Array<barCodeResponseWS>=result['soap:Envelope']['soap:Body'][0]['EjecutarConsultaXMLResponse'][0]['EjecutarConsultaXMLResult'][0]['diffgr:diffgram'][0]['NewDataSet'][0]['Resultado'];

            ean.forEach(element=>{

                const detEan:barCode={
                    ean:element.Barras[0].trim(),
                    referencia:element.Referencia[0].trim(),
                    colorId:element.EXT1[0].trim(),
                    colorLabel:element.DESCRIPCION_EXT1[0].trim(),
                    talla:element.EXT2[0].trim()
                };

                res.push(detEan);

            });

            statusServiceResponse.serviceData=res;

        });

        return statusServiceResponse;

    } catch (error) {

        const statusServiceResponse:StatuServiceBarCodeResponse={
            serviceData:[],
            serviceStatusCode:0,
            serviceStatusMessage:'El codigo de barras que busca no está asociado a los recursos de la compañia'
        };

        return statusServiceResponse;
    }
}
export async function getInsertionInformation(op:string):Promise<StatuServiceInsertInfoResponse>{
    try {

        const opList=await getEnableOp(op);

        if(opList.serviceStatusCode===1){

            const barCodeList=await getEnableBarCode(opList.serviceData[0].referencia);
           
            if(barCodeList.serviceStatusCode===1){
                
                var barcodeFiltered:Array<completeDetOp>=[];
                
                opList.serviceData.forEach(element1=>{
                    barCodeList.serviceData.forEach(element2=>{

                        if(element1.talla===element2.talla&&element1.colorId===element2.colorId){
                            const detOp:completeDetOp={
                                op:op,
                                referencia:element2.referencia,
                                talla:element2.talla,
                                ean:element2.ean,
                                colorId:element2.colorId,
                                colorLabel:element2.colorLabel,
                                planeada:element1.planeada,
                                completada:element1.completada,
                                pendiente:0,
                                openBy:''
                            }

                            barcodeFiltered.push(detOp);

                        }
                    });
                });

                if(barcodeFiltered.length===opList.serviceData.length){

                    const statusServiceResponse:StatuServiceInsertInfoResponse={
                        serviceData:barcodeFiltered,
                        serviceStatusCode:1,
                        serviceStatusMessage:'consulta exitosa'
                    }
                    
                    return statusServiceResponse;
                }
                const statusServiceResponse:StatuServiceInsertInfoResponse={
                    serviceData:[],
                    serviceStatusCode:0,
                    serviceStatusMessage:'La información no se pudo obtener de manera integra'
                }
                
                return statusServiceResponse;
            }
            
            const statusServiceResponse:StatuServiceInsertInfoResponse={
                serviceData:[],
                serviceStatusCode:0,
                serviceStatusMessage:'Los codigos de barras no están disponibles'
            }
            
            return statusServiceResponse;
            
        }

        const statusServiceResponse:StatuServiceInsertInfoResponse={
            serviceData:[],
            serviceStatusCode:0,
            serviceStatusMessage:'No se encontró la OP solicitada'
        }

        return statusServiceResponse;
        
    } catch (error) {

        const statusServiceResponse:StatuServiceInsertInfoResponse={
            serviceData:[],
            serviceStatusCode:-1,
            serviceStatusMessage:'Hubo un error en el servidor'
        }

        return statusServiceResponse;
        
    }
}
