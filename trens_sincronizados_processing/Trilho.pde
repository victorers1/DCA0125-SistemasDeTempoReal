  class Trilho {
       int id;
       Ponto origem = new Ponto(0, 0);
       Ponto fim = new Ponto(0,0);
       
       color cor = color(0,0,0);
  
      public Trilho(int id, Ponto origem, Ponto fim) {
          this.id = id;
          this.origem = origem;
          this.fim = fim;
      }
      
      void moverTrem(Trem trem, boolean inverterCaminho){
      }
      
      
      
      void getDesenho(){
        strokeWeight(3);
        line(origem.x, origem.y, fim.x, fim.y);  
      }
  }
