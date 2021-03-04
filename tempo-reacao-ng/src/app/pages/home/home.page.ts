import { Component, HostListener, ViewChild } from '@angular/core';
import { AlertController, IonContent, IonInput } from '@ionic/angular';
import { COLOR } from 'src/app/enums/color';
import { Utils } from 'src/app/utils/utils';
import { Bubble } from "../../models/bubble";
@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

  isRunning: boolean = false;
  score: number = 0;

  qtdBubbles: number = 45;
  bubbles: Bubble[];
  activeBubbleIndex: number;
  keyPressedCount: number = 0;

  reactionTimes: number[] = [];
  buttonPressedTimes: number[] = [];

  executionTime: Date;
  executionTimeText: string = '00:00:00';
  clockIntervalID: any;

  constructor(public alertController: AlertController) { }

  toggleApp() {
    if (this.isRunning) {
      this.finishApp();
    } else {
      this.initApp();
    }
  }
  initApp() {
    this.score = 0;
    this.keyPressedCount = 0;
    this.bubbles = Array.from(Array(this.qtdBubbles)).map((arr, index) => new Bubble(index));
    this.reactionTimes = [];
    this.buttonPressedTimes = [Date.now()];
    this.activeBubbleIndex = Utils.randomInt(this.qtdBubbles - 1);
    this.updateBubbleArray();
    this.clockIntervalID = setInterval(
      () => {
        this.executionTime = new Date(0);
        this.executionTime.setSeconds((Date.now() - this.buttonPressedTimes[0]) / 1000);
        this.executionTimeText = this.executionTime.toISOString().substr(11, 8);
      },
      1000);
    this.isRunning = true;
    console.log('bubbles:', this.bubbles);
  }
  finishApp() {
    this.isRunning = false;
    clearInterval(this.clockIntervalID);
  }

  @HostListener('window:keyup', ['$event'])
  keyEvent(event: KeyboardEvent) {
    console.log(event);
    if (!this.isRunning) return;

    if (this.isKeyCorrect(event.key)) {
      this.keyPressedCount++;
      this.countTimes();
      this.score++;
    }
    this.updateBubbleArray();
  }

  countTimes() {
    this.buttonPressedTimes.push(Date.now());
    this.reactionTimes.push(
      this.buttonPressedTimes[this.keyPressedCount] -
      this.buttonPressedTimes[this.keyPressedCount - 1]
    );
  }
  isKeyCorrect(key: string): boolean {
    return this.bubbles[this.activeBubbleIndex].key === key;
  }
  updateBubbleArray() {
    this.bubbles[this.activeBubbleIndex].colorValue = COLOR.LIGHT;
    this.bubbles[this.activeBubbleIndex].key = '';

    this.activeBubbleIndex = Utils.randomInt(this.qtdBubbles - 1);
    this.bubbles[this.activeBubbleIndex].colorValue = Utils.randomInt(Bubble.qtdColors);
  }

  calcReactionMeanSeconds(): string {
    let accumSum: number = this.reactionTimes.reduce((sum, current) => sum + current, 0);
    return (accumSum / (this.reactionTimes.length || 1) / 1000).toFixed(1);
  }

  async showInstructions() {
    const alert = await this.alertController.create({
      header: 'Instruções',
      subHeader: 'Tempo de reação',
      message: 'Escrever instruções.',
      buttons: ['OK']
    });

    await alert.present();
  }

}
