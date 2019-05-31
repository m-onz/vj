class Module {
  int xOffset;
  int yOffset;
  float x, y;
  int unit;
  int xDirection = 1;
  int yDirection = 1;
  float speed; 
  
  // Contructor
  Module(int xOffsetTemp, int yOffsetTemp, int xTemp, int yTemp, float speedTemp, int tempUnit) {
    xOffset = xOffsetTemp;
    yOffset = yOffsetTemp;
    x = xTemp;
    y = yTemp;
    speed = speedTemp;
    unit = tempUnit;
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
    stroke(0);
    
    //strokeWeight(11);
    //strokeCap(ROUND);
    pushMatrix();
    translate(xOffset + x + 30, yOffset + y-50, 0);
    rotateZ(1.55);
    //rotate(-1.55);
    //line(0, 0, 15, 15);
    
    noFill();
    strokeWeight(10.0);
    strokeJoin(MITER);
    beginShape();
    vertex(35, 20);
    vertex(65, 50);
    vertex(35, 80);
    endShape();
    popMatrix();
  }
}
