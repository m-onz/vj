
float yoff = 0.0;

class noiseLine {
  void run (int placing) {
    translate(0, placing);
    beginShape(); 
    float xoff = 0;
    for (float x = 0; x <= width; x += 10) {
      float y = map(noise(xoff, yoff), 0, 1, 200,300);
      vertex(x, y); 
      xoff += 0.05;
    }
    yoff += 0.01;
    vertex(width, height);
    vertex(0, height);
    endShape(CLOSE); 
  }
}

noiseLine l;
noiseLine l2;
noiseLine l3;
noiseLine l4;

void setup() {
  size(640, 360, P3D);
  noFill();
  stroke(225);
  l = new noiseLine();
  l2 = new noiseLine();
  l3 = new noiseLine();
  l4 = new noiseLine();
}

void draw() {
  background(51);
  translate(width/2, 0, -width/2);
  rotateY(millis()*0.0004);
  rotateZ(millis()*0.0004);
  l.run(-40);
  l2.run(-30);
  l3.run(-20);
  l4.run(-80);
}
