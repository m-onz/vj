// Manuale di Programmazione Cinematografica
// Daniele Olmisani, 2016

// The Godfather


final color PAPER = color(10);
final color INK = color(240);


void setup() {
  size(480, 640);
  noLoop();
}


void draw() {
  
  background(PAPER);
  
  fill(INK);
  noStroke();
  
  triangle(0.15*width, 0, 0.85*width, 0, 0.5*width, 1.4*height);
  
  fill(PAPER);
  
  translate(width/2.0, height/4.0);
  
  float sx = min(width, height) / 4.8;
  float sy = sx / 2.0;
   
  beginShape();
    vertex(-sx, -sy);
    vertex( sx,  sy);
    vertex( sx, -sy);
    vertex(-sx,  sy);
  endShape();

  save("the-godfather.png");
}