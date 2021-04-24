package main.models;

import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;

public class Trem {
    private Color cor = Color.BLACK;
    private Integer velocidade = 0;
    private Integer lado = 0;

    public Node getTremNode() {
        final var trem = new Rectangle(lado, lado);
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

    public Integer getLado() {
        return lado;
    }

    public void setLado(Integer lado) {
        this.lado = lado;
    }


}
