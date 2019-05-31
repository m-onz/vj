
class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  PImage photo;

  Mover() {
    position = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    topspeed = 6;
    photo = loadImage("cig.png");
  }

  void update() {

    acceleration = PVector.random2D();
    acceleration.mult(random(0.1));
    acceleration.mult(1);

    velocity.add(acceleration);
    velocity.limit(topspeed);
    position.add(velocity);
  }

  void display() {
    stroke(255);
    strokeWeight(2);
    fill(127);
    //ellipse(position.x, position.y, 48, 48);
    image(photo, position.x, position.y, 500, 500);
  }

  void checkEdges() {

    if (position.x > width) {
      position.x = 0;
    } 
    else if (position.x < 0) {
      position.x = width;
    }

    if (position.y > height) {
      position.y = 0;
    } 
    else if (position.y < 0) {
      position.y = height;
    }
  }
}
