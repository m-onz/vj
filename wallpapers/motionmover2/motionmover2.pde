
Mover mover;

void setup() {
  fullScreen(P3D);
  mover = new Mover(); 
  smooth();
}

void draw() {
  background(255);
  mover.update();
  mover.checkEdges();
  mover.display(); 
}
