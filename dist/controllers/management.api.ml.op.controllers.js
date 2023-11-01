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
Object.defineProperty(exports, "__esModule", { value: true });
exports.OpControllers = void 0;
const queryWebService_service_1 = require("../services/queryWebService.service");
const serverHandlers_1 = require("../handlers/serverHandlers");
const conection_1 = require("../db/conection");
class OpControllers {
    openOp(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const { op, openById } = req.body;
                const [opResponse] = yield conection_1.db.query('CALL SP_MANAGEMENT_ML_DB_OP_GET_COMPLETE(?)', [op]);
                if (opResponse[0][0].RESPONSE === 1) {
                    const apiResponse = {
                        data: opResponse[1],
                        statusCodeApi: 1,
                        statusMessageApi: 'Consulta exitosa'
                    };
                    return res.status(200).json(apiResponse);
                }
                else if (opResponse[0][0].RESPONSE === -1) {
                    const apiResponse = {
                        data: null,
                        statusCodeApi: -1,
                        statusMessageApi: 'Hubo un problema con la consulta a la base de datos'
                    };
                    return res.status(200).json(apiResponse);
                }
                else if (opResponse[0][0].RESPONSE === 0) {
                    const response = yield (0, queryWebService_service_1.getInsertionInformation)(op);
                    if (response.serviceStatusCode === 1) {
                        yield (0, serverHandlers_1.enquveProcessInsertInfoOp)(response.serviceData, openById);
                        (0, serverHandlers_1.runQueve)();
                        const apiResponse = {
                            data: null,
                            statusCodeApi: 0,
                            statusMessageApi: 'datos ingresados'
                        };
                        return res.status(200).json(apiResponse);
                    }
                    const apiResponse = {
                        data: null,
                        statusCodeApi: 0,
                        statusMessageApi: 'Hubo un problema con la insersión de datos'
                    };
                    return res.status(200).json(apiResponse);
                }
                return res;
            }
            catch (error) {
                console.log(error);
                const apiResponse = {
                    data: null,
                    statusCodeApi: 0,
                    statusMessageApi: 'Hubo un problema con la insersión de datos'
                };
                return res.status(200).json(apiResponse);
            }
        });
    }
    getOpComplete(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const { op } = req.params;
                if (!op) {
                    const apiResponse = {
                        data: null,
                        statusCodeApi: -1,
                        statusMessageApi: 'Error de servidor, no se obtuvieron los campos esperados'
                    };
                    return res.status(500).json(apiResponse);
                }
                const [opResponse] = yield conection_1.db.query('CALL SP_MANAGEMENT_ML_DB_OP_GET_COMPLETE(?)', [op]);
                if (opResponse[0][0].RESPONSE === 0) {
                    const apiResponse = {
                        data: null,
                        statusCodeApi: 0,
                        statusMessageApi: 'No se encontro la OP ingresada'
                    };
                    return res.status(200).json(apiResponse);
                }
                if (opResponse[0][0].RESPONSE === -1) {
                    const apiResponse = {
                        data: null,
                        statusCodeApi: -1,
                        statusMessageApi: 'Hubo un error intentando conectarse a la base de datos'
                    };
                    return res.status(500).json(apiResponse);
                }
                const apiResponse = {
                    data: opResponse[1],
                    statusCodeApi: 1,
                    statusMessageApi: 'Consulta exitosa'
                };
                return res.status(200).json(apiResponse);
            }
            catch (error) {
                return res.status(500).json({});
            }
        });
    }
}
exports.OpControllers = OpControllers;
//# sourceMappingURL=management.api.ml.op.controllers.js.map