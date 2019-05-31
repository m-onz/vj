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
  
  // Contructor
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
    stroke(255);
    strokeWeight(3);    
    pushMatrix();
    scale(1.1);
    translate(xOffset + x, yOffset + y + 40, 0);
    if (choice) {
      shearY(noise(millis()*0.003-r1-r2)*0.009+(accum));
    } else {
      shearX(noise(millis()*0.003-r1-r6)*0.009+(accum));
    }
    rotateX(noise(millis()*0.003-r1-r3)*0.09+(accum));
    rotateY(noise(millis()*0.003-r4-r5)*0.09+(accum));
    rotateZ(noise(millis()*0.003-r2-r6)*0.09+(accum));
    curve(0, 0, r3, r4, r5, r1+r2, 50, 50);
    popMatrix();
    fill(255);
    noStroke();
    circle(0, 0, 5);
    accum+=0.001;
    if (accum > 3) accum = 0;
  }
}
