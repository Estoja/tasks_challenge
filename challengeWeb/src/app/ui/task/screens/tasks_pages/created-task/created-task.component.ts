import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { Component, OnInit } from '@angular/core';
import { Reviewed, Task } from 'src/app/domain/models/task/task';
import { CreateTaskUseCase } from 'src/app/domain/usecase/task/create_task_usecase';

@Component({
  selector: 'app-created-task',
  templateUrl: './created-task.component.html',
  styleUrls: ['./created-task.component.scss']
})
export class CreatedTaskComponent implements OnInit {
  task?: Task;
  createTaskResponse$?: Observable<Task>;
  constructor(private createTaskUsecase: CreateTaskUseCase) {
  }
  ngOnInit(): void {

    this.createTaskResponse$ =
          this.createTaskUsecase
          .createNewTask(this.convertDataReceipts2task(history.state.data));
    this.createTaskResponse$
        .pipe(
            map(createdTask => {
              createdTask.scheduleDate = new Date(createdTask.scheduleDate)
              return createdTask;
            })
        )
        .subscribe(createdTask => {
          this.task = createdTask
        });
  }

  convertDataReceipts2task(rawTask: any): Task {
    const [year, month, day] = rawTask.scheduleDate.split('-');
    const [hours, minutes] = rawTask.time.split(':');
    const scheduleDate = new Date(year, month - 1, day, hours, minutes);
    return {
      id: '',
      title: rawTask.title,
      description: rawTask.description,
      keyWords: rawTask.keyWords.split('/'),
      client: {
        id: '1152193027',
        proposed_price: rawTask.price,
        review: '',
        score: 0
      },
      count: rawTask.count,
      state: 'NEW',
      scheduleDate: scheduleDate,
      createdDate: new Date(),
    };
  }

  showDate(date: Date | null): String {
    return `${String(date!.getDate()).padStart(2, '0')}/
        ${String(date!.getMonth() + 1).padStart(2, '0')}/
        ${date!.getFullYear()} 
         ${String(date!.getHours()).padStart(2, '0')}:
        ${String(date!.getMinutes()).padStart(2, '0')}`;
  }

}

