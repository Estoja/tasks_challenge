import { Task } from './../../models/task/task';
import { map, mergeMap, Observable, of } from 'rxjs';
import { TaskGateway } from './../../models/task/gateway/task_gateway';
import { v4 as uuidv4 } from 'uuid';

export class CreateTaskUseCase {
    private _taskGateway: TaskGateway;

    constructor(taskGateWay: TaskGateway) {
        this._taskGateway = taskGateWay;
    }

    createNewTask(task: Task): Observable<Task> {
        return of(uuidv4()).pipe(
                map(id => {
                    task.id = id;
                    task.createdDate = new Date();
                    return task
                }),
                mergeMap( task2save => this._taskGateway.createTask(task2save))
            );
    }
}