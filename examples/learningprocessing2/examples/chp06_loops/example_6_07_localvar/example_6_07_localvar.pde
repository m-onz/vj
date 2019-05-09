// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 6-7: Local variables

void setup() {
  size(640,360);
  // x is not available! It is local to the draw() block of code.
}

void draw() {
  background(0);
  int x = 0;
  // x is available! Since it is declared within the draw() block of code, it is available here. 
  // Notice, however, that it is not available inside draw() above where it is declared. 
  // Also, it is available inside the while block of code because while is inside of draw().
  while (x < width) {
    stroke(255);
    line(x,0,x,height);
    x += 15;
  }
}

void mousePressed() {
  // x is not available! It is local to the draw( ) block of code.
  println( " The mouse was pressed! " );
}
