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
exports.UserControllers = void 0;
const conection_1 = require("../db/conection");
class UserControllers {
    getSesion(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { userDocumentId } = req.params;
            try {
                if (!userDocumentId) {
                    const apiResponse = {
                        data: null,
                        statusCodeApi: -1,
                        statusMessageApi: 'No se obtuvieron los campos esperados'
                    };
                    return res.status(200).json(apiResponse);
                }
                const [response] = yield conection_1.db.query('CALL SP_MANAGEMENT_ML_DB_SESION(?)', [userDocumentId]);
                if (response[0][0].RESPONSE === -1) {
                    const apiResponse = {
                        data: null,
                        statusCodeApi: 1,
                        statusMessageApi: 'Hubo un error con las consultas de la base de datos'
                    };
                    return res.status(200).json(apiResponse);
                }
                const apiResponse = {
                    data: {
                        opList: response[1],
                        ocrList: response[2],
                        anomalyList: response[3],
                        tallaList: response[4],
                        moduloList: response[5]
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
exports.UserControllers = UserControllers;
//# sourceMappingURL=management.api.ml.user.controllers.js.map