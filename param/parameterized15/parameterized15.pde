
liner l;
liner l2;
liner l3;
liner l4;
PShape s;

void setup () {
  size(640, 480, P3D);
  s = loadShape("cigarette.svg");
  l = new liner();
  l2 = new liner();
  l3 = new liner();
  l4 = new liner();
  smooth();
  colorMode(HSB);
}

void draw () {
  background(20);
  
  l.draw();
  l2.draw();
  l3.draw();
  l4.draw();
  //s.enableStyle();
  s.setStroke(255);
  shape(s, width/2-100, height/2-100, 200, 200);
}
