package main.models;

import javafx.animation.PathTransition;
import javafx.geometry.Point3D;
import javafx.scene.paint.Color;
import javafx.scene.shape.Line;
import javafx.util.Duration;

public class Trilho {
    private Ponto inicio = new Ponto(0, 0);
    private Integer comprimento = 0;
    private Integer angulo = 0;
    private Color cor = Color.BLACK;
    private Line linha;

    public Trilho(Ponto inicio, Integer comprimento, Integer angulo) {
        this.inicio = inicio;
        this.comprimento = comprimento;
        this.angulo = angulo;

        linha = new Line(inicio.getX(), inicio.getY(), inicio.getX() + comprimento, inicio.getY() + comprimento);
        linha.setRotationAxis(new Point3D(inicio.getX(), inicio.getY(), 1));
        linha.setRotate(angulo);
    }

    public PathTransition moverTrem(Trem trem) {
        final var transition = new PathTransition();
        transition.setNode(trem.getTremNode());
        transition.setDuration(Duration.seconds(trem.getVelocidade()));
        transition.setPath(linha);
        return transition;
    }
    
    public Ponto getInicio() {
        return inicio;
    }

    public void setInicio(Ponto inicio) {
        this.inicio = inicio;
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
