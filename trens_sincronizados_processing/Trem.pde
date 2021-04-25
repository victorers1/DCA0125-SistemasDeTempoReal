  class Trem {
      final color cor;
      Velocidade velocidade;
      Ponto posicao = new Ponto(0,0);
      final int comprimento = 15;
      final int altura = 15;
    
      public Trem(int R, int G, int B, Ponto origem, Velocidade velocidade) {
        this.posicao = origem;
          this.cor = color(R,G,B);
          this.velocidade = velocidade;
      }
      
      void getDesenho(){
        rectMode(CENTER);
        strokeWeight(1);
        fill(cor);
        rect(posicao.x, posicao.y, comprimento, altura);
      }
  }
