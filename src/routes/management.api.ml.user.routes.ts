import {Router} from 'express';
import {UserControllers} from '../controllers/management.api.ml.user.controllers';
import {authenticateRoutes} from '../middlewares/managementAuthRoutes.middleware';

export class UserRouter extends UserControllers{
    public userRouter=Router();
    constructor(){
        super();
        this.inizialicer();
    }

    inizialicer(){
        this.userRouter.get('/get/:userDocumentId',[authenticateRoutes([])],this.getSesion);
    }
}