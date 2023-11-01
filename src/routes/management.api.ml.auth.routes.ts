import {Router}             from 'express'
import { AuthController }   from '../controllers/management.api.ml.auth.controllers'

export class AuthRouter extends AuthController{
    public authRouther=Router();
    constructor(){
        super();
        this.initializer();
    }
    private initializer(){
        this.authRouther.get('/login/',this.signIn);
        this.authRouther.post('/signup/',this.signUp);
    }
}
