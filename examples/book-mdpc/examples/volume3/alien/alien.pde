// Manuale di Programmazione Cinematografica
// Daniele Olmisani, 2015

// Alien

final color PAPER = color(30);
final color INK = color(225);

final float TEETH = 10;;

void setup() {
  size(480, 640);
  noLoop();
}

void draw() {
  
  PGraphics g = drawMounth();
  
  image(g, 0, 0);
  scale(0.25);
  image(g, 1.5*width,1.5* height);

  save("alien.png");
}

PGraphics drawMounth() {
  
  PGraphics g = createGraphics(width, height);
  
  g.beginDraw();
  g.background(PAPER);
  g.fill(INK);
  g.noStroke();

  g.scale(g.width/TEETH, g.height/TEETH);
  drawTeeth(g);
  
  g.resetMatrix();
  g.translate(0, g.height);
  g.scale(g.width/TEETH, -g.height/TEETH);
  drawTeeth(g);
  g.endDraw();
  
  return g;
}

void drawTeeth(PGraphics g) {
  g.rect(0, 0, g.width/TEETH, 0.2);
  for(int i=0; i<TEETH; i++) {
     g.triangle(i, 0.19, i+1, 0.19, i+0.5, (i==0 || i==TEETH-1) ? 2.5 : 1);
  }
}