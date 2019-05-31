
Mover[] movers = new Mover[50];

void setup() {
  fullScreen(P3D);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1,4),0,0); 
  }
}

void draw() {
  background(0);
  lights();
  
  for (int i = 0; i < movers.length; i++) {

    PVector wind = new PVector(0.01,0);
    PVector gravity = new PVector(0,0.1);
    
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }

}
