package main.models;

import javafx.scene.Group;
import javafx.scene.paint.Color;
import javafx.scene.shape.Circle;

import java.util.ArrayList;

public class CaminhoRetangular {
    private Ponto origem = new Ponto(0, 0);
    private Integer comprimento = 0;
    private Integer altura = 0;
    private ArrayList<Trilho> trilhos = new ArrayList<>(); // Primeiro sempre é o da esquerda e segue em sentido horário

    public CaminhoRetangular(Ponto origem, Integer comprimento, Integer altura) {
        this.origem = origem;
        this.comprimento = comprimento;
        this.altura = altura;

        trilhos.clear();
        trilhos.add(new Trilho(origem.menos(0, altura), altura, 90));
        trilhos.add(new Trilho(origem, comprimento, 0));
        trilhos.add(new Trilho(origem.mais(comprimento, 0), altura, -90));
        trilhos.add(new Trilho(origem.mais(comprimento, 0).menos(0, altura), comprimento, 180));
    }

    public CaminhoRetangular(ArrayList<Trilho> trilhos){
        this.trilhos = trilhos;

        this.origem = trilhos.get(1).getOrigem();
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
}
