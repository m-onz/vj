
import garciadelcastillo.dashedlines.*;

Mover[] movers = new Mover[200];

float g = 0.3;
//PFont f;

void initializeNodes() {
  n = new Node[11];
  n[0] = new Node(1.0/8 * width, 1.0/8 * height, 5);
  n[1] = new Node(3.0/8 * width, 3.0/8 * height, 5);
  n[2] = new Node(5.0/8 * width, 1.0/8 * height, 5);
  n[3] = new Node(7.0/8 * width, 3.0/8 * height, 5);
  n[4] = new Node(2.0/8 * width, 5.0/8 * height, 5);
  n[5] = new Node(3.0/8 * width, 7.0/8 * height, 5);
  n[6] = new Node(1.0/8 * width, 7.0/8 * height, 5);
  n[7] = new Node(5.5/8 * width, 5.0/8 * height, 5);
  n[8] = new Node(7.0/8 * width, 5.0/8 * height, 5);
  n[9] = new Node(6.5/8 * width, 7.0/8 * height, 5);
  n[10] = new Node(5.0/8 * width, 7.0/8 * height, 5);
}


void setup() {
  fullScreen(P3D);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1,2),random(width),random(height)); 
  }
  dash = new DashedLines(this);
  
  // Dash patterns can be created with different combinations of dash-gap lengths
  dash.pattern(80);
  //dash.pattern(30, 10);
  //float[] decreasingPattern = { 50, 10, 40, 10, 30, 10, 20, 10, 10, 10 };
  //dash.pattern(decreasingPattern);

  initializeNodes();
  //f = createFont("Arial", 12);
}

void draw() {
  background(0);
  if (random(100)>70)dash.pattern(random(100+5));


  for (int i = 0; i < movers.length; i++) {
    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        PVector force = movers[j].attract(movers[i]);
        movers[i].applyForce(force);
      }
    }

    movers[i].update();
    movers[i].display();
  }
  
  //dash.offset(dist);
  //dist += 1;
}
