"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Routes = void 0;
const management_api_ml_op_routes_1 = require("./management.api.ml.op.routes");
const management_api_ml_ocr_routes_1 = require("./management.api.ml.ocr.routes");
const management_api_ml_auth_routes_1 = require("./management.api.ml.auth.routes");
const management_api_ml_user_routes_1 = require("./management.api.ml.user.routes");
const management_api_ml_modulo_routes_1 = require("./management.api.ml.modulo.routes");
class Routes {
    constructor(app) {
        this.opRouter = new management_api_ml_op_routes_1.OpRouter().opRouter;
        this.ocrRouter = new management_api_ml_ocr_routes_1.OcrRouter().ocrRouter;
        this.authRouter = new management_api_ml_auth_routes_1.AuthRouter().authRouther;
        this.userRouter = new management_api_ml_user_routes_1.UserRouter().userRouter;
        this.moduloRouter = new management_api_ml_modulo_routes_1.ModuloRouter().moduloRouter;
        app.use('/api/ml/op/', this.opRouter);
        app.use('/api/ml/ocr/', this.ocrRouter);
        app.use('/api/ml/auth/', this.authRouter);
        app.use('/api/ml/user/sesion/', this.userRouter);
        app.use('/api/ml/modulo/', this.moduloRouter);
    }
}
exports.Routes = Routes;
//# sourceMappingURL=management.api.ml.index.routes.js.map