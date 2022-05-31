import { CreatedTaskComponent } from './ui/task/screens/tasks_pages/created-task/created-task.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { NewTaskComponent } from './ui/task/screens/tasks_pages/new-task/new-task.component';

const routes: Routes = [
  { path: 'newTask', component: NewTaskComponent },
  { path: 'createdTask', component: CreatedTaskComponent },
  //{ path: 'second-component', component: SecondComponent },
  { path: '',   redirectTo: '/createdTask', pathMatch: 'full' }, // redirect to `first-component`
  //{ path: '**', component: PageNotFoundComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
