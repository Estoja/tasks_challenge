import { Component, ElementRef } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-new-task',
  templateUrl: './new-task.component.html',
  styleUrls: ['./new-task.component.scss']
})
export class NewTaskComponent {
  taskForm = new FormGroup({
    title: new FormControl(''),
    description: new FormControl(''),
    keyWords: new FormControl(''),
    count: new FormControl(''),
    price: new FormControl(''),
    scheduleDate: new FormControl(''),
    time: new FormControl(''),
  });
  inputNumber = new FormControl();
  dateSelectorSimple = new FormControl();
  objectInputCounter = {
    label: 'Cantidad',
    hint: '33',
  };

  constructor(private router: Router, private elementRef: ElementRef) {}

  getCurrentDate(): String {
    const currentDate = new Date();
    return `${currentDate.getFullYear()}-${currentDate.getMonth() + 1}-${currentDate.getDate()}`;
  }

  getCurrentHour(): String {
    const currentDate = new Date();
    return `${currentDate.getHours()}:${currentDate.getMinutes()}`;
  }

  createTask() {
    const selectedDate = this.elementRef.nativeElement.querySelector('#scheduleDate').value
    this.taskForm.controls.scheduleDate.setValue(selectedDate);
    this.router.navigate(['/createdTask'], {state: {data: this.taskForm.getRawValue()}});
  }

}