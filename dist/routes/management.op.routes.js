"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.OPRouter = void 0;
const express_1 = __importDefault(require("express"));
const management_op_controllers_1 = require("../controllers/management.op.controllers");
const ObjectOP = new management_op_controllers_1.OPControllers();
exports.OPRouter = express_1.default.Router();
exports.OPRouter.post('/', ObjectOP.post);
exports.OPRouter.get('/', ObjectOP.get);
exports.OPRouter.patch('/', ObjectOP.update);
exports.OPRouter.delete('/', ObjectOP.delete);
//# sourceMappingURL=management.op.routes.js.map