"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.UserRouter = void 0;
const express_1 = require("express");
const management_api_ml_user_controllers_1 = require("../controllers/management.api.ml.user.controllers");
const managementAuthRoutes_middleware_1 = require("../middlewares/managementAuthRoutes.middleware");
class UserRouter extends management_api_ml_user_controllers_1.UserControllers {
    constructor() {
        super();
        this.userRouter = (0, express_1.Router)();
        this.inizialicer();
    }
    inizialicer() {
        this.userRouter.get('/get/:userDocumentId', [(0, managementAuthRoutes_middleware_1.authenticateRoutes)([])], this.getSesion);
    }
}
exports.UserRouter = UserRouter;
//# sourceMappingURL=management.api.ml.user.routes.js.map