"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Server = void 0;
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const morgan_1 = __importDefault(require("morgan"));
const dotenv_1 = require("dotenv");
const management_api_ml_index_routes_1 = require("./routes/management.api.ml.index.routes");
(0, dotenv_1.config)();
class Server {
    constructor() {
        this.app = (0, express_1.default)();
        this.port = process.env.SERVERPORT || '8080';
        this.config(this.app);
        this.listen();
        new management_api_ml_index_routes_1.Routes(this.app);
    }
    config(app) {
        const corsConfig = {
            origin: `http://localhost:${this.port}`
        };
        app.use((0, cors_1.default)(corsConfig));
        app.use(express_1.default.json());
        app.use(express_1.default.urlencoded({ extended: true }));
        app.use((0, morgan_1.default)('dev'));
    }
    listen() {
        this.app.listen(this.port, () => {
            console.log(`The server ir running on port ${this.port}...`);
        })
            .on("error", (err) => {
            if (err.code === "EADDRINUSE") {
                console.log("Error: address already in use");
            }
            else {
                console.log(err);
            }
        });
    }
}
exports.Server = Server;
//# sourceMappingURL=index.js.map