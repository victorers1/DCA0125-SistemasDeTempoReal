import java.util.ArrayList;
import java.util.concurrent.locks.ReentrantLock;

class Caminho {
  private ArrayList<Trilho> trilhos; // Primeiro sempre é o da esquerda e segue em sentido horário

  private ReentrantLock mutexL3;
  private ReentrantLock mutexL4;
  private ReentrantLock mutexL6;

  public Caminho(ArrayList<Trilho> trilhos) {
    this.trilhos = trilhos;
  }

  void getDesenho() {
    for (Trilho trilho : trilhos) {
      trilho.getDesenho();
    }
  }

  /**
   * Faz trem circular por todos os trilhos
   * A quantidade de trilhos depende da cor do trem
   */
  public void moverTrem(ArrayList<ReentrantLock> mutexs, Trem trem) {
    this.mutexL3 = mutexs.get(0);
    this.mutexL4 = mutexs.get(1);
    this.mutexL6 = mutexs.get(2);

//TODO: nenhuma condição é satisfeita
    if (trem.cor == color(0, 0, 255)) { //<>//
      moverTremAzul(trem);
    } else if (trem.cor == color(0, 255, 0)) {
      moverTremVerde(trem);
    } else if (trem.cor ==color(255, 0, 0)) {
      moverTremVermelho(trem);
    }
  }

  void moverTremAzul(Trem trem) {

    if (trem.contidoEm(inicioL1, fimL1))
      getTrilhoById(1).moverTrem(trem);

    if (trem.contidoEm(inicioL2, fimL2))  
      getTrilhoById(2).moverTrem(trem);


    if (trem.contidoEm(inicioL3, fimL3)) {
      mutexL3.lock();
      mutexL4.lock();
      getTrilhoById(3).moverTrem(trem);
      mutexL3.unlock();
    }

    if (trem.contidoEm(inicioL4, fimL4)) { 
      getTrilhoById(4).moverTrem(trem);
      mutexL4.unlock();
    }
  }

  void moverTremVerde(Trem trem) {
    //getTrilhoById(3).moverTrem(trem, true);
    //getTrilhoById(7).moverTrem(trem, false);
    //getTrilhoById(5).moverTrem(trem, false);

    //mutexL6.lock();
    //getTrilhoById(6).moverTrem(trem, false);
    //mutexL6.unlock();
  }

  void moverTremVermelho(Trem trem) {
    //getTrilhoById(10).moverTrem(trem, false);

    //mutexL4.lock();
    //mutexL6.lock();
    //getTrilhoById(4).moverTrem(trem, true);
    //mutexL4.unlock();

    //getTrilhoById(6).moverTrem(trem, true);
    //mutexL6.unlock();

    //getTrilhoById(8).moverTrem(trem, false);
    //getTrilhoById(9).moverTrem(trem, false);
  }

  public Trilho getTrilhoById(Integer id) {

    for (int i = 0; i < this.trilhos.size(); i++) {

      Trilho t = this.trilhos.get(i);

      if (t.id == id) return t;
    }
    return new Trilho(0, new Ponto(0, 0), new Ponto(0, 0));
  }
}
