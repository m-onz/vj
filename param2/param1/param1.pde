
import com.hamoid.*;

VideoExport videoExport;

class Module {
  float x = 0;
  float y = 0;
  float t = 0;
  float r1 = random(100);
  float r2 = random(120);
  float r3 = random(100);
  float r4 = random(100);
  void update () {}
  void display () {
    
    pushMatrix();
    fill(0, 2);
    noStroke();
    rect(0, 0, width, height);
    
    stroke(255);
    strokeWeight(6);
    rect(x, y, 11, 11);
    x = sin(t / 100) * r1 + cos(t /200) * r2 + sin(t / 100) * r3;
    y = cos(t / 100) * r2 + sin(t/300) * r3 + cos(t / 100) * r4;
    popMatrix();
    t += 1;
  }
}

int unit = 11;
int count = 22;
Module[] mods;

void setup() {
  size(640, 480);
  noStroke();
  mods = new Module[count];

  int index = 0;
  for (int y = 0; y < count; y++) {
    mods[index++] = new Module();
  }
  
  videoExport = new VideoExport(this);
  videoExport.startMovie();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  for (Module mod : mods) {
    mod.update();
    mod.display();
  }
  videoExport.saveFrame();
}

void keyPressed() {
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}
