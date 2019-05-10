
class Module {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float x;
  float y;
  boolean choice = (random(100) > 50); 
  boolean choice2 = (random(100) > 50); 
  boolean choice3 = (random(100) > 50);
  float speed = 0;

  Module() {
    position = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    topspeed = 6;
    x = random(width);
    y = random(height);
    speed = random(4);
  }

  void update() {
    if (random(100)>99) x = random(width);
    if (random(100)>99) y = random(height);
    PVector center = new PVector(x, y);
    PVector dir = PVector.sub(center, position);
    dir.normalize();
    dir.mult(speed);
    acceleration = dir;
    velocity.add(acceleration);
    velocity.limit(topspeed);
    position.add(velocity);
  }

  void display() {
    float size = 100;
    if (choice3) size = 200;
    if (choice2) {
      noStroke();
      fill(255);
    } else {
      strokeWeight(5);
      stroke(255);
      noFill();
    }
    if (choice) {
      pushMatrix();
      translate(position.x, position.y);
      triangle(30, 75, 58, 20, 86, 75);
      popMatrix();
    } else {
      pushMatrix();
      translate(position.x, position.y);
      rotateX(noise(millis()*0.001+x)*3);
      rotateY(noise(millis()*0.001+y)*3);
      rotateZ(noise(millis()*0.001+x+y)*3);
      box(10, 10, size);
      popMatrix();
    }
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


int unit = 110;
int count;
Module[] mods;

void setup() {
  fullScreen(P3D);
  noStroke();
  sphereDetail(3);
  int wideCount = width / unit;
  int highCount = height / unit;
  count = wideCount * highCount;
  mods = new Module[count];
  int index = 0;
  for (int y = 0; y < highCount; y++) {
    for (int x = 0; x < wideCount; x++) {
      mods[index++] = new Module();
    }
  }
}

void draw() {
  background(0);
  for (Module mod : mods) {
    mod.update();
    mod.display();
  }
}
