Controller controller = new Controller();


void setup() {
  size(700, 600);
  background(255);
  controller.getDesenho();

  stroke(255, 0, 0);
  circle(60, 60, 5);
  
  
  color c = color(255,0,0);
  
  if(c == color(255,0,0)){
    System.out.println("cor correta");
  }
}


void draw(){
  controller.getDesenho();
}
