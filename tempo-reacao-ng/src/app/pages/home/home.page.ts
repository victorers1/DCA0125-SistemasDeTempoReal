import { Component, ViewChild } from '@angular/core';
import { AlertController, IonContent, IonInput } from '@ionic/angular';
import Key from '../../models/key';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {
  @ViewChild('inputChar', { static: false }) inputChar: IonInput;
  //TODO: focus ion-input when test starts

  isRunning: boolean = false;

  chars: string = 'qweasdzxcrtyfghvbnuiojklm,.pç;/1234567890[]';
  qtdKeys: number = 55;
  keys: Key[] = [];
  nextKeyIndex: number = 0;
  pressedKeyChar: string;

  reactionTimes: number[] = [];
  buttonPressedTimes: number[] = [];

  executionTime: Date;
  executionTimeText: string = '00:00:00';

  clockIntervalID;

  constructor(public alertController: AlertController) { }

  toggleApp() {
    if (this.isRunning) {
      this.finishApp();
    } else {
      this.initApp();
      // TODO: focus ion-input
    }
  }

  initApp() {
    const qtdChars = this.chars.length;
    this.keys = [];
    this.reactionTimes = [];
    this.buttonPressedTimes = [];
    for (let i = 0; i < this.qtdKeys; i++) {
      this.keys.push(new Key(i, this.chars[this.randomInt(qtdChars)], null));
    }
    this.nextKeyIndex = 0;
    this.pressedKeyChar = '';
    this.buttonPressedTimes = [Date.now()];
    this.clockIntervalID = setInterval(
      () => {
        this.executionTime = new Date(0);
        this.executionTime.setSeconds((Date.now() - this.buttonPressedTimes[0]) / 1000);
        this.executionTimeText = this.executionTime.toISOString().substr(11, 8);
      },
      1000);

    this.isRunning = true;
  }

  finishApp() {
    this.isRunning = false;
    this.pressedKeyChar = '';
    clearInterval(this.clockIntervalID);

  }

  randomInt(max: number) {
    return Math.floor(Math.random() * max);
  }

  onKeyPressed(s: string): void {
    this.pressedKeyChar = s[s.length - 1];
    this.keys[this.nextKeyIndex].correct = this.pressedKeyChar === this.keys[this.nextKeyIndex].letter;

    this.nextKeyIndex++;

    this.buttonPressedTimes.push(Date.now());
    this.reactionTimes.push(
      this.buttonPressedTimes[this.nextKeyIndex] -
      this.buttonPressedTimes[this.nextKeyIndex - 1]
    );
  }

  calcReactionMeanSeconds(): string {
    let accumSum: number = this.reactionTimes.reduce((sum, current) => sum + current, 0);
    return (accumSum / (this.reactionTimes.length || 1) / 1000).toFixed(1);
  }

  calcScore(): number {
    return this.keys.reduce(
      (sum, key) => sum + (key.correct === true ? 1 : 0),
      0
    );
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
