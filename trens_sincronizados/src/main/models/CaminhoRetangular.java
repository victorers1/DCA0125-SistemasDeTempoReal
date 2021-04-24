package main.models;

import java.util.ArrayList;

public class CaminhoRetangular {
    Ponto origem = new Ponto(0, 0);
    Integer comprimento = 0;
    Integer altura = 0;
    ArrayList<Trilho> trilhos = new ArrayList<>(); // Primeiro sempre é o da esquerda e segue em sentido horário

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




}
