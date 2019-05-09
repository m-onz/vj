
/*

grid
grid shadow?
abstract lines + dots
random chunky vertex, with thick lines
*/
int grid = 28; 

void setup () {
  size(640, 480);
}

void draw () {
  background(255);
  stroke(0);
  strokeWeight(4);
  for (int i = 0; i < width; i+=grid) {
    line (i, 0, i, height);
  }
  for (int i = 0; i < height; i+=grid) {
    line (0, i, width, i);
  }
}
