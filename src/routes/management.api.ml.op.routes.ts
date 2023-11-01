import {Router} from 'express';
import {OpControllers} from '../controllers/management.api.ml.op.controllers';

export class OpRouter extends OpControllers {
    public opRouter=Router();
    constructor(){
        super();
        this.inizialicer();
    }
    private inizialicer(){
        this.opRouter.get('/complete/:op',this.getOpComplete);
        this.opRouter.post('/openOp/',this.openOp);
    }
}