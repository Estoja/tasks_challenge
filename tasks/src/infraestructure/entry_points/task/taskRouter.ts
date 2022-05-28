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
        return this._router
                .use('/', (req, res, next ) =>
                        this._taskController.CreateTask(req, res, next)
                    );
    }
}