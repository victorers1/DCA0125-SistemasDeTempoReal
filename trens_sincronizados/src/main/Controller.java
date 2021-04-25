package main;

import javafx.scene.paint.Color;
import main.models.CaminhoRetangular;
import main.models.Ponto;
import main.models.Trem;
import main.models.Trilho;

import java.util.ArrayList;
import java.util.Arrays;

public class Controller {
    Ponto origem = new Ponto(140, 250);
    Integer lado = 190;

    ArrayList<Trem> trens = new ArrayList<>(Arrays.asList(
            new Trem(Color.BLUE, 2),
            new Trem(Color.GREEN, 2),
            new Trem(Color.RED, 2)
    ));

    ArrayList<Trilho> conjunto1;
    ArrayList<Trilho> conjunto2;
    ArrayList<Trilho> conjunto3;

    CaminhoRetangular pista1;
    CaminhoRetangular pista2;
    CaminhoRetangular pista3;
    ArrayList<CaminhoRetangular> pistas;

    Controller(Ponto origem, Integer lado) {
        this.origem = origem;
        this.lado = lado;

        var trilho1 = new Trilho(origem, lado, 270);
        var trilho2 = new Trilho(origem.menos(0, lado), lado, 0);
        var trilho3 = new Trilho(origem.mais(lado, 0).menos(0, lado), lado, 90);
        var trilho4 = new Trilho(origem.mais(lado, 0), lado, 180);

        var trilho5 = new Trilho(origem.mais(2 * lado, 0).menos(0, lado), lado, 90);
        var trilho6 = new Trilho(origem.mais(2 * lado, 0), lado, 180);
        var trilho7 = new Trilho(origem.mais(lado, 0).menos(0, lado), lado, 0);

        var trilho8 = new Trilho(origem.mais(2 * lado, 0), lado, 90);
        var trilho9 = new Trilho(origem.mais(2 * lado, 0).mais(0, lado), 2 * lado, 180);
        var trilho10 = new Trilho(origem.mais(0, lado), lado, -90);

        this.conjunto1 = new ArrayList<>(Arrays.asList(
                trilho1, trilho2, trilho3, trilho4
        ));
        this.conjunto2 = new ArrayList<>(Arrays.asList(
                trilho3, trilho7, trilho5, trilho6
        ));
        this.conjunto3 = new ArrayList<>(Arrays.asList(
                trilho10, trilho4, trilho6, trilho8, trilho9
        ));

        this.pista1 = new CaminhoRetangular(conjunto1);
        this.pista2 = new CaminhoRetangular(conjunto2);
        this.pista3 = new CaminhoRetangular(conjunto3);

        this.pistas = new ArrayList<>(Arrays.asList(
                pista1,
                pista2,
                pista3
        ));
    }

    public void ligarPista(Integer indexPista, Integer indexTrem) {
        this.pistas.get(indexPista).ligarTrem(trens.get(indexTrem));
    }
}
