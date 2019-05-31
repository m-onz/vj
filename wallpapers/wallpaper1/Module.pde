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
    fill(255);
    //ellipse(xOffset + x, yOffset + y, 6, 6);
    strokeWeight(7);
    stroke(255);
    
    pushMatrix();
    translate(xOffset+x, yOffset+y, 0);
    //rotateY(millis()* 0.003+speed*3);
    //rotateX(millis()* 0.003+speed*3);
    if (mousePressed) {
      rotateZ(millis()* 0.003+speed*3);
    } else {
      //rotateZ(speed); 
    }
    stroke(#ff8040);
    line(0, 0, 8, 8);
    stroke(#e4e4e4);
    line(8, 8, 20, 20);
    stroke(#272425);
    line(20, 20, 25, 25);
    popMatrix();
  }
}
