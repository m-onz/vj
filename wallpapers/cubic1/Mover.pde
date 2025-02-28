
DashedLines dash;
Node[] n;
float dist = 0;

class Node {

  float x, y;
  float r;
  boolean dragged;

  Node(float x_, float y_, float r_) {
    x = x_;
    y = y_;
    r = r_;
  }

  void render() {
    pushStyle();
    ellipseMode(CENTER);
    noStroke();
    fill(127, 100);
    ellipse(x, y, 2 * r, 2 * r);
    popStyle();
    if (dragged) {
      x = mouseX;
      y = mouseY;
    }
  }

  boolean inside(float xpos, float ypos) {
    return dist(x, y, xpos, ypos) < r;
  }
}

void mousePressed() {
  for (int i = 0; i < n.length; i++) {
    if (n[i].inside(mouseX, mouseY)) {
      n[i].dragged = true;
    }
  }
}

void mouseReleased() {
  for (int i = 0; i < n.length; i++) {
    n[i].dragged = false;
  }
}

class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
 
  Mover(float m, float x, float y) {
    mass = m;
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    //stroke(0);
    //strokeWeight(2);
    //fill(0, 100);
    stroke(255);
    strokeWeight(4);
    noFill();
    dash.rect(position.x, position.y, mass*24, mass*24);
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(position, m.position);             // Calculate direction of force
    float distance = force.mag();                                 // Distance between objects
    distance = constrain(distance, 5.0, 25.0);                             // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                            // Normalize vector (distance doesn't matter here, we just want this vector for direction

    float strength = (g * mass * m.mass) / (distance * distance); // Calculate gravitional force magnitude
    force.mult(strength);                                         // Get force vector --> magnitude * direction
    return force;
  }


}
