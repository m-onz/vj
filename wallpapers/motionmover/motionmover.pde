
Mover mover;

void setup() {
  size(640,360);
  mover = new Mover(); 
  smooth();
}

void draw() {
  background(255);
  mover.update();
  mover.checkEdges();
  mover.display(); 
}
