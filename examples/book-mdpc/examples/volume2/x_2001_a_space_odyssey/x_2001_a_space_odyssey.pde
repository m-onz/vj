// Manuale di Programmazione Cinematografica
// Daniele Olmisani, 2015

// 2001 A Space Odyssey

final color PAPER = color(255,228,181);
final color INK1 = color(0);
final color INK2 = color(64);

void setup()  {
  size(480, 640, OPENGL);
  smooth(8);
  noLoop();
}

void draw()  {
  
  float fov = PI/3.0;
  float camZ = (height/2.0) / tan(fov/2.0); 
  float aspect =  float(width)/float(height);
  perspective(fov, aspect, camZ/2.0, camZ*2.0); 
  
  translate(width/2.0, height/2.0, 0);
  rotateX(-PI/6); 
  rotateY(PI/3);
  
  background(PAPER);
  lights();
  
  fill(INK1);
  stroke(INK2);
  strokeWeight(2.0); 
  box(40, 360, 160); 
  
  save("2001-a-space-odyssey.png");
}
