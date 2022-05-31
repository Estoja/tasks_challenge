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

  constructor() { }

  ngOnInit(): void {
  }

  getCurrentDate(): String {//2018-01-01
    const currentDate = new Date();
    return `${currentDate.getFullYear()}-${currentDate.getMonth() + 1}-${currentDate.getDate()}`;
  }

}
