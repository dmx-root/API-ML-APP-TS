import dotenv from 'dotenv';
import {PoolOptions} from 'mysql2/promise';

dotenv.config();

export const DBConfig:PoolOptions={
    host:process.env.DBHOST,
    user:process.env.DBUSER,
    password:process.env.DBPASSWORD,
    database:process.env.DBDATABASE,
    port:parseInt(process.env.DBPORT||'3306')
};
