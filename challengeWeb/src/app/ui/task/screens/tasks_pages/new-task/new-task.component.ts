import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';

@Component({
  selector: 'app-new-task',
  templateUrl: './new-task.component.html',
  styleUrls: ['./new-task.component.scss']
})
export class NewTaskComponent implements OnInit {
  inputNumber = new FormControl();
  dateSelectorSimple = new FormControl();
  objectInputCounter = {
    label: 'Cantidad',
    hint: '33',
  };

  constructor() {}

  ngOnInit(): void {
  }

  getCurrentDate(): String {
    const currentDate = new Date();
    return `${currentDate.getFullYear()}-${currentDate.getMonth() + 1}-${currentDate.getDate()}`;
  }

  getCurrentHour(): String {
    const currentDate = new Date();
    return `${currentDate.getHours()}:${currentDate.getMinutes()}`;
  }

}
