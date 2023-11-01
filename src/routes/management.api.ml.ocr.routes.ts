import {Router} from 'express';
import {OcrControllers} from '../controllers/management.api.ml.ocr.controllers';

export class OcrRouter extends OcrControllers{
    public ocrRouter=Router();
    constructor(){
        super();
        this.inizialicer();
    }

    inizialicer(){
        this.ocrRouter.post('/register/',this.registerOCR);
        this.ocrRouter.get('/getByOp/',this.getBySpeOp);
        this.ocrRouter.put('/checkIn/',this.checkOcr);
    }
}