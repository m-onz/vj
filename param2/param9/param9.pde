
int unit = 65;
int count;
Module[] mods;

void setup() {
  size(640, 480, P3D);
  smooth();
  noStroke();
  int wideCount = width / unit;
  int highCount = height / unit;
  count = wideCount * highCount;
  mods = new Module[count];
  colorMode(HSB);
  strokeWeight(3);
  int index = 0;
  for (int y = 0; y < highCount; y++) {
    for (int x = 0; x < wideCount; x++) {
      mods[index++] = new Module(x*unit, y*unit, unit/2, unit/2, random(0.05, 0.8), unit);
    }
  }
}

void draw() {
  //background(0);
  fill(20, 66);
  noStroke();
  rect(0, 0, width, height);
  translate(0,0,150);
  for (Module mod : mods) {
    mod.update();
    mod.display();
  }
}
