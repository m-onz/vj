
class Wave {
 color colors[] = { #36e8ea, #ff4097, #eae7de, #BAE1D5, #C9E0F6, #BAE1D5 };
 float seed;
 float gap;
 Wave(float _seed) {
  smooth();
  strokeWeight(16);
  noFill();
  seed = _seed;
  gap = random(400);
 }
 void display () {
   
   pushMatrix();
   translate(gap, noise(millis()*0.002-seed)*100);
   rotateZ(noise(millis()*0.0003+seed));
   float n = noise(millis()*0.002-seed)*30;
   for (int row = 0; row < 20; row++) {
    for (int i = 0; i < colors.length; i++) {
      stroke(colors[i]);
      int x = -i * 20, y = row * 500 - i * 20;
      beginShape();
      while (x < width) {
        vertex(x, y); x += 600+n; y += 130 +n;
        vertex(x, y); x += 130+n; y -= 200 -n;
        vertex(x, y);
      }
      endShape();
    }
  }
  popMatrix();
 }
}

Wave w;
Wave w2;
Wave w3;

void setup() {
  fullScreen(P3D);
  w = new Wave(random(3));
  w2 = new Wave(random(22));
  w3 = new Wave(random(55));
}

void draw() {
  background(#222222);
  w.display();
  w2.display();
  w3.display();
}
