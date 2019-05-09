
class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  float seed;
  float scaler;

  Mover(float m, float x , float y) {
    mass = m;
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    seed = random(3);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    scaler+= 0.003;
    if(scaler>11)scaler=0;
    noStroke();
    fill(255);
    //ellipse(position.x,position.y,mass*16,mass*16);
    pushMatrix();
    translate(position.x,position.y);
    rotateX(noise(millis()*0.001-seed)*scaler);
    rotateY(noise(millis()*0.001-seed)*scaler);
    rotateZ(noise(millis()*0.001-seed)*scaler);
    box(10, 10, 900);
    popMatrix();
  }

  void checkEdges() {

    if (position.x > width) {
      position.x = width;
      velocity.x *= -1;
    } else if (position.x < 0) {
      velocity.x *= -1;
      position.x = 0;
    }

    if (position.y > height) {
      velocity.y *= -1;
      position.y = height;
    }

  }

}
