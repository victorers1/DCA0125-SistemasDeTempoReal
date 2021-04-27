import java.util.ArrayList; //<>//
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

    if (trem.B > 0) {
      moverTremAzul(trem);
      //System.out.println("posição azul: (" + trem.posicao.x + " , " + trem.posicao.y +")");
    } else if (trem.G > 0) {
      moverTremVerde(trem);
    } else if (trem.R > 0) {
      moverTremVermelho(trem);
    }
  }

  void moverTremAzul(Trem trem) {
    //System.out.print("posição azul: (" + trem.posicao.x + " , " + trem.posicao.y +")");

    if (trem.posicao.x == 60 && trem.posicao.y > 60) {  //trem.contidoEm(inicioL1, fimL1)
      //System.out.println(" - está em L1");
      getTrilhoById(1).moverTrem(trem, false);
    } else if (trem.posicao.y == 60 && trem.posicao.x < 260) { //trem.contidoEm(inicioL2, fimL2)
      //System.out.println(" - está em L2");
      getTrilhoById(2).moverTrem(trem, false);
    } else if (trem.posicao.x == 260 && trem.posicao.y < 260) { //trem.contidoEm(inicioL3, fimL3)
      //System.out.println(" - está em L3");
      //mutexL3.lock();
      //mutexL4.lock();
      getTrilhoById(3).moverTrem(trem, false);
      //mutexL3.unlock();
    } else if (trem.posicao.y == 260 && trem.posicao.x>60) { //trem.contidoEm(inicioL4, fimL4)
      //System.out.println(" - está em L4");
      getTrilhoById(4).moverTrem(trem, false);
      //mutexL4.unlock();
    }
  }

  void moverTremVerde(Trem trem) {
    if (trem.posicao.x == 260 && trem.posicao.y > 60) {//trem.contidoEm(inicioL3, fimL3)
      getTrilhoById(3).moverTrem(trem, true);
      
    } else if (trem.posicao.y == 60 && trem.posicao.x < 460 ) { //trem.contidoEm(inicioL7, fimL7)
      getTrilhoById(7).moverTrem(trem, false);
      
    } else if (trem.posicao.x == 460 && trem.posicao.y < 260) { //trem.contidoEm(inicioL5, fimL5)
      getTrilhoById(5).moverTrem(trem, false);
      
    } else if (trem.posicao.y == 260 && trem.posicao.x > 260) {
      //mutexL6.lock();
      getTrilhoById(6).moverTrem(trem, false);
      //mutexL6.unlock();
    }
  }

  void moverTremVermelho(Trem trem) {

    if (trem.contidoEm(inicioL10, fimL10))
      getTrilhoById(10).moverTrem(trem, false);


    if (trem.contidoEm(inicioL4, fimL4)) {
      //mutexL4.lock();
      //mutexL6.lock();
      getTrilhoById(4).moverTrem(trem, true);
      //mutexL4.unlock();
    }

    if (trem.contidoEm(inicioL6, fimL6))
    {
      getTrilhoById(6).moverTrem(trem, true);
      //mutexL6.unlock();
    }

    if (trem.contidoEm(inicioL8, fimL8))
      getTrilhoById(8).moverTrem(trem, false);

    if (trem.contidoEm(inicioL9, fimL9))
      getTrilhoById(9).moverTrem(trem, false);
  }

  public Trilho getTrilhoById(Integer id) {

    for (int i = 0; i < this.trilhos.size(); i++) {

      Trilho t = this.trilhos.get(i);

      if (t.id == id) return t;
    }
    return new Trilho(0, new Ponto(0, 0), new Ponto(0, 0));
  }
}
