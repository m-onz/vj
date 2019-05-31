
int cols = 10;
int rows = 10;

void setup()  {
  size(640, 360, P3D);
  noStroke();
  fill(204);
  //noFill();
  //stroke(255);
}

void draw()  {
  background(0);
  lights();
  ortho(-width/2, width/2, -height/2, height/2);
  translate(90, 20, -200);
  rotateY(noise(millis()*0.0003-PI/3)*1); 
  rotateX(noise(millis()*0.0003-PI/3)*1); 
  rotateZ(noise(millis()*0.0003-PI/3)*1); 
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      pushMatrix();
      translate(i*50, j*50, -200);
      rotateX(millis()*0.0002-PI/6+i); 
      rotateY(millis()*0.0003-PI/3+j); 
      rotateZ(millis()*0.0003-PI/4+i+j); 
      box(noise(millis()*0.00004 - PI - (i-j))* 100); 
      popMatrix();
    }
  }
  
}
