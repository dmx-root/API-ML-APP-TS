"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ModuloRouter = void 0;
const management_api_ml_modulo_controllers_1 = require("../controllers/management.api.ml.modulo.controllers");
const express_1 = require("express");
class ModuloRouter extends management_api_ml_modulo_controllers_1.ModuloControllers {
    constructor() {
        super();
        this.moduloRouter = (0, express_1.Router)();
        this.inizialicer();
    }
    inizialicer() {
        this.moduloRouter.get('/get/:moduloId', this.getModuloInformation);
    }
}
exports.ModuloRouter = ModuloRouter;
//# sourceMappingURL=management.api.ml.modulo.routes.js.map