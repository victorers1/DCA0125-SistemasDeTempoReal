import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { TeclaCardComponent } from "./tecla-card/tecla-card.component";


@NgModule({
    imports: [CommonModule],
    declarations: [TeclaCardComponent],
    exports: [TeclaCardComponent]
})

export class ComponentsModule { }