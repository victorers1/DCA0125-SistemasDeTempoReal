package main.models;

import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;

public class Trem {
    private Color cor = Color.BLACK;
    private Integer velocidade = 0;
    private Integer comprimento = 30, altura = 15;

    public Node getTremNode() {
        final var trem = new Rectangle(comprimento, altura);
        trem.setFill(this.cor);
        return trem;
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
