import { Convert, Task } from './../../../domain/models/task/task';
import { of, mergeMap } from 'rxjs';
import { CreateTaskUseCase } from '../../../domain/usecase/task/create_task_usecase';
import { Request, Response, NextFunction } from 'express'

export class TaskControllers {
    _createTaskUseCase: CreateTaskUseCase;

    constructor(createTaskUseCase: CreateTaskUseCase) {
        this._createTaskUseCase = createTaskUseCase;
    }

    CreateTask(req: Request<{}, {}, Task>, res: Response, next: NextFunction) {
        of(req.body)
            .pipe(
                    mergeMap(task => this._createTaskUseCase.createNewTask(task))
                )
            .subscribe(createdTask => res.send(Convert.taskToJson(createdTask))
            );
    }
}