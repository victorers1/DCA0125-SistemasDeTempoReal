import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { BubbleCardComponent } from "./bubble-card/bubble-card.component";


@NgModule({
    imports: [CommonModule],
    declarations: [BubbleCardComponent],
    exports: [BubbleCardComponent]
})

export class ComponentsModule { }