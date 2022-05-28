import { Convert, Task } from './../../../domain/models/task/task';
import { of, mergeMap } from 'rxjs';
import { CreateTaskUseCase } from '../../../domain/usecase/task/create_task_usecase';
import { Request, Response, NextFunction } from 'express'

export class TaskControllers {
    _createTaskUseCase: CreateTaskUseCase;

    constructor(createTaskUseCase: CreateTaskUseCase) {
        this._createTaskUseCase = createTaskUseCase;
        console.log('HOLA CONSTRUCTOR');
        console.log(this._createTaskUseCase);
    }

    CreateTask(req: Request<Task>, res: Response, next: NextFunction) {
        // console.log('HOLA');
        // //console.log(this._createTaskUseCase);
        // const aux = {
        //     id: '',
        //     title: 'String;',
        //     description: "String;",
        //     keyWords: ['hola'],
        //     finalPrice: 12,
        //     count: 1,
        //     state: "String;",
        //     client: {
        //         id: "1",
        //         proposed_price: 12,
        //         review: "asdfasdf",
        //         score: 2
        //     },
        //     doer:{
        //         id: "1",
        //         proposed_price: 12,
        //         review: "asdfasdf",
        //         score: 2
        //     },
        //     scheduleDate: new Date(),
        //     createdDate: new Date(),
        //     duration: 0
        // } as Task;
        // this._createTaskUseCase.createNewTask(aux).subscribe(x => console.log('DANIEL'))
        // if(this._createTaskUseCase.createNewTask(aux) === undefined) {
        //     console.log("CAGASTE LIGHT");
        // }
        of(req.body)
            .pipe(
                    mergeMap(task => this._createTaskUseCase.createNewTask(task))
                )
            .subscribe(createdTask => res.json(Convert.taskToJson(createdTask))
            );
    }
}