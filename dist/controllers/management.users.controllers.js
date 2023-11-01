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
    userCreate(res, req) {
        return __awaiter(this, void 0, void 0, function* () {
            return res.json({});
        });
    }
    userAcces(res, req) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                // const {userDocument}=req.query;
                console.log(req.query);
                // type user={
                //     nombre:string,
                //     edad:number
                // }
                const [row] = yield conection_1.db.query('CALL SP_MANAGEMENT_USER_GET(?)', [1146441925]);
                // console.log(row[0][0].user_document_id);
            }
            catch (error) {
                console.log(error);
            }
            return res.json({});
        });
    }
    UserAuth(res, req) {
        return __awaiter(this, void 0, void 0, function* () {
        });
    }
    userDisable(res, req) {
        return __awaiter(this, void 0, void 0, function* () {
        });
    }
}
exports.UserControllers = UserControllers;
//# sourceMappingURL=management.users.controllers.js.map