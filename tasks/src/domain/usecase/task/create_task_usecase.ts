import { Task } from './../../models/task/task';
import { Observable } from 'rxjs';
import { TaskGateway } from './../../models/task/gateway/task_gateway';

export class CreateTaskUseCase {
    private _taskGateway: TaskGateway;

    constructor(taskGateWay: TaskGateway) {
        this._taskGateway = taskGateWay;
    }

    createNewTask(task: Task): Observable<Task> {
        return this._taskGateway.createTask(task);
    }
}