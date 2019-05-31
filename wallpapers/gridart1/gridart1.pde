
/*

grid
grid shadow?
abstract lines + dots
random chunky vertex, with thick lines
*/



class gradientRect {
  PGraphics canvas;
  int Y_AXIS = 1;
  int X_AXIS = 2;
  int posX;
  int posY;
  int sizeX;
  int sizeY;
  color color1;
  color color2;
  
  gradientRect(int _posX, int _posY, int _sizeX, int _sizeY, color _color1, color _color2) {
    posX = _posX;
    posY = _posY;
    sizeX = _sizeX;
    sizeY = _sizeY;
    color1 = _color1;
    color2 = _color2;
    canvas = createGraphics(sizeX, sizeY);
    
  }
  void setGradient(PGraphics canvas, int axis) {
    noFill();
    int x = posX;
    int y = posY;
    int w = sizeX;
    int h = sizeY;
    color c1 = color1;
    color c2 = color2;
    if (axis == Y_AXIS) {
      for (int i = y; i <= y+h; i++) {
        float inter = map(i, y, y+h, 0, 1);
        color c = lerpColor(c1, c2, inter);
        canvas.stroke(c);
        canvas.line(x, i, x+w, i);
      }
    }  
    else if (axis == X_AXIS) {
      for (int i = x; i <= x+w; i++) {
        float inter = map(i, x, x+w, 0, 1);
        color c = lerpColor(c1, c2, inter);
        canvas.stroke(c);
        canvas.line(i, y, i, y+h);
      }
    }
  }

  void display () {
    canvas.beginDraw();
    setGradient(canvas, Y_AXIS);
    canvas.endDraw();
    
    image(canvas, posX, posY);
  }
}



int grid = 28; 



class grid {
 PGraphics canvas;
 //PShader edges;
 int slant;
 float m;
 grid(){
   canvas = createGraphics(394, 394, P3D);
   //edges = loadShader("edges.glsl");
   slant = 11;
 }
 void display() {
    canvas.beginDraw();
    canvas.background(255);
    canvas.stroke(#222222);
    canvas.strokeWeight(3);
    if (random(100) > 99) slant = (int) random(22);
    for (int i = 0; i < width; i+=grid) {
      canvas.line (i+slant, slant, i+slant, height+slant);
    }
    for (int i = 0; i < height; i+=grid) {
      canvas.line (slant, i+slant, width+slant, i+slant);
    } 
    canvas.stroke(#bab2a7);
    for (int i = 0; i < width; i+=grid) {
      canvas.line (i, 0, i, height);
    }
    for (int i = 0; i < height; i+=grid) {
      canvas.line (0, i, width, i);
    }

   canvas.endDraw();
   //shader(edges);
   m = noise(millis()*0.003)*55;
   image(canvas, 150+m, 80+m, 394, 394);
  }
}

gradientRect grad;
color c1, c2;
float m;

grid g;

void setup () {
  size(640, 480, P3D);
  g = new grid();
  c1 = color(#020006);
  c2 = color(#bab2a7);
  grad = new gradientRect(0, 0, width, height, c1, c2);
  noStroke();
  smooth();

}

void draw () {
  background(#bab2a7);
  grad.display();
  fill(200);
  m = noise(millis()*0.003)*4;
  rect(80+m, 50+m, 600, 600);
  g.display();
  rotateZ(noise(millis()*0.0003));
  fill(#bab2a7);
  rect(width-50, 80, 100, 60, 11);
  fill(#ea679d);
  rect(width-60, 70, 100, 60, 11);
  fill(#bab2a7);
  ellipse(250, 250, 100, 100);
  fill(#222222);
  ellipse(260, 260, 100, 100);
}
