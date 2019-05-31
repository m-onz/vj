
float t = 0;
float size = 0;

void setup () {
  background(2);
  size(640, 480, P3D);
  colorMode(HSB);
  smooth();
}

void draw () {
  noStroke();
  //fill(0, 1);
  background(2);
  
  rect(0,0,width,height);
  
  strokeWeight(5);
  pushMatrix();
  translate(width/2, height/2);
  noFill();
  
  for (int i = 0; i < 11; i ++) {
    //size = noise(t/100-(i/50)) * 1500;
    size += 0.01;
    pushMatrix();
    rotateX(sin(t / 190-(i/90))* 2);
    rotateY(sin(t / 200-(i/100))* 2);
    rotateZ(cos(t / 210-(i/70))* 2);
    stroke(sin(t/10)*20+130-(i/10), 255, 255);
    translate(x(t+i), y(t+i));
    box(1, 1, size);
    popMatrix();
  }
  if (size > 700) size = 0;
  popMatrix();
  t++;
}

float x(float t) {
  return sin(t / 50) + sin(t) * width/3; 
}

float y(float t) {
  return cos(t/ 50) * height/3; 
}
