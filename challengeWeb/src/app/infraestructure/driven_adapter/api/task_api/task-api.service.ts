import { delay } from 'rxjs/operators';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { TaskGateway } from 'src/app/domain/models/task/gateway/task_gateway';
import { Task } from 'src/app/domain/models/task/task';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class TaskApiService extends TaskGateway {
  private _url = 'http://localhost:3000/task/create';

  constructor(private http: HttpClient) {super();}

  createTask(task: Task): Observable<Task> {
    return this.http.post<Task>(this._url, task).pipe(
      delay(20000)
    );
  }
}
