package main.models;

public class Velocidade {
    private float dx=0,dy=0;

    public Velocidade(float dx, float dy) {
        this.dx = dx;
        this.dy = dy;
    }

    public float getDx() {
        return dx;
    }

    public void setDx(float dx) {
        this.dx = dx;
    }
}
