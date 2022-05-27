import { Task } from './../../../domain/models/task/task';
import { Observable, of, mergeMap, map } from 'rxjs';
import { CreateTaskUseCase } from './../../../domain/usecase/task/create_task_usecase';
import { Request } from 'express';

export class CreateTaskHandler {
    private _createTaskUseCase: CreateTaskUseCase;

    constructor(createTaskUseCase: CreateTaskUseCase) {
        this._createTaskUseCase = createTaskUseCase;
    }

    CreateTask(req: Request<Task>): Observable<Task> {
        return of(req.body).pipe(
            mergeMap(task => this._createTaskUseCase.createNewTask(task))
        )
    }
}