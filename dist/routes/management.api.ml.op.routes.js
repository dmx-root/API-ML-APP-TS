"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.OpRouter = void 0;
const express_1 = require("express");
const management_api_ml_op_controllers_1 = require("../controllers/management.api.ml.op.controllers");
class OpRouter extends management_api_ml_op_controllers_1.OpControllers {
    constructor() {
        super();
        this.opRouter = (0, express_1.Router)();
        this.inizialicer();
    }
    inizialicer() {
        this.opRouter.get('/complete/:op', this.getOpComplete);
        this.opRouter.post('/openOp/', this.openOp);
    }
}
exports.OpRouter = OpRouter;
//# sourceMappingURL=management.api.ml.op.routes.js.map