package main.models;

import javafx.scene.Group;
import javafx.scene.paint.Color;

import java.util.ArrayList;
import java.util.concurrent.locks.ReentrantLock;

public class CaminhoRetangular {
    private Integer comprimento = 0;
    private Integer altura = 0;
    private ArrayList<Trilho> trilhos; // Primeiro sempre é o da esquerda e segue em sentido horário

    private ReentrantLock mutexL3 = new ReentrantLock();
    private ReentrantLock mutexL4 = new ReentrantLock();
    private ReentrantLock mutexL6 = new ReentrantLock();


    public CaminhoRetangular(ArrayList<Trilho> trilhos) {
        this.trilhos = trilhos;

        this.comprimento = trilhos.get(1).getComprimento();
        this.altura = trilhos.get(0).getComprimento();
    }

    public Group getDesenho() {
        final var caminho = new Group();

        for (var trilho : trilhos) {
            caminho.getChildren().add(trilho.getLinha());
        }

        return caminho;
    }

    /**
     * Faz trem circular por todos os trilhos
     * A quantidade de trilhos depende da cor do trem
     */
    public void moverTrem(Trem trem) {

        if (trem.getCor() == Color.BLUE) {
            moverTremAzul(trem);

        } else if (trem.getCor() == Color.GREEN) {
            moverTremVerde(trem);

        } else if (trem.getCor() == Color.RED) {
            moverTremVermelho(trem);
        }
    }

    private void moverTremAzul(Trem trem) {
        getTrilhoById(1).moverTrem(trem, false);

        getTrilhoById(2).moverTrem(trem, false);

        mutexL3.lock();
        mutexL4.lock();
        getTrilhoById(3).moverTrem(trem, false);
        mutexL3.unlock();

        getTrilhoById(4).moverTrem(trem, false);
        mutexL4.unlock();
    }

    private void moverTremVerde(Trem trem) {
        getTrilhoById(3).moverTrem(trem, true);
//        mutexL3.unlock();

        getTrilhoById(7).moverTrem(trem, false);
        getTrilhoById(5).moverTrem(trem, false);

//        mutexL3.lock();
        mutexL6.lock();
        getTrilhoById(6).moverTrem(trem, false);
        mutexL6.unlock();
    }

    private void moverTremVermelho(Trem trem) {
        getTrilhoById(10).moverTrem(trem, false);

        mutexL4.lock();
        mutexL6.lock();
        getTrilhoById(4).moverTrem(trem, true);
        mutexL4.unlock();

        getTrilhoById(6).moverTrem(trem, true);
        mutexL6.unlock();

        getTrilhoById(8).moverTrem(trem, false);
        getTrilhoById(9).moverTrem(trem, false);
    }

    public Trilho getTrilhoById(Integer id) {
        return this.trilhos
                .stream()
                .filter(t -> t.getId().equals(id))
                .findFirst()
                .orElseThrow();

    }
}
