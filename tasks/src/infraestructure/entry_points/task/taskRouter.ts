import { TaskGateway } from './../../../domain/models/task/gateway/task_gateway';
import express, { Router } from 'express'
import { CreateTaskUseCase } from '../../../domain/usecase/task/create_task_usecase';
import { TaskControllers } from './task_controller';

export class TaskRouter {
    private _createTaskUsecase: CreateTaskUseCase;
    private _taskController: TaskControllers;
    private _router: Router;

    constructor(createTaskUsecase: CreateTaskUseCase) {
        this._createTaskUsecase = createTaskUsecase;
        this._taskController = new TaskControllers(this._createTaskUsecase);
        this._router = express.Router();
    }

    getRouter() {
        console.log("taskRouter");
        console.log(this._taskController._createTaskUseCase);
        return this._router.use('/', this._taskController.CreateTask);
    }
}