import { Component, OnInit } from '@angular/core';
import { Reviewed, Task } from 'src/app/domain/models/task/task';

@Component({
  selector: 'app-created-task',
  templateUrl: './created-task.component.html',
  styleUrls: ['./created-task.component.scss']
})
export class CreatedTaskComponent implements OnInit {
  task: Task;
  private reviewed: Reviewed;
  constructor() {
    this.reviewed = {
      "id": "1",
      "proposed_price": 12,
      review: '',
      score: 0
    };
    this.task = {
      "id": "asdD15drasdf3",
      "title": "Sacar a la casa",
      "description": "Sacar a la casa, esta aburrida",
      "keyWords": ["ventana","lavar","dos pisos"],
      "count": 40,
      "state": "NEW",
      "client": this.reviewed,
      "scheduleDate": new Date("2022-05-28 13:30:00.000Z"),
      "createdDate":new Date("2022-05-28 13:30:00.000Z")
    }
  }

  ngOnInit(): void {
  }

  showDate(date: Date): String {
    return `${date.getDate()}/${date.getMonth() + 1}/${date.getFullYear()} ${date.getHours()}:${date.getMinutes()}`;
  }

}