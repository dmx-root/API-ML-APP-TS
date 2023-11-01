import {Application}        from 'express';
import {OpRouter}           from './management.api.ml.op.routes';
import {OcrRouter}          from './management.api.ml.ocr.routes';
import {AuthRouter}         from './management.api.ml.auth.routes';
import {UserRouter}         from './management.api.ml.user.routes';
import {ModuloRouter}       from './management.api.ml.modulo.routes';

export class Routes {
    private opRouter=new OpRouter().opRouter;
    private ocrRouter=new OcrRouter().ocrRouter;
    private authRouter=new AuthRouter().authRouther;
    private userRouter=new UserRouter().userRouter;
    private moduloRouter=new ModuloRouter().moduloRouter;
    
    constructor(app:Application){
        app.use('/api/ml/op/',this.opRouter);
        app.use('/api/ml/ocr/',this.ocrRouter);
        app.use('/api/ml/auth/',this.authRouter);
        app.use('/api/ml/user/sesion/',this.userRouter);
        app.use('/api/ml/modulo/',this.moduloRouter);
    }
}