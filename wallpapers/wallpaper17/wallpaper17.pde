/**
 * Array Objects. 
 * 
 * Demonstrates the syntax for creating an array of custom objects. 
 */

int unit = 150;
int count;
Module[] mods;

void setup() {
  fullScreen(P3D);
  smooth();
  noStroke();
  int wideCount = width / unit;
  int highCount = height / unit;
  count = wideCount * highCount;
  mods = new Module[count];

  int index = 0;
  for (int y = 0; y < highCount; y++) {
    for (int x = 0; x < wideCount; x++) {
      mods[index++] = new Module(x*unit, y*unit, unit/2, unit/2, random(0.05, 0.8), unit);
    }
  }
}

void draw() {
  ortho(-width/2, width/2, -height/2, height/2);
  background(0);
  for (Module mod : mods) {
    mod.display();
  }
}
