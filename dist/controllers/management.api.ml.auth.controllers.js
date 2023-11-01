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
exports.AuthController = void 0;
const serverHandlers_1 = require("../handlers/serverHandlers");
const conection_1 = require("../db/conection");
const queryWebService_service_1 = require("../services/queryWebService.service");
const serverHandlers_2 = require("../handlers/serverHandlers");
const jsonwebtoken_1 = require("jsonwebtoken");
class AuthController {
    signIn(req, res) {
        var _a, _b;
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const documentId = (_a = req.query.documentId) === null || _a === void 0 ? void 0 : _a.toString();
                const password = (_b = req.query.password) === null || _b === void 0 ? void 0 : _b.toString();
                if (!documentId && !password) {
                    const apiResponse = {
                        statusCodeApi: 0,
                        statusMessageApi: 'Argumentos de entrada no proporcionados'
                    };
                    return res.status(400).json(apiResponse);
                }
                const [userResponse] = yield conection_1.db.query('CALL SP_MANAGEMENT_ML_DB_USER_GET(?)', [documentId]);
                if (userResponse[0].RESPONSE === 0) {
                    const apiResponse = {
                        statusCodeApi: 0,
                        statusMessageApi: 'Documento Incorrecto'
                    };
                    return res.status(200).json(apiResponse);
                }
                else {
                    const authPass = yield (0, serverHandlers_1.comparePassword)(userResponse[1][0].user_password, password === undefined ? 'none' : password);
                    if (authPass.statusCodeBycrypt) {
                        let key = '';
                        !process.env.SECRETKEY ? key = '' : key = process.env.SECRETKEY;
                        const token = (0, jsonwebtoken_1.sign)({ id: documentId, role: userResponse[1][0].profile_id }, key, {
                            expiresIn: 604800 //una semana,
                        });
                        const apiResponse = {
                            statusCodeApi: 1,
                            statusMessageApi: 'Consulta exitosa',
                            data: userResponse[1],
                            token
                        };
                        return res.status(200).json(apiResponse);
                    }
                    const apiResponse = {
                        statusCodeApi: 0,
                        statusMessageApi: 'Contraseña incorrecta'
                    };
                    return res.status(200).json(apiResponse);
                }
            }
            catch (error) {
                console.log(error);
                const apiErrorResponse = {
                    statusCodeApi: -1,
                    statusMessageApi: 'Error de servidor'
                };
                res.status(500).json(apiErrorResponse);
            }
        });
    }
    signUp(req, res) {
        var _a, _b;
        return __awaiter(this, void 0, void 0, function* () {
            const { password, documentId, profile, documentType, createBy } = req.body;
            try {
                const dataUserResponse = yield (0, queryWebService_service_1.getEnableUsers)(documentId);
                // console.log(dataUserResponse)
                if (dataUserResponse.serviceStatusCode) {
                    const hash = yield (0, serverHandlers_2.encryptPassword)(password);
                    if (hash.statusCodeBycrypt) {
                        const [registerResponse] = yield conection_1.db.query('CALL SP_MANAGEMENT_ML_DB_USER_REGISTER(?,?,?,?,?,?,?)', [(_a = dataUserResponse.serviceData) === null || _a === void 0 ? void 0 : _a.userName, hash.data, documentId, (_b = dataUserResponse.serviceData) === null || _b === void 0 ? void 0 : _b.description, profile, documentType, createBy]);
                        if (registerResponse[0][0].RESPONSE === 1) {
                            const apiResponse = {
                                data: registerResponse[1],
                                token: '',
                                statusCodeApi: 1,
                                statusMessageApi: 'Usuario creado'
                            };
                            return res.status(200).json(apiResponse);
                        }
                        ;
                        const apiResponse = {
                            statusCodeApi: 0,
                            statusMessageApi: 'El usuario ya existe'
                        };
                        return res.status(200).json(apiResponse);
                    }
                    const apiResponse = {
                        statusCodeApi: 0,
                        statusMessageApi: hash.statusmessageBcrypt
                    };
                    return res.status(400).json(apiResponse);
                }
                const apiResponse = {
                    statusCodeApi: 0,
                    statusMessageApi: dataUserResponse.serviceStatusMessage
                };
                return res.status(400).json(apiResponse);
            }
            catch (error) {
                console.log(error);
            }
        });
    }
}
exports.AuthController = AuthController;
//# sourceMappingURL=management.api.ml.auth.controllers.js.map