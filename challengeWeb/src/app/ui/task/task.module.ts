import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NewTaskComponent } from './screens/tasks_pages/new-task/new-task.component';
import { CreatedTaskComponent } from './screens/tasks_pages/created-task/created-task.component';
import { BcInputModule } from 'bancolombia-design-system/bc-input';
import { ReactiveFormsModule } from '@angular/forms';
import { BcInputNumberModule } from 'bancolombia-design-system/bc-input-number';
import { BcButtonModule } from 'bancolombia-design-system/bc-button';
import { BcLoaderModule } from 'bancolombia-design-system/bc-loader';
import { TaskGateway } from 'src/app/domain/models/task/gateway/task_gateway';
import { TaskApiService } from 'src/app/infraestructure/driven_adapter/api/task_api/task-api.service';
import { HttpClientModule } from '@angular/common/http';

@NgModule({
  declarations: [
    NewTaskComponent,
    CreatedTaskComponent
  ],
  imports: [
    CommonModule,
    BcInputModule,
    ReactiveFormsModule,
    BcInputNumberModule,
    BcButtonModule,
    HttpClientModule,
    BcLoaderModule,
  ],
  providers: [
    {
      provide: TaskGateway,
      useClass: TaskApiService
    }
  ]
})
export class TaskModule { }
