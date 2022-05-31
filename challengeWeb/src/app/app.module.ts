import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BcIconModule } from 'bancolombia-design-system/bc-icon';
import { TaskModule } from './ui/task/task.module';
import { CommonsModule } from './ui/commons/commons.module';

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BcIconModule.forRoot({
      path: '',
    }),
    TaskModule,
    CommonsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
