import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { TaskGateway } from 'src/app/domain/models/task/gateway/task_gateway';
import { Convert, Task } from 'src/app/domain/models/task/task';
import { getMockResponse } from './mock/task_service.mock';

@Injectable({
  providedIn: 'root'
})
export class TaskApiService implements TaskGateway {

  constructor() { }
  createTask(task: Task): Observable<Task> {
    return getMockResponse().pipe(
      map(data => Convert.toTask(data))
    );
  }
}
