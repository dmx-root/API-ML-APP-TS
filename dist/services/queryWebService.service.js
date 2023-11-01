"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.getInsertionInformation = exports.getEnableBarCode = exports.getEnableOp = exports.getEnableUsers = void 0;
const axios_1 = __importDefault(require("axios"));
const dotenv_1 = require("dotenv");
const xml2js_1 = require("xml2js");
(0, dotenv_1.config)();
function getEnableUsers(document) {
    return __awaiter(this, void 0, void 0, function* () {
        const userdata = `<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:tem="http://tempuri.org/">\n   
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
            const statusServiceResponse = {
                serviceData: null,
                serviceStatusCode: 1,
                serviceStatusMessage: 'Consulta exitosa'
            };
            const axiosConfig = {
                method: 'post',
                url: process.env.URL_WS,
                headers: {
                    "Content-Type": 'text/xml;charset=UTF-8',
                    'SOAPAction': 'http://tempuri.org/EjecutarConsultaXML'
                },
                data: userdata
            };
            const dataResponse = yield (0, axios_1.default)(axiosConfig);
            (0, xml2js_1.parseString)(dataResponse.data, function (err, result) {
                const user = result['soap:Envelope']['soap:Body'][0]['EjecutarConsultaXMLResponse'][0]['EjecutarConsultaXMLResult'][0]['diffgr:diffgram'][0]['NewDataSet'][0]['Resultado'];
                const newUser = {
                    typeId: user[0].TIPO_ID[0],
                    documetId: user[0].CC[0],
                    userName: user[0].NOMBRE[0],
                    description: user[0].Descripcion[0]
                };
                statusServiceResponse.serviceData = newUser;
            });
            return statusServiceResponse;
        }
        catch (error) {
            const statusServiceResponse = {
                serviceData: null,
                serviceStatusCode: 0,
                serviceStatusMessage: 'Usuario no asociado a los recursos de la compañía'
            };
            return statusServiceResponse;
        }
    });
}
exports.getEnableUsers = getEnableUsers;
function getEnableOp(op) {
    return __awaiter(this, void 0, void 0, function* () {
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
            const statusServiceResponse = {
                serviceData: [],
                serviceStatusCode: 1,
                serviceStatusMessage: 'Consulta exitosa'
            };
            var config = {
                method: 'post',
                url: process.env.URL_WS,
                headers: {
                    'Content-Type': 'text/xml;charset=UTF-8',
                    'SOAPAction': 'http://tempuri.org/EjecutarConsultaXML'
                },
                data: data
            };
            const response = yield (0, axios_1.default)(config);
            var res = [];
            (0, xml2js_1.parseString)(response.data, function (err, result) {
                const ops = result['soap:Envelope']['soap:Body'][0]['EjecutarConsultaXMLResponse'][0]['EjecutarConsultaXMLResult'][0]['diffgr:diffgram'][0]['NewDataSet'][0]['Resultado'];
                ops.forEach((element) => {
                    const detOp = {
                        op: element.OP[0].trim(),
                        referencia: element.Referencia[0].trim(),
                        colorId: element.Id_Color[0].trim(),
                        colorLabel: element.Color[0].trim(),
                        talla: element.Talla[0].trim(),
                        planeada: parseInt(element.Planeada[0].trim()),
                        completada: parseInt(element.Completada[0].trim()),
                        pendiente: parseInt(element.Pendiente[0].trim())
                    };
                    res.push(detOp);
                });
                statusServiceResponse.serviceData = res;
            });
            return statusServiceResponse;
        }
        catch (error) {
            const statusServiceResponse = {
                serviceData: [],
                serviceStatusCode: -1,
                serviceStatusMessage: 'Error de consulta'
            };
            return statusServiceResponse;
        }
    });
}
exports.getEnableOp = getEnableOp;
function getEnableBarCode(reference) {
    return __awaiter(this, void 0, void 0, function* () {
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
            const statusServiceResponse = {
                serviceData: [],
                serviceStatusCode: 1,
                serviceStatusMessage: 'Consulta exitosa'
            };
            var config = {
                method: 'post',
                url: 'http://autogestion.feriadelbrasier.com.co/WSUNOEE/WSUNOEE.asmx',
                headers: {
                    'Content-Type': 'text/xml;charset=UTF-8',
                    'SOAPAction': 'http://tempuri.org/EjecutarConsultaXML'
                },
                data: data
            };
            var res = [];
            const response = yield (0, axios_1.default)(config);
            (0, xml2js_1.parseString)(response.data, function (err, result) {
                const ean = result['soap:Envelope']['soap:Body'][0]['EjecutarConsultaXMLResponse'][0]['EjecutarConsultaXMLResult'][0]['diffgr:diffgram'][0]['NewDataSet'][0]['Resultado'];
                ean.forEach(element => {
                    const detEan = {
                        ean: element.Barras[0].trim(),
                        referencia: element.Referencia[0].trim(),
                        colorId: element.EXT1[0].trim(),
                        colorLabel: element.DESCRIPCION_EXT1[0].trim(),
                        talla: element.EXT2[0].trim()
                    };
                    res.push(detEan);
                });
                statusServiceResponse.serviceData = res;
            });
            return statusServiceResponse;
        }
        catch (error) {
            const statusServiceResponse = {
                serviceData: [],
                serviceStatusCode: 0,
                serviceStatusMessage: 'El codigo de barras que busca no está asociado a los recursos de la compañia'
            };
            return statusServiceResponse;
        }
    });
}
exports.getEnableBarCode = getEnableBarCode;
function getInsertionInformation(op) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const opList = yield getEnableOp(op);
            if (opList.serviceStatusCode === 1) {
                const barCodeList = yield getEnableBarCode(opList.serviceData[0].referencia);
                if (barCodeList.serviceStatusCode === 1) {
                    var barcodeFiltered = [];
                    opList.serviceData.forEach(element1 => {
                        barCodeList.serviceData.forEach(element2 => {
                            if (element1.talla === element2.talla && element1.colorId === element2.colorId) {
                                const detOp = {
                                    op: op,
                                    referencia: element2.referencia,
                                    talla: element2.talla,
                                    ean: element2.ean,
                                    colorId: element2.colorId,
                                    colorLabel: element2.colorLabel,
                                    planeada: element1.planeada,
                                    completada: element1.completada,
                                    pendiente: 0,
                                    openBy: ''
                                };
                                barcodeFiltered.push(detOp);
                            }
                        });
                    });
                    if (barcodeFiltered.length === opList.serviceData.length) {
                        const statusServiceResponse = {
                            serviceData: barcodeFiltered,
                            serviceStatusCode: 1,
                            serviceStatusMessage: 'consulta exitosa'
                        };
                        return statusServiceResponse;
                    }
                    const statusServiceResponse = {
                        serviceData: [],
                        serviceStatusCode: 0,
                        serviceStatusMessage: 'La información no se pudo obtener de manera integra'
                    };
                    return statusServiceResponse;
                }
                const statusServiceResponse = {
                    serviceData: [],
                    serviceStatusCode: 0,
                    serviceStatusMessage: 'Los codigos de barras no están disponibles'
                };
                return statusServiceResponse;
            }
            const statusServiceResponse = {
                serviceData: [],
                serviceStatusCode: 0,
                serviceStatusMessage: 'No se encontró la OP solicitada'
            };
            return statusServiceResponse;
        }
        catch (error) {
            const statusServiceResponse = {
                serviceData: [],
                serviceStatusCode: -1,
                serviceStatusMessage: 'Hubo un error en el servidor'
            };
            return statusServiceResponse;
        }
    });
}
exports.getInsertionInformation = getInsertionInformation;
//# sourceMappingURL=queryWebService.service.js.map