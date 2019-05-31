
int cols = 40;
int rows = 40;

void setup()  {
  fullScreen(P3D, 2);
  noStroke();
  fill(204);
  //noFill();
  //stroke(255);
  sphereDetail(4);
}

float incro = 0;

void draw()  {
  background(0);
  lights();
  incro += 0.001;
  if (incro > 7) incro = 0;
  ortho(-width/2, width/2, -height/2, height/2);
  translate(90, 20, -200);
  //pushMatrix();
  rotateY(noise(millis()*0.0003-PI/20)*incro); 
  rotateX(noise(millis()*0.0003-PI/20)*incro); 
  rotateZ(noise(millis()*0.0003-PI/20)*incro); 
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      pushMatrix();
      translate(i*50, j*50, 0);
      rotateX(noise(millis()*0.0002-PI/6)*i); 
      rotateY(noise(millis()*0.0003-PI/3)*j); 
      rotateZ(noise(millis()*0.0003-PI/4+i)*j); 
      sphere(noise(millis()*0.00004 - PI - (i-j))* 500); 
      popMatrix();
    }
  }
  //popMatrix();
}
