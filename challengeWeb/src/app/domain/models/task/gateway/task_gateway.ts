import { Observable } from 'rxjs';
import { Task } from './../task';
export abstract class TaskGateway {
    abstract createTask(task: Task): Observable<Task>
}