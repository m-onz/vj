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
  
  
  
  // Custom method for drawing the object
  void display() {
    noStroke();
    noFill();
    stroke(0);
    strokeWeight(r1/2 + 2);
    //strokeCap(ROUND);
    
    pushMatrix();
  //scale(1.1);
    translate(xOffset + x, yOffset + y, 0);
    rotateZ(noise(millis()*0.003-r1-r2)*0.9+(accum));
    rotateX(noise(millis()*0.003-r1-r6)*0.9+(accum));
    rotateY(noise(millis()*0.003-r1-r3)*0.9+(accum));
    //rotate(-1.55);
    //triangle(30, 75, 58, 20, 86, 75);
    arc(50, 50, 80, 80, 0, PI+QUARTER_PI, CHORD);
    popMatrix();
    accum+=0.001;
    if (accum > 11) accum = 0;
  }
}
