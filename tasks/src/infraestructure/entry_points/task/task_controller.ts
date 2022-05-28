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
        console.log(req);
        const aux = {
            id: '',
            title: 'String;',
            description: "String;",
            keyWords: ['hola'],
            finalPrice: 12,
            count: 1,
            state: "String;",
            client: {
                id: "1",
                proposed_price: 12,
                review: "asdfasdf",
                score: 2
            },
            doer:{
                id: "1",
                proposed_price: 12,
                review: "asdfasdf",
                score: 2
            },
            scheduleDate: new Date(),
            createdDate: new Date(),
            duration: 0
        } as Task;
        req.body = aux;
        of(req.body)
            .pipe(
                    mergeMap(task => this._createTaskUseCase.createNewTask(task))
                )
            .subscribe(createdTask => res.send(Convert.taskToJson(createdTask))
            );
    }
}