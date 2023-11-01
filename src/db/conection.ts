import {createPool} from 'mysql2/promise'
import {DBConfig} from './config'

export const db =createPool(DBConfig);