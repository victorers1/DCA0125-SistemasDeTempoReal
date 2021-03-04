import { Component, Input, OnInit } from '@angular/core';
import { Bubble } from 'src/app/models/bubble';

@Component({
  selector: 'bubble-card',
  templateUrl: './bubble-card.component.html',
  styleUrls: ['./bubble-card.component.scss'],
})
export class BubbleCardComponent implements OnInit {
  @Input() bubble: Bubble;

  constructor() { }

  ngOnInit() { }
}
