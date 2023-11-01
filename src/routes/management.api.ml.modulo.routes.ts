import { ModuloControllers } from '../controllers/management.api.ml.modulo.controllers';
import {Router} from 'express';


export class ModuloRouter extends ModuloControllers{
    public moduloRouter=Router();
    constructor(){
        super();
        this.inizialicer();
    }

    inizialicer(){
        this.moduloRouter.get('/get/:moduloId',this.getModuloInformation);
    
    }
}