import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HeaderComponent } from './header/header.component';
import { BcIconModule } from 'bancolombia-design-system/bc-icon';



@NgModule({
  declarations: [
    HeaderComponent
  ],
  exports: [
    HeaderComponent
  ],
  imports: [
    CommonModule,
    BcIconModule.forRoot({
      path: '',
    })
  ]
})
export class CommonsModule { }
