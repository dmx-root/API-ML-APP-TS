"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.OcrRouter = void 0;
const express_1 = require("express");
const management_api_ml_ocr_controllers_1 = require("../controllers/management.api.ml.ocr.controllers");
class OcrRouter extends management_api_ml_ocr_controllers_1.OcrControllers {
    constructor() {
        super();
        this.ocrRouter = (0, express_1.Router)();
        this.inizialicer();
    }
    inizialicer() {
        this.ocrRouter.post('/register/', this.registerOCR);
        this.ocrRouter.get('/getByOp/', this.getBySpeOp);
        this.ocrRouter.put('/checkIn/', this.checkOcr);
    }
}
exports.OcrRouter = OcrRouter;
//# sourceMappingURL=management.api.ml.ocr.routes.js.map