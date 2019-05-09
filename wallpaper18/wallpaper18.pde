// wallpaper

void setup(){
  fullScreen(P3D);
  smooth();
  noStroke();
}

void draw() {
  background(#e8ded2);
  int ystart = 0, xstart = 0;
  int h = 84;
  float noise = noise(millis()*0.0003)*2;
  scale(noise);
  pushMatrix();
  while (ystart < 3500) {
    int x = xstart, y = ystart;
    while (x < width*2) {
      fill(#b02a42);
      quad(x, y, x + 31, y - 21, x + 84, y - 11, x + 53, y + 10);
      fill(#3a9fca);
      quad(x, y, x + 53, y + 10, x + 53, y + 10 + h, x, y + h);
      x += 84;
      y -= 11;
    }
    xstart -= 31;
    ystart += h + 21;
    h *= 1.1;
  }
  popMatrix();
}
;
