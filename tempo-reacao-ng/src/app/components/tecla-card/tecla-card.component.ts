import { Component, Input, OnInit } from '@angular/core';
import Key from 'src/app/models/key';

@Component({
  selector: 'tecla-card',
  templateUrl: './tecla-card.component.html',
  styleUrls: ['./tecla-card.component.scss'],
})
export class TeclaCardComponent implements OnInit {
  @Input() key: Key;

  constructor() { }

  ngOnInit() {
  }

}
