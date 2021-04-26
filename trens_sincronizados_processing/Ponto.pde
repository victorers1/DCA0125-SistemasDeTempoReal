class Ponto {
  int x = 0, y = 0;

  public Ponto(int x, int y) {
    this.x = x;
    this.y = y;
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
