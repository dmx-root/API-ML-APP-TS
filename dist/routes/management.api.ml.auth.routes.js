"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.AuthRouter = void 0;
const express_1 = require("express");
const management_api_ml_auth_controllers_1 = require("../controllers/management.api.ml.auth.controllers");
class AuthRouter extends management_api_ml_auth_controllers_1.AuthController {
    constructor() {
        super();
        this.authRouther = (0, express_1.Router)();
        this.initializer();
    }
    initializer() {
        this.authRouther.get('/login/', this.signIn);
        this.authRouther.post('/signup/', this.signUp);
    }
}
exports.AuthRouter = AuthRouter;
//# sourceMappingURL=management.api.ml.auth.routes.js.map