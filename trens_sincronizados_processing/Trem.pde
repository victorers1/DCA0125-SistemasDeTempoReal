class Trem {
  color cor;
  int R=0, G=0, B=0;
  Velocidade velocidade;
  Ponto posicao = new Ponto(0, 0);
  final int comprimento = 15;
  final int altura = 15;

  public Trem(int R, int G, int B, Ponto origem, Velocidade velocidade) {
    this.posicao = origem;
    this.R =R;
    this.G = G;
    this.B = B;
    this.cor = color(R, G, B);
    this.velocidade = velocidade;
  }

  void getDesenho() {
    rectMode(CENTER);
    strokeWeight(1);
    fill(R, G, B);
    rect(posicao.x, posicao.y, comprimento, altura);
  }

  void mover(Ponto origem, Ponto fim) {
    this.posicao.x += velocidade.dx * (fim.x - origem.x)  * 0.01;
    this.posicao.y += velocidade.dy * (fim.y - origem.y) * 0.01;

    // trata pontos extremos
    if (origem.x < fim.x) { //reta horizontal da esquerda para direita
      if (this.posicao.x > fim.x) this.posicao.x = fim.x;
    } else {
      if (this.posicao.x < fim.x) this.posicao.x = fim.x;
    }

    if (origem.y > fim.y) { //reta vertical de baixo para cima
      if (this.posicao.y  < fim.y) this.posicao.y = fim.y; 
      } else {
        if(this.posicao.y >  fim.y) this.posicao.y = fim.y;
    }
  }

  boolean contidoEm(Ponto origem, Ponto fim) {
    if (origem.x == fim.x) {
      int maiorY = origem.y >= fim.y ? origem.y : fim.y;
      int menorY = origem.y < fim.y ? origem.y : fim.y;
      return posicao.x == origem.x && posicao.y >= menorY && posicao.y <= maiorY;
    } else if (origem.y == fim.y) {
      int maiorX = origem.x >= fim.x ? origem.x : fim.x;
      int menorX = origem.x < fim.x ? origem.x : fim.x;
      return posicao.y == origem.y && posicao.x >= menorX && posicao.x <= maiorX;
    }
    return false;
  }
}
