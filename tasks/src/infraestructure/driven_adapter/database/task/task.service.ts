import { Convert } from './../../../../domain/models/task/task';
import { Observable, map } from 'rxjs';
import { Task } from '../../../../domain/models/task/task';
import { TaskGateway } from './../../../../domain/models/task/gateway/task_gateway';
import { getMockResponse } from './mock/task_service.mock';
export class TaskService implements TaskGateway {

    createTask(task: Task): Observable<Task> {
        console.log(task);
        return getMockResponse()
                .pipe(
                    map( data => Convert.toTask(data))
                );
    }

}