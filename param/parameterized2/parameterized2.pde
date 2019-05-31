
liner l;
liner l2;
PShape s;

void setup () {
  size(640, 480);
  s = loadShape("cigarette.svg");
  l = new liner();
  l2 = new liner();
  smooth();
  colorMode(HSB);
}

void draw () {
  background(20);
  
  l.draw();
  l2.draw();
  //s.enableStyle();
  s.setStroke(255);
  shape(s, width/2-100, height/2-100, 200, 200);
}
