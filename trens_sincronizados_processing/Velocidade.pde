class Velocidade {
  int dx=0, dy=0;

  Velocidade (int dx, int dy) {
    this.dx = dx;
    this.dy =  dy;
  }

  void mais(int dx, int dy) {
    this.dx += dx;
    this.dy += dy;
  }

  void menos(int dx, int dy) {
    this.dx -= dx;
    this.dy -= dy;

    if (this.dx < 0) this.dx = 0;
    if (this.dy < 0) this.dy = 0;
  }
}
