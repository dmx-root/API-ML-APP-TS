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
exports.OcrControllers = void 0;
const conection_1 = require("../db/conection");
class OcrControllers {
    registerOCR(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const { startTime, finishTime, registerById, moduloId, unitsCant, colorId, tallaId, opId, anomalyCode, categoryId } = req.body;
                if (!startTime || !finishTime || !registerById || !moduloId || !unitsCant || !colorId || !tallaId || !opId || !categoryId) {
                    const apiResponse = {
                        ocrId: null,
                        statusCodeApi: -1,
                        statusMessageApi: 'Error de servidor, no se obtuvieron los campos necesarios'
                    };
                    return res.status(200).json(apiResponse);
                }
                const [response] = yield conection_1.db.query('CALL SP_MANAGEMENT_ML_DB_OCR_REGISTER(?,?,?,?,?,?,?,?,?,?)', [startTime.slice(0, 8), finishTime.slice(0, 8), registerById, moduloId, unitsCant, colorId, tallaId, opId, anomalyCode, categoryId]);
                if (response[0][0].RESPONSE === 0) {
                    const apiResponse = {
                        ocrId: null,
                        statusCodeApi: 0,
                        statusMessageApi: 'No se encontró el detalle de la op ingresado'
                    };
                    return res.status(200).json(apiResponse);
                }
                const apiResponse = {
                    ocrId: response[1][0].ocr_id,
                    statusCodeApi: 1,
                    statusMessageApi: 'Consulta exitosa'
                };
                return res.status(200).json(apiResponse);
            }
            catch (error) {
                const apiResponse = {
                    ocrId: null,
                    statusCodeApi: -1,
                    statusMessageApi: 'Error de servidor'
                };
                return res.status(500).json(apiResponse);
            }
        });
    }
    getBySpeOp(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { op, color, talla } = req.query;
            try {
                if (!op || !color || !talla) {
                    const apiResponse = {
                        data: null,
                        statusCodeApi: -1,
                        statusMessageApi: 'No se obtuvieron los campos necesarios'
                    };
                    return res.status(200).json(apiResponse);
                }
                const [response] = yield conection_1.db.query('CALL SP_MANAGEMENT_ML_DB_OCR_GET_ALL_BY_SPE_OP(?,?,?)', [op, color, talla]);
                if (response[0][0].RESPONSE === -1) {
                    const apiResponse = {
                        data: null,
                        statusCodeApi: -1,
                        statusMessageApi: 'Hubo un error con la conexión a la base de datos'
                    };
                    return res.status(200).json(apiResponse);
                }
                if (response[0][0].RESPONSE === 0) {
                    const apiResponse = {
                        data: null,
                        statusCodeApi: 0,
                        statusMessageApi: 'la OP seleccionada no se encotró'
                    };
                    return res.status(200).json(apiResponse);
                }
                console.log(op, color, talla);
                const apiResponse = {
                    data: response[1],
                    statusCodeApi: 1,
                    statusMessageApi: 'Consulta exitosa'
                };
                return res.status(200).json(apiResponse);
            }
            catch (error) {
                console.log(error);
                const apiResponse = {
                    data: null,
                    statusCodeApi: -1,
                    statusMessageApi: 'Error de servidor'
                };
                return res.status(500).json(apiResponse);
            }
        });
    }
    checkOcr(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { ocrId, documentId } = req.body;
            try {
                if (!ocrId || !documentId) {
                    const apiResponse = {
                        statusCodeApi: -1,
                        statusMessageApi: 'No se obtuvieron los campos esperados'
                    };
                    return res.status(200).json(apiResponse);
                }
                const [response] = yield conection_1.db.query('CALL SP_MANAGEMENT_ML_DB_OCR_CHECK_IN(?,?)', [ocrId, documentId]);
                if (response[0].RESPONSE === 0) {
                    const apiResponse = {
                        statusCodeApi: 0,
                        statusMessageApi: 'No se encontró la OCR especicicada'
                    };
                    return res.status(200).json(apiResponse);
                }
                if (response[0].RESPONSE === -1) {
                    const apiResponse = {
                        statusCodeApi: -1,
                        statusMessageApi: 'Error de servidor. Hubo un error al consultar a la base de datos '
                    };
                    return res.status(200).json(apiResponse);
                }
                const apiResponse = {
                    statusCodeApi: 1,
                    statusMessageApi: 'Consulta exitosa'
                };
                return res.status(200).json(apiResponse);
            }
            catch (error) {
                const apiResponse = {
                    statusCodeApi: -1,
                    statusMessageApi: 'Error de servidor'
                };
                return res.status(500).json(apiResponse);
            }
        });
    }
}
exports.OcrControllers = OcrControllers;
//# sourceMappingURL=management.api.ml.ocr.controllers.js.map