import { Observable } from 'rxjs';
import { Task } from './../task';
export interface TaskGateway {
    createTask(task: Task): Observable<Task>
}