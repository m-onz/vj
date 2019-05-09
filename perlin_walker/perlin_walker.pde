
class Walker {
  float x;
  float y;
  float tx;
  float ty;
  
  Walker () {
    x = width / 2;
    y = height / 2;
    tx = 0;
    ty = 10000;
  }
  
  void display () {
    stroke(0);
    //noStroke();
    translate(x, y, 0);
    fill(255);
    rotateX(millis()* 0.0004);
    rotateY(millis() * PI * 0.0003);
    rotateZ(millis() * PI * 0.0002);
    //box(10, 10, noise(millis() * PI * 0.0003)* 500);
    box(40);
  }
  
  void step () {
    x = map(noise(tx), 0, 1, 0, width);
    y = map(noise(ty), 0, 1, 0, height);
    if (x < width-10 && y < height-10 && x > 10 && y > 10) {
      x += 0.11;
      y += 0.11;
    } else {
      x = width / 2;
      y = height / 2;
    }
  }
}

Walker w;

void setup () {
  size(640, 480, P3D);
  background(0);
  w = new Walker();
}

void draw () {
  lights();
  //
  w.step();
  w.display();
}
