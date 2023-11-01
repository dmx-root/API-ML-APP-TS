"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.usersRouter = void 0;
const express_1 = __importDefault(require("express"));
const management_users_controllers_1 = require("../controllers/management.users.controllers");
const ObjectUser = new management_users_controllers_1.UserControllers();
exports.usersRouter = express_1.default.Router();
exports.usersRouter.get('/:documentId', ObjectUser.userAcces);
//# sourceMappingURL=management.users.routes.js.map