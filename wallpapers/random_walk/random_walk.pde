
class Walker {
  int x;
  int y;
  
  Walker () {
    x = width / 2;
    y = height / 2;
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
    int stepx = int(random(3))-1;
    int stepy = int(random(3))-1;
    if (x < width-10 && y < height-10 && x > 10 && y > 10) {
      x += stepx * 11;
      y += stepy * 11;
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
