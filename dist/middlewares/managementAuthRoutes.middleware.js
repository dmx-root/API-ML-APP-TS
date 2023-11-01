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
exports.authenticateRoutes = void 0;
const conection_1 = require("../db/conection");
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
const dotenv_1 = require("dotenv");
(0, dotenv_1.config)();
// MIDDLERWARE QUE SE ENCARGARÁ DE DAR ACCESO A LAS RUTAS 
function authenticateRoutes(rolArray) {
    const verifyUserExistence = (userId) => __awaiter(this, void 0, void 0, function* () {
        try {
            const [response] = yield conection_1.db.query('CALL SP_MANAGEMENT_ML_DB_USER_GET(?)', [userId]);
            if (response[0][0].RESPONSE === 1) {
                return response[1];
            }
            return null;
        }
        catch (error) {
            console.log(error);
            return null;
        }
    });
    const verifyRoles = () => __awaiter(this, void 0, void 0, function* () {
        try {
            const [roles] = yield conection_1.db.query('call SP_MANAGEMENT_ML_DB_AUTH_ROLES()');
            if (roles[0][0].RESPONSE === 1) {
                return roles[1];
            }
            return null;
        }
        catch (error) {
            console.log(error);
            return null;
        }
    });
    return (req, res, next) => {
        const token = req.header('access-token-auth'); // TOKEN(ID USUARIO Y ROL PERFIL)
        //SE ASEGURA DE QUE SE PROPORCIONE UN TOKEN
        if (rolArray === null)
            return next(); // SE PUEDE ACCEDER DESDE CUALQUIER PERFIL ESTABLECIENDO ROLARRAY EN NULL
        if (!token)
            return res.status(401).json({ message: 'Acceso no autorizado' });
        if (!process.env.SECRETKEY)
            return res.status(401).json({ message: 'Key no proporcionada' });
        jsonwebtoken_1.default.verify(token, process.env.SECRETKEY, (err, decoded) => {
            if (err)
                return res.status(403).send({ message: 'Error de autenticación' });
            if (typeof (decoded) === 'string' || typeof (decoded) === 'undefined')
                return res.status(403).json({ message: 'No se obtuvo los campos esperados en el payload' });
            verifyUserExistence(decoded.id). //SE VERIFICA QUE EL USUARIO PROPORCIONADO EXISTA PARA SESIONES ACTIVAS 
                then(response1 => {
                verifyRoles().then(response2 => {
                    if (response2 === null)
                        return res.status(403).json({ message: 'Roles no disponibles en la base de datos' });
                    rolArray.forEach(element1 => {
                        // if(!response2.some(rol=>rol.profile_label===element1)) return res.status(403).json({ message: 'Rol no existe' });
                    });
                    console.log(response2);
                    next(); // SI LOS ROLES PROPORCIONADOS SON CORRECTOS SE DA ACCESO A LA RUTA
                }).catch(err2 => {
                    console.log(err2);
                    return res.status(403).json({ message: 'Error en la autenticación de roles' });
                });
            }).catch(err1 => {
                console.log(err1);
                return res.status(401).json({ message: 'Error en la autenticación, usuario no encontrado' });
            });
        });
    };
}
exports.authenticateRoutes = authenticateRoutes;
//# sourceMappingURL=managementAuthRoutes.middleware.js.map