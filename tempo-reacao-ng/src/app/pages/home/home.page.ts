import { ReturnStatement } from '@angular/compiler';
import { Component, ViewChild } from '@angular/core';
import { AlertController, IonContent } from '@ionic/angular';
import Tecla from "../../models/tecla";

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {
  @ViewChild(IonContent, { static: false }) content: IonContent;

  testeExecutando: boolean = false;

  texto: string = 'No meio do caminho tinha uma pedra Tinha uma pedra no meio do caminho Tinha uma pedra No meio do caminho tinha uma pedra Nunca me esquecerei desse acontecimento Na vida de minhas retinas tão fatigadas Nunca me esquecerei que no meio do caminho Tinha uma pedra Tinha uma pedra no meio do caminho No meio do caminho tinha uma pedra';
  teclas: Tecla[] = [];
  indiceProximaLetra: number = 0;
  teclaPressionada: string;

  temposReacao: number[] = [];
  temposBotaoPressionado: number[] = [];

  constructor(public alertController: AlertController) {
  }

  toggleApp() {
    if (this.testeExecutando) {
      this.terminaApp();
    } else {
      this.inicializaApp();
    }
  }

  inicializaApp() {
    this.teclas = this.texto.replace(/( )/g, '').toLowerCase().split('').map((l, index) => new Tecla(index, l, null));
    this.indiceProximaLetra = 0;
    this.teclaPressionada = '';
    this.temposBotaoPressionado = [Date.now()];
    this.testeExecutando = true;
  }

  terminaApp() {
    this.testeExecutando = false;
    this.teclaPressionada = '';
  }

  quandoTeclaApertada(s: string): void {
    this.teclaPressionada = s[s.length - 1];
    this.teclas[this.indiceProximaLetra].correta = this.teclaPressionada === this.teclas[this.indiceProximaLetra].letra;

    this.indiceProximaLetra++;

    this.temposBotaoPressionado.push(Date.now());
    this.temposReacao.push(
      this.temposBotaoPressionado[this.indiceProximaLetra] -
      this.temposBotaoPressionado[this.indiceProximaLetra - 1]
    );


  }

  calcMediaReacao(): number {
    let somatorio: number = this.temposReacao.reduce((soma, atual) => soma + atual, 0);
    return somatorio / this.temposReacao.length;
  }

  calcScore(): number {
    return this.teclas.reduce(
      (soma, tecla) => soma + (tecla.correta === true ? 1 : 0),
      0
    );
  }

  async showInstrucoes() {
    const alert = await this.alertController.create({
      header: 'Instruções',
      subHeader: 'Tempo de reação',
      message: 'Escrever instruções.',
      buttons: ['OK']
    });

    await alert.present();
  }

}
