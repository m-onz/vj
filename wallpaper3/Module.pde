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
  
  // Contructor
  Module(int xOffsetTemp, int yOffsetTemp, int xTemp, int yTemp, float speedTemp, int tempUnit) {
    xOffset = xOffsetTemp;
    yOffset = yOffsetTemp;
    x = xTemp;
    y = yTemp;
    speed = speedTemp;
    unit = tempUnit;
    r1 = random(-20, 20);
    r2 = random(-20, 20);
    r3 = random(-20, 20);
    r4 = random(-20, 20);
    r5 = random(-20, 20);
    r6 = random(-20, 20);
  }
  
  // Custom method for updating the variables
  void update() {
    x = x + (speed * xDirection);
    if (x >= unit || x <= 0) {
      xDirection *= -1;
      x = x + (1 * xDirection) + noise(millis()*0.004+r1+r2) * 1;
      y = y + (1 * yDirection) + noise(millis()*0.004+r3+r4) * 1;
    }
    if (y >= unit || y <= 0) {
      yDirection *= -1 - noise(millis()*0.004+r4+r5) * 1;
      y = y + (1 * yDirection) - noise(millis()*0.004+r1+r2) * 1;
    }
  }
  
  // Custom method for drawing the object
  void display() {
    stroke(0);
    
    //strokeWeight(11);
    //strokeCap(ROUND);
    
    pushMatrix();
    scale(1.1);
    translate(xOffset + x, yOffset + y, 0);
    rotateZ(noise(millis()*0.003-r1-r4)*3+r2+r5);
    //rotate(-1.55);
    line(0, 0, 15, 15);
    
    noFill();
    strokeWeight(10.0);
    strokeJoin(MITER);
    beginShape();
    vertex(r1, r2);
    vertex(r3, r4);
    vertex(r5, r6);
    endShape();
    popMatrix();
  }
}
