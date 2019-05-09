
int squares = 4;
Moon[][] moons = new Moon[squares][squares];

void setup() {
  size(500, 500);
  int margin = 50;
  for (int i = 0; i < squares; i++){
    for (int j = 0; j < squares; j++){
      moons[i][j] = new Moon();
      moons[i][j].size = (width - 2 * margin) / squares;
      moons[i][j].spacing = 10;
      moons[i][j].x = moons[i][j].size * i + margin;
      moons[i][j].y = moons[i][j].size * j + margin;
    }
  }
}

void draw() {
  background(233);
  for (int i = 0; i < squares; i++){
    for (int j = 0; j < squares; j++){
      moons[i][j].display();
    }
  }
  noise();
  noLoop();
}

void keyPressed(){
 redraw(); 
}

void mousePressed(){
 redraw(); 
}

void noise() {
  noStroke();
  strokeWeight(1);
  for (int i = 0; i < width - 1; i += 2) {
    for (int j = 0; j < height - 1; j += 2) {
      fill(random(0, 255), random(0, 30));
      rect(random(i - 2, i), random(j - 2, j), 1, 1);
    }
  }
  for (int i = 0; i < 5; i++) {
    fill(random(0, 255), 255);
    rect(random(0, width), random(0, height), random(8), 1);
  }
}
