
/*
  green #00a080
  pink: #f5bed7
  blue: #384a9e
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
    //pushMatrix();
    //translate(posX, posY, 0);
    image(canvas, posX, posY);
    //popMatrix();
  }
}

gradientRect grad;
color c1, c2;

void setup () {
  size(640, 480, P3D);
  c1 = color(#094ca0); // blue
  c2 = color(#ef6288);
  grad = new gradientRect(80, 90, 400, 400, c1, c2);
}

void draw () {
  background(#181e1e);
  noStroke();
  
  fill(#384a9e); // blue square
  rect(90, 250, 200, 300);
  fill(#f5bed7); // pink square
  rect(420, 280, 100, 100);

  grad.display();

  pushMatrix();
  translate(width/2+210, height/2+20);
  rotate(0.5);
  fill(#00a080); // green thick line
  rect(0, 0, 10, 200);
  popMatrix();
  
  stroke(255);
  strokeWeight(5);
  noFill();
  pushMatrix();
  translate(50, 300);
  bezier(85, 20, 10, 10, 70, 80, 15, 40);
  popMatrix();
}
