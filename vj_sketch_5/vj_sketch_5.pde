 
float a = 0.0;
float rSize;  // rectangle size

void setup() {
  size(640, 480, P3D);
  rSize = width / 6;  
  noStroke();
  fill(204, 204);
}

void draw() {  
  background(126);
  
  a += 0.005;
  if(a > TWO_PI) { 
    a = 0.0; 
  }
  
  translate(width/2, height/2);
  
  for (int i = 0; i < 7; i++) {
    rSize = noise(millis()*0.0001*i) * 500;
    noFill();
    rotateX(a);
    rotateY(noise(a * 2.0) - i);
    stroke(0);
    rect(-rSize, -rSize, rSize*2, rSize*2);
    rotateX(noise(a * 1.001) - i);
    rotateY(noise(a * 2.002) - i);
    rect(-rSize, -rSize, rSize*2, rSize*2);
  }
}
