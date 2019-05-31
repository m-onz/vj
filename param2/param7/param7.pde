
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
  spacer = 90;
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
  
  //rotateY(noise(frameCount*PI*0.002)*3);
  for (int y = 0; y < height; y += spacer) {
    for (int x = 0; x < width; x += spacer) {
      expander = noise(frameCount*PI/700+x+y)*400;
      pushMatrix();
      rotateY(noise(frameCount * PI * 0.003 + (x/20)) * (distances[x][y]/930));
      translate(x + spacer/2, y + spacer/2, expander * -1);
      stroke(expander+90, 200, 200);
      rotateX(noise(frameCount * PI * 0.003 + (x/10)) * (distances[x][y]/115));
      sphere(expander);
      popMatrix();
    }
  }
}
