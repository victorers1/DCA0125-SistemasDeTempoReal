import { Component } from '@angular/core';
import Tecla from "../../models/tecla";

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

  texto: string = 'No meio do caminho tinha uma pedra Tinha uma pedra no meio do caminho Tinha uma pedra No meio do caminho tinha uma pedra Nunca me esquecerei desse acontecimento Na vida de minhas retinas tão fatigadas Nunca me esquecerei que no meio do caminho Tinha uma pedra Tinha uma pedra no meio do caminho No meio do caminho tinha uma pedra';
  teclas: Tecla[] = [];

  nextAnswer: Tecla;
  resposta: string;

  constructor() {
    this.teclas = this.texto.replace(/( )/g, '').toLowerCase().split('').map((l) => new Tecla(l, false));
    console.log('Letras: ', this.teclas);

    this.nextAnswer = this.teclas[0];
  }

  teclaApertada(s: string): void {
    this.resposta = s[s.length - 1];
    console.log('resposta: ', this.resposta);

  }

}
