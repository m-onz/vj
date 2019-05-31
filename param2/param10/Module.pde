class Module {
  int xOffset;
  int yOffset;
  float x1, y1, x2, y2;
  int unit;
  int xDirection = 1;
  int yDirection = 1;
  float speed;
  float r1;
  float r2;
  float r3;
  float r4;
  float s1, s2, s3, s4;
  
  // Contructor
  Module(int xOffsetTemp, int yOffsetTemp, int xTemp, int yTemp, float speedTemp, int tempUnit) {
    xOffset = xOffsetTemp;
    yOffset = yOffsetTemp;
    x1 = xTemp;
    y1 = yTemp;
    speed = speedTemp;
    unit = tempUnit;
    r1 = random(1);
    r2 = random(1);
    r3 = random(1);
    r4 = random(1);
  }
  
  // Custom method for updating the variables
  void update() {
    s1 = noise(frameCount*PI*0.009-r1)*490;
    s2 = noise(frameCount*PI*0.009-r2)*490;
    s3 = noise(frameCount*PI*0.001-r3)*490;
    s4 = noise(frameCount*PI*0.001-r4)*490;
    x1 = cos(frameCount*PI*0.003-r1) * s1 + sin(frameCount*PI*0.003-r4) * s4;
    y1 = sin(frameCount*PI*0.003-r2) * s2 + noise(frameCount*PI*0.003-r3) * s3;
    x2 = cos(frameCount*PI*0.003-r3) * s3 + cos(frameCount*PI*0.003-r2) * s2;
    y2 = sin(frameCount*PI*0.003-r4) * s4 + noise(frameCount*PI*0.003-r1) * s1;
  }
  
  // Custom method for drawing the object
  void display() {
    stroke(noise(frameCount*PI*0.009-r1+r2)*50+200, 255, 255);
    line(xOffset + x1, yOffset + y1, xOffset + x2, yOffset + y2);
  }
}
