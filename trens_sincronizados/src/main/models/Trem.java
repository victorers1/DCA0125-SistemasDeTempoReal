package main.models;

import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;

public class Trem {
    private Color cor = Color.BLACK;
    private Integer velocidade = 0;
    private final Integer comprimento = 30;
    private final Integer altura = 15;
    private final Rectangle desenho;

    public Trem(Color cor, Integer velocidade) {
        this.cor = cor;
        this.velocidade = velocidade;

        this.desenho = new Rectangle(comprimento, altura);
        this.desenho.setFill(this.cor);
    }

    public Rectangle getDesenho() {
        return desenho;
    }

    public Color getCor() {
        return cor;
    }

    public void setCor(Color cor) {
        this.cor = cor;
    }

    public Integer getVelocidade() {
        return velocidade;
    }

    public void setVelocidade(Integer velocidade) {
        this.velocidade = velocidade;
    }
}
