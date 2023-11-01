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
var __classPrivateFieldGet = (this && this.__classPrivateFieldGet) || function (receiver, state, kind, f) {
    if (kind === "a" && !f) throw new TypeError("Private accessor was defined without a getter");
    if (typeof state === "function" ? receiver !== state || !f : !state.has(receiver)) throw new TypeError("Cannot read private member from an object whose class did not declare it");
    return kind === "m" ? f : kind === "a" ? f.call(receiver) : f ? f.value : state.get(receiver);
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
var _DetOpQueve_items;
Object.defineProperty(exports, "__esModule", { value: true });
exports.enquveProcessInsertInfoOp = exports.encryptPassword = exports.comparePassword = exports.runQueve = void 0;
const bcrypt_1 = __importDefault(require("bcrypt"));
const conection_1 = require("../db/conection");
class DetOpQueve {
    constructor() {
        _DetOpQueve_items.set(this, []);
    }
    enqueve(item) {
        __classPrivateFieldGet(this, _DetOpQueve_items, "f").push(item);
    }
    dequeve() {
        return __classPrivateFieldGet(this, _DetOpQueve_items, "f").shift();
    }
    isEmpty() {
        return __classPrivateFieldGet(this, _DetOpQueve_items, "f").length === 0;
    }
}
_DetOpQueve_items = new WeakMap();
const queve = new DetOpQueve();
function runQueve() {
    return __awaiter(this, void 0, void 0, function* () {
        while (!queve.isEmpty()) {
            const fn = queve.dequeve();
            if (fn !== undefined)
                yield fn();
        }
    });
}
exports.runQueve = runQueve;
function comparePassword(hash, password) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            console.log(password, hash);
            const response = yield bcrypt_1.default.compare(password, hash);
            console.log(response);
            if (response) {
                const bacryptResponse = {
                    statusCodeBycrypt: response,
                    statusmessageBcrypt: 'Desencriptación exitosa'
                };
                return bacryptResponse;
            }
            const bacryptResponse = {
                statusCodeBycrypt: response,
                statusmessageBcrypt: 'Falló la desencriptación'
            };
            return bacryptResponse;
        }
        catch (error) {
            console.log(error);
            const bacryptResponse = {
                statusCodeBycrypt: false,
                statusmessageBcrypt: 'Error en el proceso de desencriptación'
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
function enquveProcessInsertInfoOp(detOpList, openBy) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            detOpList.forEach((element, index) => {
                const insertInformation = (message) => __awaiter(this, void 0, void 0, function* () {
                    const [response] = yield conection_1.db.query('CALL SP_MANAGEMENT_ML_DB_OP_OPEN(?,?,?,?,?,?,?,?,?)', [element.op,
                        element.referencia,
                        element.talla,
                        element.ean,
                        element.colorId,
                        element.colorLabel,
                        element.planeada,
                        element.pendiente,
                        openBy]);
                    console.log(message);
                });
                function waitingPromise(message) {
                    return () => {
                        return insertInformation(message);
                    };
                }
                queve.enqueve(waitingPromise(`Ejecuted async function det OP ${index}...`));
            });
        }
        catch (error) {
        }
    });
}
exports.enquveProcessInsertInfoOp = enquveProcessInsertInfoOp;
//# sourceMappingURL=serverHandlers.js.map