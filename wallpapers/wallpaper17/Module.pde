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
  // Custom method for drawing the object
  void display() {
    noFill();
    lights();
    //fill(255);
    stroke(255);
    strokeWeight(4);
    
    pushMatrix();
    scale(1.1);
    translate(xOffset + x+22, yOffset + y+50);
    rotateX(noise(millis()*0.0003-xOffset)*5);
    rotateY(noise(millis()*0.0003-yOffset)*5);
    //rotateZ(0.9);
    rotateZ(noise(millis()*0.0003-yOffset)*5);
    box(72);
    popMatrix();
  }
}
