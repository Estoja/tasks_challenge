import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NewTaskComponent } from './screens/tasks_pages/new-task/new-task.component';
import { CreatedTaskComponent } from './screens/tasks_pages/created-task/created-task.component';
import { BcInputModule } from 'bancolombia-design-system/bc-input';
import { ReactiveFormsModule } from '@angular/forms';
import { BcInputNumberModule } from 'bancolombia-design-system/bc-input-number';

@NgModule({
  declarations: [
    NewTaskComponent,
    CreatedTaskComponent
  ],
  imports: [
    CommonModule,
    BcInputModule,
    ReactiveFormsModule,
    BcInputNumberModule
  ]
})
export class TaskModule { }
