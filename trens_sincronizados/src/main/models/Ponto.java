package main.models;

public class Ponto {
    private Integer x = 0, y = 0;

    public Ponto(Integer x, Integer y) {
        this.x = x;
        this.y = y;
    }

    public Ponto menos(Ponto outro) {
        return new Ponto(this.x - outro.x, this.y - outro.y);
    }

    public Ponto menos(Integer x, Integer y) {
        return menos(new Ponto(x, y));
    }

    public Ponto mais(Ponto outro) {
        return new Ponto(this.x + outro.x, this.y + outro.y);
    }

    public Ponto mais(Integer x, Integer y) {
        return mais(new Ponto(x, y));
    }

    public Integer getY() {
        return y;
    }

    public void setY(Integer y) {
        this.y = y;
    }

    public Integer getX() {
        return x;
    }

    public void setX(Integer x) {
        this.x = x;
    }
}
