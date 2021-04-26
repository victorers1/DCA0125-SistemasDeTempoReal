import java.util.ArrayList;
import java.util.Arrays;
import java.lang.Thread;

class Controller {
  Ponto origem = new Ponto(60, 60);
  int lado = 200;

  Ponto inicioL1 = new Ponto(60, 260);
  Ponto fimL1 = new Ponto(60, 60);

  Ponto inicioL2 = new Ponto(60, 60);
  Ponto fimL2 = new Ponto(260, 60);

  Ponto inicioL3 = new Ponto(260, 60);
  Ponto fimL3 = new Ponto(260, 260);

  Ponto inicioL4 = new Ponto(260, 260);
  Ponto fimL4 = new Ponto(60, 260);

  Ponto inicioL7 = new Ponto(260, 60);
  Ponto fimL7 = new Ponto(460, 60);

  Ponto inicioL5 = new Ponto(460, 60);
  Ponto fimL5 = new Ponto(460, 260);

  Ponto inicioL6 = new Ponto(460, 260);
  Ponto fimL6 = new Ponto(260, 260);

  Ponto inicioL8 = new Ponto(460, 260);
  Ponto fimL8 = new Ponto(460, 460);

  Ponto inicioL9 = new Ponto(460, 460);
  Ponto fimL9 = new Ponto(60, 460);

  Ponto inicioL10 = new Ponto(60, 460);
  Ponto fimL10 = new Ponto(60, 260);


  ArrayList<ReentrantLock> mutexList = new ArrayList<ReentrantLock>(
    Arrays.asList( 
    new ReentrantLock(), 
    new ReentrantLock(), 
    new ReentrantLock()  
    ));

  Velocidade vel = new Velocidade(1, 1);
  ArrayList<Trem> trens = new ArrayList<Trem>(
    Arrays.asList(
    new Trem(0, 0, 255, inicioL1, vel), 
    new Trem(0, 255, 0, fimL3, vel), 
    new Trem(255, 0, 0, inicioL10, vel)
    )
    );
  ArrayList<Caminho> pistas;

  Thread threadVerde;
  Thread threadAzul;
  Thread threadVermelho;

  Controller() {
    Trilho trilho1 = new Trilho(1, inicioL1, fimL1);
    Trilho trilho2 = new Trilho(2, inicioL2, fimL2);
    Trilho trilho3 = new Trilho(3, inicioL3, fimL3);
    Trilho trilho4 = new Trilho(4, inicioL4, fimL4);

    Trilho trilho5 = new Trilho(5, inicioL5, fimL5);
    Trilho trilho6 = new Trilho(6, inicioL6, fimL6);
    Trilho trilho7 = new Trilho(7, inicioL7, fimL7);

    Trilho trilho8 = new Trilho(8, inicioL8, fimL8);
    Trilho trilho9 = new Trilho(9, inicioL9, fimL9);
    Trilho trilho10 = new Trilho(10, inicioL10, fimL10);

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
      
      iniciaPistas();
  }

  void getDesenho() {
    for (Caminho pista : pistas) {
      pista.getDesenho();
    }

    for (Trem trem : trens) {
      trem.getDesenho();
    }
  }

  void iniciaPistas() {
    Thread threadAzul = new Thread() {
      @Override
        public void run() {
        while (true) {
          pistas.get(0).moverTrem(mutexList, trens.get(0));
          try {
            Thread.sleep(1000);
            System.out.println("dormiu 1s");
          } 
          catch(InterruptedException ex) {
            System.out.println("Falha em sleep");
          }
        }
      }
    };

    Thread threadVerde = new Thread() {
      @Override
        public void run() {
        while (true) {
          pistas.get(1).moverTrem(mutexList, trens.get(1));
          try {
            Thread.sleep(1000);
            System.out.println("dormiu 1s");
          } 
          catch(InterruptedException ex) {
            System.out.println("Falha em sleep");
          }
        }
      }
    };

    Thread threadVermelho = new Thread() {
      @Override
        public void run() {
        while (true) {
          pistas.get(2).moverTrem(mutexList, trens.get(2));
          try {
            Thread.sleep(1000);
            System.out.println("dormiu 1s");
          } 
          catch(InterruptedException ex) {
            System.out.println("Falha em sleep");
          }
        }
      }
    };
    
    threadAzul.setDaemon(true);

    threadAzul.start();
    //threadVerde.start();
    //threadVermelho.start();
  }
}
