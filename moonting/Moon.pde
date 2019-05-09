class Moon {
  float x;
  float y;
  float size;
  float spacing;
  color[] colors = {color(238), color(5, 46, 40), color(11, 119, 148)};

  void display() {
    strokeWeight(this.spacing);
    stroke(233);
    fill(11, 119, 148);
    rect(this.x, this.y, this.size, this.size);
    noStroke();
    int type = (int)random(2);
    chooseColors(type);
    
  }
  
  void halfVertical(color mode1, color mode2) {
    fill(mode1);
    arc(this.x + size/2, this.y + size/2, (size - this.spacing)/1.5, (size - this.spacing)/1.5, HALF_PI + PI, TWO_PI + HALF_PI);
    fill(mode2);
    arc(this.x + size/2, this.y + size/2, (size - this.spacing)/1.5, (size - this.spacing)/1.5, HALF_PI, HALF_PI + PI);
  }
  void halfHorizontal(color mode1, color mode2) {
    fill(mode1);
    arc(this.x + size/2, this.y + size/2, (size - this.spacing)/1.5, (size - this.spacing)/1.5, 0, PI);
    fill(mode2);
    arc(this.x + size/2, this.y + size/2, (size - this.spacing)/1.5, (size - this.spacing)/1.5, PI, TWO_PI);
  }
  
  void chooseColors(int funct){
    int c1 = (int)random(3);
    int c2 = (int)random(3);
    if(funct == 0){
      halfVertical(colors[c1], colors[c2]);
    } else if (funct == 1){
      halfHorizontal(colors[c1], colors[c2]);
    }
  }
}
