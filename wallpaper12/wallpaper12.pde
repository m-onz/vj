

int unit = 151;
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
  //sphereDetail(5);
  int index = 0;
  for (int y = 0; y < highCount; y++) {
    for (int x = 0; x < wideCount; x++) {
      mods[index++] = new Module(x*unit, y*unit, unit/2, unit/2, random(1.05, 1.05), unit);
    }
  }
}

void draw() {
  lights();
  background(0);
  for (Module mod : mods) {
    mod.update();
    mod.display();
  }
}
