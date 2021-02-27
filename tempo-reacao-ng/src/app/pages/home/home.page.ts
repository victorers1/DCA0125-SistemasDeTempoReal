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

  texto: string = 'No meio do caminho tinha uma pedra Tinha uma pedra no meio do caminho Tinha uma pedra No meio do caminho tinha uma pedra Nunca me esquecerei desse acontecimento Na vida de minhas retinas tão fatigadas Nunca me esquecerei que no meio do caminho Tinha uma pedra Tinha uma pedra no meio do caminho No meio do caminho tinha uma pedra';
  teclas: Tecla[] = [];

  indiceProximaLetra: number;
  teclaPressionada: string;

  constructor(public alertController: AlertController) {
    this.inicializaApp();
  }

  inicializaApp() {
    this.teclas = this.texto.replace(/( )/g, '').toLowerCase().split('').map((l, index) => new Tecla(index, l, null));
    this.indiceProximaLetra = 0;
    this.teclaPressionada = '';
    console.log('Letras: ', this.teclas);
  }

  teclaApertada(s: string): void {
    this.teclaPressionada = s[s.length - 1];
    this.teclas[this.indiceProximaLetra].correta = this.teclaPressionada === this.teclas[this.indiceProximaLetra].letra;
    this.indiceProximaLetra++;
    this.scrollToTecla(this.teclas[this.indiceProximaLetra].id);
  }

  scrollToTecla(id: number) {
    var teclaElement = document.getElementById(id.toString());
    console.log(`scroll to ${id}, which is ${teclaElement.offsetTop} from top`);
    this.content.scrollToPoint(0, teclaElement.offsetTop, 1000);
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
