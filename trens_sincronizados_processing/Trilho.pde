class Trilho {
  int id;
  Ponto origem = new Ponto(0, 0);
  Ponto fim = new Ponto(0, 0);

  public Trilho(int id, Ponto origem, Ponto fim) {
    this.id = id;
    this.origem = origem;
    this.fim = fim;
  }

  void moverTrem(Trem trem, boolean inverter) {
    if(inverter){
      trem.mover(fim, origem);
    }else {
      trem.mover(origem, fim);
    }
  }

  void getDesenho() {
    strokeWeight(3);
    stroke(0);
    line(origem.x, origem.y, fim.x, fim.y);
  }
}
