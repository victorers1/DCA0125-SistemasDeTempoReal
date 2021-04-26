class Trem {
  final color cor;
  Velocidade velocidade;
  Ponto posicao = new Ponto(0, 0);
  final int comprimento = 15;
  final int altura = 15;

  public Trem(int R, int G, int B, Ponto origem, Velocidade velocidade) {
    this.posicao = origem;
    this.cor = color(R, G, B);
    this.velocidade = velocidade;
  }

  void getDesenho() {
    rectMode(CENTER);
    strokeWeight(1);
    fill(cor);
    rect(posicao.x, posicao.y, comprimento, altura);
  }

  void mover(Ponto fim) {
    this.posicao.x += velocidade.dx * (fim.x - this.posicao.x);
    this.posicao.y += velocidade.dy * (fim.y - this.posicao.y);
  }

  boolean contidoEm(Ponto origem, Ponto fim) {
    if (origem.x == fim.x) {
      int maiorY = origem.y >= fim.y ? origem.y : fim.y;
      int menorY = origem.y < fim.y ? origem.y : fim.y;
      return posicao.x == origem.x && posicao.y > menorY && posicao.y < maiorY;
      
    } else if (origem.y == fim.y) {
      int maiorX = origem.x >= fim.x ? origem.x : fim.x;
      int menorX = origem.x < fim.x ? origem.x : fim.x;
      return posicao.y == origem.y && posicao.x > menorX && posicao.x < maiorX;
    }
    
    return false;
  }
}
