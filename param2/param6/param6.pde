
float[][] distances;
float maxDistance;
int spacer;
float expander;

void setup() {
  size(640, 360, P3D);
  maxDistance = dist(width/2, height/2, width, height);
  distances = new float[width][height];
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float distance = dist(width/2, height/2, x, y);
      distances[x][y] = distance/maxDistance * 255;
    }
  }
  spacer = 50;
  //noStroke();
  strokeWeight(2);
  noFill();
  sphereDetail(4);
  colorMode(HSB);
}

void draw() {
  background(0);
  lights();
  ortho();
  expander = noise(frameCount*PI*0.002)*130;
  //rotateY(noise(frameCount*PI*0.002)*3);
  for (int y = 0; y < height; y += spacer) {
    for (int x = 0; x < width; x += spacer) {
      pushMatrix();
      //rotateX(noise(frameCount * PI * 0.003 + (x/200)) * (distances[x][y]/30));
      translate(x + spacer/2, y + spacer/2, expander * -1);
      stroke(expander-(x/20), 255, y % 255);
      rotateX(noise(frameCount * PI * 0.003 + (x/100)) * (distances[x][y]/15));
      sphere(expander);
      popMatrix();
    }
  }
}
