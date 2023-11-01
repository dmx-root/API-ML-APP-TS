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
exports.encryptPassword = exports.comparePassword = void 0;
const bcrypt_1 = __importDefault(require("bcrypt"));
function comparePassword(password, hash) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const response = yield bcrypt_1.default.compare(password, hash);
            const bacryptResponse = {
                statusCodeBycrypt: response,
                statusmessageBcrypt: 'Codificación exitosa'
            };
            return bacryptResponse;
        }
        catch (error) {
            console.log(error);
            const bacryptResponse = {
                statusCodeBycrypt: false,
                statusmessageBcrypt: 'Codificación exitosa'
            };
            return bacryptResponse;
        }
    });
}
exports.comparePassword = comparePassword;
function encryptPassword(password) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const response = yield bcrypt_1.default.hash(password, 10);
            const bacryptResponse = {
                data: response,
                statusCodeBycrypt: true,
                statusmessageBcrypt: 'Contaseña encriptada'
            };
            return bacryptResponse;
        }
        catch (error) {
            console.log(error);
            const bacryptResponse = {
                data: null,
                statusCodeBycrypt: false,
                statusmessageBcrypt: 'Error en encriptación de contraseña'
            };
            return bacryptResponse;
        }
    });
}
exports.encryptPassword = encryptPassword;
//# sourceMappingURL=queryWebService.handler.js.map