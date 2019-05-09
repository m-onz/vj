
class Cigarette {
  int xOffset;
  int yOffset;
  float x, y;
  int incro = 0;
  float seedX = 0;
  float seedY = 0;
  PGraphics pg;
  int tubeRes = 32;
  float[] tubeX = new float[tubeRes];
  float[] tubeY = new float[tubeRes];
  PImage img;
  Cigarette (int xOffsetTemp, int yOffsetTemp, int xTemp, int yTemp) {
    xOffset = xOffsetTemp;
    yOffset = yOffsetTemp;
    x = xTemp;
    y = yTemp;
    pg = createGraphics(400, 400);
    pg.beginDraw();
    pg.background(0);
    pg.noStroke();
    pg.endDraw(); 
    float angle = 375.0 / tubeRes;
    for (int i = 0; i < tubeRes; i++) {
      tubeX[i] = cos(radians(i * angle));
      tubeY[i] = sin(radians(i * angle));
    }
    noStroke();
    seedX = random(400);
    seedY = random(400);
  }
  void display () {
    pushMatrix();
    translate(xOffset + x, yOffset + y);
    scale(0.1);
    //rotateX(map(mouseY, 0, height, -PI, PI));
    //rotateY(map(mouseX, 0, width, -PI, PI));
    rotateX(millis()*0.0009);
    rotateY(millis()*0.0009);
    rotateZ(millis()*0.0009);
    //incro++;
    //if (incro > 190) incro = 0;
    pg.beginDraw();    
    pg.stroke(#272425);
    pg.strokeWeight(15);
    pg.background(#e4e4e4);
    pg.fill(#ff8040);
    pg.rect(0, 0, pg.width, 130);
    pg.fill(#888888);
    pg.rect(0, pg.height - (40+incro), pg.width, (40+incro));
    pg.endDraw(); 
    beginShape(QUAD_STRIP);
    texture(pg);
    for (int i = 0; i < tubeRes; i++) {
      float x = tubeX[i] * 30;
      float z = tubeY[i] * 30;
      float u = 400 / tubeRes * i;
      vertex(x, -150, z, u, 0);
      vertex(x, 150, z, u, 400);
    }
    endShape();
    popMatrix();
  }
}

//Cigarette[] cigs;


int unit = 60;
int count;
Cigarette[] mods;

void setup() {
  fullScreen(P3D);
  noStroke();
  int wideCount = width / unit;
  int highCount = height / unit;
  count = wideCount * highCount;
  mods = new Cigarette[count];

  int index = 0;
  for (int y = 0; y < highCount; y++) {
    for (int x = 0; x < wideCount; x++) {
      mods[index++] = new Cigarette(x*unit, y*unit, unit/2, unit/2);
    }
  }
}

void draw() {
  background(0);
  for (Cigarette mod : mods) {
    mod.display();
  }
}
