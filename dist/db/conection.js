"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.db = void 0;
const promise_1 = require("mysql2/promise");
const config_1 = require("./config");
exports.db = (0, promise_1.createPool)(config_1.DBConfig);
//# sourceMappingURL=conection.js.map