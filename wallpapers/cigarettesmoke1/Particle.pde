
class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  float r = 6;
  boolean highlight;

  Particle(float x, float y) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-2, 2), random(-2, 2));
    position = new PVector(x, y);
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  void intersects(ArrayList<Particle> particles) {
    highlight = false;
    for (Particle other : particles) {
      if (other != this) {
        float d = PVector.dist(other.position, position);
        if (d < r + other.r) {
          highlight = true;
        }
      }
    }
  }
  
  void applyForce(PVector f) {
    acceleration.add(f); 
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    noStroke();
    fill(255);
    if (highlight) {
      fill(#00a080);
    }
    pushMatrix();
    translate(position.x, position.y);
    if (!highlight) {
      box(10, 10, noise(millis()*0.004)*100);
    } else {
      rotateX(noise(velocity.x+millis()*0.003)*3);
      rotateY(noise(velocity.y+millis()*0.003)*2);
      rotateZ(noise(velocity.x+velocity.y+millis()*0.003)*2);
      if (random(100)>99) fill(255);
      translate(0, 0, noise(millis()*0.004)*100);
      sphere(40);
    }
    popMatrix();
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}
