Controller controller = new Controller();


void setup() {
  size(700, 600);
  background(255);
  controller.getDesenho();

  stroke(255, 0, 0);
  circle(60, 60, 5);
}


void draw() {
  background(255);
  controller.getDesenho();
}


void keyPressed() {
  if (key == 'q') {
    controller.trens.get(0).velocidade.mais(1, 1);
  } else if (key == 'w') {
    controller.trens.get(1).velocidade.mais(1, 1);
  } else if (key == 'e') {
    controller.trens.get(2).velocidade.mais(1, 1);
  } else if (key == 'a') {
    controller.trens.get(0).velocidade.menos(1, 1);
  } else if (key == 's') {
    controller.trens.get(1).velocidade.menos(1, 1);
  } else if (key == 'd') {
    controller.trens.get(2).velocidade.menos(1, 1);
  } else {
    System.out.println("Opção não existem");
  }
}
