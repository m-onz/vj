

class expandingCircle {
  int seed = 0;
  expandingCircle (int _seed) {
    seed = _seed;
  }
  void display() {
     noFill();
     stroke(255);
     pushMatrix();
     translate(width/2, height/2);
     float size = noise(millis() * PI * 0.00003)* 700;
     rotateX(noise(millis() * PI * 0.0004 + seed)*3);
     rotateY(noise(millis() * PI * 0.0004 + seed)*3);
     rotateZ(noise(millis() * PI * 0.0004 + seed)*3);
     ellipse(0, 0, size, size);
     popMatrix();
  }
}

expandingCircle c;
expandingCircle c2;

void setup () {
  size(640, 480, P3D);
  smooth();
  sphereDetail(7);
  c = new expandingCircle((int) random(1000));
  c2 = new expandingCircle((int) random(1000));
}

void draw () {
  lights();
  background(0);
  c.display();
  c2.display();
}
