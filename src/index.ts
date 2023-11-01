import express, {Application}   from 'express';
import cors, {CorsOptions}      from 'cors';
import morgan                   from 'morgan';
import {config}                 from 'dotenv';
import {Routes}                 from './routes/management.api.ml.index.routes'
config();

export class Server {
    
    private app: Application;
    private port: String;

    constructor(){

        this.app=express();
        this.port=process.env.SERVERPORT||'8080';
        this.config(this.app);
        this.listen();
        new Routes(this.app);
        
    }

    private config(app:Application):void{
        const corsConfig:CorsOptions={
            origin:`http://localhost:${this.port}`
        };
        app.use(cors(corsConfig));
        app.use(express.json());
        app.use(express.urlencoded({extended:true}));
        app.use(morgan('dev'));
    }

    private listen(){
        this.app.listen(this.port,()=>{
            console.log(`The server ir running on port ${this.port}...`);
        })
        .on("error", (err: any) => {
            if (err.code === "EADDRINUSE") {
              console.log("Error: address already in use");
            } else {
              console.log(err);
            }
        });
    }
}