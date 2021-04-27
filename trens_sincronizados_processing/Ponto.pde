class Ponto {
  int x = 0, y = 0;

  public Ponto(int x, int y) {
    this.x = x;
    this.y = y;
  }

  Ponto copia() {
    return new Ponto(this.x, this.y);
  }

  Ponto getMin(Ponto p) {
    int menorY = this.y < p.y ? this.y : p.y;
    int menorX = this.x < p.x ? this.x : p.x;
    return new Ponto(menorX, menorY);
  }

  Ponto getMax(Ponto p) {
    int maiorY = this.y >= p.y ? this.y : p.y;
    int maiorX = this.x >= p.x ? this.x : p.x;
    return new Ponto(maiorX, maiorY);
  }

  public Ponto menos(Ponto outro) {
    return new Ponto(this.x - outro.x, this.y - outro.y);
  }

  public Ponto menos(int x, int y) {
    return menos(new Ponto(x, y));
  }

  public Ponto mais(Ponto outro) {
    return new Ponto(this.x + outro.x, this.y + outro.y);
  }

  public Ponto mais(int x, int y) {
    return mais(new Ponto(x, y));
  }
}
