import { Task } from './../task';
import { Observable } from 'rxjs';

export interface TaskGateway {
    createTask(task: Task): Observable<Task>;
}