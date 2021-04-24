package main.models;

import javafx.animation.PathTransition;
import javafx.geometry.Point3D;
import javafx.scene.paint.Color;
import javafx.scene.shape.Line;
import javafx.scene.transform.Rotate;
import javafx.util.Duration;

public class Trilho {
    private Ponto origem = new Ponto(0, 0);
    private Integer comprimento = 0;
    private Integer angulo = 0; // Em graus
    private Color cor = Color.BLACK;
    private Line linha;

    public Trilho(Ponto origem, Integer comprimento, Integer angulo) {
        this.origem = origem;
        this.comprimento = comprimento;
        this.angulo = angulo;

        linha = new Line(origem.getX(), origem.getY(), origem.getX() + comprimento, origem.getY());
        linha.getTransforms().add(new Rotate(angulo, origem.getX(), origem.getY()));
    }

    public PathTransition moverTrem(Trem trem) {
        final var transition = new PathTransition();
        transition.setNode(trem.getTremNode());
        transition.setDuration(Duration.seconds(trem.getVelocidade()));
        transition.setOrientation(PathTransition.OrientationType.ORTHOGONAL_TO_TANGENT);
        transition.setPath(linha);
        return transition;
    }

    public Ponto getOrigem() {
        return origem;
    }

    public void setInicio(Ponto origem) {
        this.origem = origem;
    }

    public Integer getComprimento() {
        return comprimento;
    }

    public void setComprimento(Integer comprimento) {
        this.comprimento = comprimento;
    }

    public Integer getAngulo() {
        return angulo;
    }

    public void setAngulo(Integer angulo) {
        this.angulo = angulo;
    }

    public Color getCor() {
        return cor;
    }

    public void setCor(Color cor) {
        this.cor = cor;
    }

    public Line getLinha() {
        return linha;
    }

    public void setLinha(Line linha) {
        this.linha = linha;
    }
}
