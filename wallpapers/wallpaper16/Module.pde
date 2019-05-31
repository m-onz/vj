class Module {
  int xOffset;
  int yOffset;
  float x, y;
  int unit;
  int xDirection = 1;
  int yDirection = 1;
  float speed; 
  float r1;
  float r2;
  float r3;
  float r4;
  float r5;
  float r6;
  float accum;
  boolean choice;

  Module(int xOffsetTemp, int yOffsetTemp, int xTemp, int yTemp, float speedTemp, int tempUnit) {
    xOffset = xOffsetTemp;
    yOffset = yOffsetTemp;
    x = xTemp;
    y = yTemp;
    speed = speedTemp;
    unit = tempUnit;
    r1 = random(-80, 80);
    r2 = random(-80, 80);
    r3 = random(-80, 80);
    r4 = random(-80, 80);
    r5 = random(-80, 80);
    r6 = random(-80, 80);
    accum = 0;
    choice = random(100) > 50;
  }
  
  // Custom method for updating the variables
  void update() {
    x = x + (speed * xDirection);
    if (x >= unit || x <= 0) {
      xDirection *= -1;
      x = x + (1 * xDirection);
      y = y + (1 * yDirection);
    }
    if (y >= unit || y <= 0) {
      yDirection *= -1;
      y = y + (1 * yDirection);
    }
  }
  
  void display() {
    noStroke();
    noFill();
    stroke(11);
    strokeWeight(11);    
    pushMatrix();
    scale(1.1);
    translate(xOffset + x-80, yOffset + y-80, 0);
    if (choice) {
      rotateX(noise(millis()*0.003-r1-r3)*0.09+(accum));
    } else {
      rotateZ(noise(millis()*0.003-r2-r6)*0.09+(accum));
    }
    arc(50, 55, 50, 50, 0, HALF_PI);
    popMatrix();
    accum+=0.001;
    if (accum > 3) accum = 0;
  }
}
