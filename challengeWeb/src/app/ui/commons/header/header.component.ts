import { Component, ElementRef, OnInit, Renderer2 } from '@angular/core';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {
  _sidenav: any;

  constructor(private elementRef: ElementRef, private render: Renderer2) {}

  ngOnInit(): void {
    this._sidenav = this.elementRef.nativeElement.querySelector('aside');
  }

  openNav() {
    this.render.setStyle(this._sidenav, 'width', '250px');
  }
  closeNav() {
    this.render.setStyle(this._sidenav, 'width', '0px');
  }

}
