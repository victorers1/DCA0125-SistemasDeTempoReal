import { Component, Input, OnInit } from '@angular/core';
import { COLOR } from 'src/app/enums/color';
import { Bubble } from 'src/app/models/bubble';

@Component({
  selector: 'tecla-card',
  templateUrl: './tecla-card.component.html',
  styleUrls: ['./tecla-card.component.scss'],
})
export class TeclaCardComponent implements OnInit {
  @Input() bubble: Bubble;

  constructor() { }

  ngOnInit() { }
}
