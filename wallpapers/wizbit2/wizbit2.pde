
wizbit w;
wizbitLine line;

wizbit w2;
wizbitLine line2;

wizbitTriangle t;

void setup() {   
  fullScreen(P3D); 
  w = new wizbit(32);
  line = new wizbitLine();

  w2 = new wizbit(64);
  line2 = new wizbitLine();
  
  t = new wizbitTriangle();
}   

void draw() {   
  background(0);  
  w.display(); 
  line.display();

  w2.display(); 
  line2.display();
  
  t.display();
}

class wizbit {
  float xtime = 0.0;  
  float ytime = 100.0;
  float increment = 0.01; 
  float seed = random(1);
  int size = 32;
  wizbit (int _size) {
    noStroke();
    size = _size;
  }
  void display () {
    float x = noise(xtime+seed) * width;  
    float y = noise(ytime+seed) * height;  
    xtime += increment;  
    ytime += increment;
    fill(255);
    ellipse(x, y, size, size);
  }
}

class wizbitLine {
  float xtime = 0.0;  
  float ytime = 100.0;
  float increment = 0.01;
  float seed = random(1);
  wizbitLine () {
    
  }
  void display () {
    float x = noise(xtime + seed) * width;  
    float y = noise(ytime + seed) * height;  
    xtime += increment;  
    ytime += increment;
    stroke(255);
    strokeWeight(40);
    pushMatrix();
    translate(x, y);
    rotateZ(xtime + seed);
    line(0, 0, 300, 300); 
    popMatrix();
  }
}


class wizbitTriangle {
  float xtime = 0.0;  
  float ytime = 100.0;
  float increment = 0.01;
  float seed = random(1);
  wizbitTriangle () {
    strokeWeight(2);
  }
  void display () {
    float x = noise(xtime + seed) * width;  
    float y = noise(ytime + seed) * height;  
    xtime += increment;  
    ytime += increment;
    strokeWeight(2);
    pushMatrix();
    translate(x, y);
    triangle(30, 75, 58, 20, 86, 75);
    popMatrix();
  }
}
