import { Component, Input, OnInit } from '@angular/core';
import Tecla from 'src/app/models/tecla';

@Component({
  selector: 'tecla-card',
  templateUrl: './tecla-card.component.html',
  styleUrls: ['./tecla-card.component.scss'],
})
export class TeclaCardComponent implements OnInit {
  @Input() tecla: Tecla;

  constructor() { }

  ngOnInit() {
    console.log('tecla: ', this.tecla);

  }

}
