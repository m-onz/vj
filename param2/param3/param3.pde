class Module {
  float x = 0;
  float y = 0;
  float t = 0;
  float r1 = random(300);
  float r2 = random(320);
  float r3 = random(300);
  float r4 = random(300);
  void update () {}
  void display () {
    
    pushMatrix();
    fill(0, 2);
    //noStroke();
    rect(0, 0, width, height);
    
    fill(noise(frameCount*PI*0.004)*(r1/100)+ 150 %255, 255, 255);
    if (random(100)>99)fill(255);
    //strokeWeight(9);
    rotateY(noise(frameCount*PI*0.001+(r3*0.009))*(r1*0.004));
    rect(x, y, 120, 10);
    x = sin(t / r4) * r1 + cos(t / r1) * r2 + sin(t / r2) * r3;
    y = cos(t / r3) * r2 + sin(t/ r3) * r3 + cos(t / r4) * r4;
    popMatrix();
    t += noise(frameCount*PI*0.004) * 2;
  }
}

int unit = 11;
int count = 33;
Module[] mods;

void setup() {
  size(640, 360, P3D);
  noStroke();
  mods = new Module[count];
  colorMode(HSB);
  int index = 0;
  for (int y = 0; y < count; y++) {
    mods[index++] = new Module();
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  for (Module mod : mods) {
    mod.update();
    mod.display();
  }
}
