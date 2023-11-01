"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const dotenv_1 = __importDefault(require("dotenv"));
const morgan_1 = __importDefault(require("morgan"));
const management_users_routes_1 = require("./routes/management.users.routes");
dotenv_1.default.config();
const app = (0, express_1.default)();
const USER_URI = '/api/ml/user/';
const OP_URI = '/api/ml/op';
const OCR_URI = '/api/ml/ocr';
const MODULO_URI = '/api/ml/modulo';
const EMPLOYEES_URI = '/api/ml/employees';
const ANOMALY_URI = '/api/ml/anomaly';
app.set('port', process.env.SERVERPORT);
app.use((0, morgan_1.default)('dev'));
app.use(express_1.default.json());
app.use(USER_URI, management_users_routes_1.usersRouter);
// app.use(OP_URI,OPRouter);
exports.default = app;
//# sourceMappingURL=app.js.map