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
exports.ModuloControllers = void 0;
const conection_1 = require("../db/conection");
class ModuloControllers {
    getModuloInformation(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { moduloId } = req.params;
            try {
                if (!moduloId) {
                    const apiResponse = {
                        data: null,
                        statusCodeApi: -1,
                        statusMessageApi: 'No se obtuvieon los campos esperados'
                    };
                    return res.status(200).json(apiResponse);
                }
                const [response] = yield conection_1.db.query('CALL SP_MANAGEMENT_ML_DB_MODULO_GET(?)', [moduloId]);
                if (response[0][0].RESPONSE === -1) {
                    const apiResponse = {
                        data: null,
                        statusCodeApi: -1,
                        statusMessageApi: 'Hubo un error a la hora de hacer la consulta a la base de datos'
                    };
                    return res.status(500).json(apiResponse);
                }
                if (response[0][0].RESPONSE === 0) {
                    const apiResponse = {
                        data: null,
                        statusCodeApi: 0,
                        statusMessageApi: 'No se encotró el módulo'
                    };
                }
                const apiResponse = {
                    data: {
                        moduloInformation: response[1],
                        ocrList: response[2]
                    },
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
}
exports.ModuloControllers = ModuloControllers;
//# sourceMappingURL=management.api.ml.modulo.controllers.js.map