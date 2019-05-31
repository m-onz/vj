
liner l;
liner l2;
liner l3;
liner l4;
liner l5;
liner l6;

void setup () {
  size(640, 480, P3D);
  l = new liner();
  l2 = new liner();
  l3 = new liner();
  l4 = new liner();
  l5 = new liner();
  l6 = new liner();
  smooth();
  colorMode(HSB);
}

void draw () {
  background(20);
  ortho();
  l.draw();
  l2.draw();
  l3.draw();
  l4.draw();
  l5.draw();
  l6.draw();
}
