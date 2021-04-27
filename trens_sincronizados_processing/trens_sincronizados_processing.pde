Controller controller = new Controller();


void setup() {
  size(700, 600);
  background(255);
  controller.getDesenho();

  stroke(255, 0, 0);
  circle(60, 60, 5);
}


void draw(){
  background(255);
  controller.getDesenho();
}
