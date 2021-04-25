  import java.util.ArrayList;
  import java.util.Arrays;
  import java.lang.Thread;
  
  class Controller {
      Ponto origem = new Ponto(60,60);
      int lado = 200;
      
      Ponto fimL1 = origem.mais(0, lado);
      Ponto fimL2 = origem.mais(lado, 0);
      Ponto fimL3 = origem.mais(lado, lado);
      Ponto fimL7 = origem.mais(2*lado, 0);
      Ponto fimL5 = origem.mais(2*lado, lado);
      Ponto fimL8 = origem.mais(2*lado, 2*lado);
      Ponto fimL9 = origem.mais(0, 2*lado);
        
        Velocidade vel = new Velocidade(10,10);
  
      ArrayList<Trem> trens = new ArrayList<Trem>(
              Arrays.asList(
                      new Trem(0,0,255, fimL1, vel),
                      new Trem(0, 255,0, fimL3, vel),
                      new Trem(255,0,0, fimL9, vel)
              )
      );
      ArrayList<Caminho> pistas;
  
      Thread threadVerde;
      Thread threadAzul;
      Thread threadVermelho;
  
      Controller() {
          Trilho trilho1 = new Trilho(1, origem, fimL1);
          Trilho trilho2 = new Trilho(2, origem, fimL2);
          Trilho trilho3 = new Trilho(3, fimL2, fimL3);
          Trilho trilho4 = new Trilho(4, fimL3, fimL1);
  
          Trilho trilho5 = new Trilho(5, fimL7, fimL5);
          Trilho trilho6 = new Trilho(6, fimL5, fimL3);
          Trilho trilho7 = new Trilho(7, fimL2, fimL7);
  
          Trilho trilho8 = new Trilho(8, fimL5, fimL8);
          Trilho trilho9 = new Trilho(9, fimL8, fimL9);
          Trilho trilho10 = new Trilho(10, fimL9, fimL1);
  
          Caminho pista1 = new Caminho(
                  new ArrayList<Trilho>(Arrays.asList(trilho1, trilho2, trilho3, trilho4))
          );
          Caminho pista2 = new Caminho(
                  new ArrayList<Trilho>(Arrays.asList(trilho3, trilho7, trilho5, trilho6))
          );
          Caminho pista3 = new Caminho(
                  new ArrayList<Trilho>(Arrays.asList(trilho10, trilho4, trilho6, trilho8, trilho9))
          );
  
          this.pistas = new ArrayList<Caminho>(Arrays.asList(
                  pista1,
                  pista2,
                  pista3
          ));
      }
      
      void getDesenho(){
        for(Caminho pista : pistas){
            pista.getDesenho();
        }
        
        for(Trem trem : trens){
            trem.getDesenho();
        }
      }
  
      void ligarPistas() {
        
        //while (true) {
        //   pistas.get(0).moverTrem(trens.get(0));
        
        
        //while (true) {
        //     pistas.get(1).moverTrem(trens.get(1));
        //}
  
        //while (true) {
        //    pistas.get(2).moverTrem(trens.get(2));
        //}
  
  
        //  threadVerde = new Thread();
        //  threadAzul = new Thread();
        //  threadVermelho = new Thread();
  
        //  threadVerde.start();
        //  threadAzul.start();
        //  threadVermelho.start();
      }
  }
