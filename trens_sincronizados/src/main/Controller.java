package main;

import javafx.concurrent.Task;
import javafx.scene.paint.Color;
import main.models.CaminhoRetangular;
import main.models.Ponto;
import main.models.Trem;
import main.models.Trilho;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.concurrent.locks.ReentrantLock;

public class Controller {
    Ponto origem = new Ponto(140, 250);
    Integer lado = 190;

    ArrayList<Trem> trens = new ArrayList<>(
            Arrays.asList(
                    new Trem(Color.BLUE, 2),
                    new Trem(Color.GREEN, 2),
                    new Trem(Color.RED, 1)
            )
    );
    ArrayList<CaminhoRetangular> pistas;

    ReentrantLock mutex = new ReentrantLock();

    Thread threadVerde;
    Thread threadAzul;
    Thread threadVermelho;

    Controller(Ponto origem, Integer lado) {
        mutex.isLocked()


        this.origem = origem;
        this.lado = lado;

        var trilho1 = new Trilho(1, origem, lado, 270);
        var trilho2 = new Trilho(2, origem.menos(0, lado), lado, 0);
        var trilho3 = new Trilho(3, origem.mais(lado, 0).menos(0, lado), lado, 90);
        var trilho4 = new Trilho(4, origem.mais(lado, 0), lado, 180);

        var trilho5 = new Trilho(5, origem.mais(2 * lado, 0).menos(0, lado), lado, 90);
        var trilho6 = new Trilho(6, origem.mais(2 * lado, 0), lado, 180);
        var trilho7 = new Trilho(7, origem.mais(lado, 0).menos(0, lado), lado, 0);

        var trilho8 = new Trilho(8, origem.mais(2 * lado, 0), lado, 90);
        var trilho9 = new Trilho(9, origem.mais(2 * lado, 0).mais(0, lado), 2 * lado, 180);
        var trilho10 = new Trilho(10, origem.mais(0, lado), lado, -90);

        CaminhoRetangular pista1 = new CaminhoRetangular(
                new ArrayList<>(Arrays.asList(trilho1, trilho2, trilho3, trilho4))
        );
        CaminhoRetangular pista2 = new CaminhoRetangular(
                new ArrayList<>(Arrays.asList(trilho3, trilho7, trilho5, trilho6))
        );
        CaminhoRetangular pista3 = new CaminhoRetangular(
                new ArrayList<>(Arrays.asList(trilho10, trilho4, trilho6, trilho8, trilho9))
        );

        this.pistas = new ArrayList<>(Arrays.asList(
                pista1,
                pista2,
                pista3
        ));
    }

    public void ligarPistas() {
        var taskAzul = new Task<Boolean>() {
            protected Boolean call() {
                while (true) {
                    pistas.get(0).moverTrem(trens.get(0));
                }
            }
        };

        var taskVerde = new Task<Boolean>() {
            protected Boolean call() {
                while (true) {
                    pistas.get(1).moverTrem(trens.get(1));
                }
            }
        };

        var taskVermelho = new Task<Boolean>() {
            protected Boolean call() {
                while (true) {
                    pistas.get(2).moverTrem(trens.get(2));
                }
            }
        };


        threadVerde = new Thread(taskVerde);
        threadAzul = new Thread(taskAzul);
        threadVermelho = new Thread(taskVermelho);

        threadVerde.setDaemon(true);
        threadAzul.setDaemon(true);
        threadVermelho.setDaemon(true);

        threadVerde.start();
        threadAzul.start();
        threadVermelho.start();
    }
}
