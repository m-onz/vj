
class plaid {
 int n;
 int n2;
 int n3;
 int n4;
 plaid() {
   n=11;
   n2=14;
   n3=10;
   n4=10;
 }
 void display() {
  //n3 = (int) ;
  pushMatrix();
  fill(#36e8ea);
  translate(0, noise(millis()*0.0003)*500);
  for (int x = 0; x < width; x += n2 * n4) {
    rect(x, 0, n2, height);
  }
  fill(#ff4097);
  rotateX(noise(millis()*0.003)*2);
  for (int y = 0; y < height; y += n2 * n4) {
    for (int i = 0; i < 5; i++) {
      rect(0, y + i * n, width, n3);
    }
  }
  fill(#8dcead);
  for (int x = 0; x < width; x += n2 * n4) {
    for (int y = 0; y < height; y += n2 * n4) {
      for (int i = 0; i < 5; i++) {
        rect(x, y + i * n, n2, n3);
      }
    }
  } 
  popMatrix();
 }
}

plaid p;

void setup () {
  size(640, 480, P3D);
  noStroke();
  p = new plaid();
}

void draw() {
  background(#eae7de);
  p.display();
}
