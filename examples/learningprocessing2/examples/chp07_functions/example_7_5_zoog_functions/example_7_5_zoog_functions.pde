// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 7-5: Zoog with functions

float x = 320;
float y = 180;
float w = 60;
float h = 60;
float eyeSize = 16;

void setup() {
  size(640, 360);
}

void draw() {
  background(255); // Draw a black background

  // A color based on distance from the mouse
  float d = dist(x, y, mouseX, mouseY);
  color c = color(d);

  // mouseX position determines speed factor for moveZoog function
  float factor = constrain(mouseX/10, 0, 5);

  // The code for changing the variables associated with Zoog and displaying Zoog is moved outside of draw() and into functions called here. 
  // The functions are given arguments, such as “Jiggle Zoog by the following factor” 
  // and “draw Zoog with the following eye color.
  jiggleZoog(factor);
  drawZoog(c);
}

void jiggleZoog(float speed) {
  // Change the x and y location of Zoog randomly
  x = x + random(-1, 1)*speed;
  y = y + random(-1, 1)*speed;
  // Constrain Zoog to window
  x = constrain(x, 0, width);
  y = constrain(y, 0, height);
}

void drawZoog(color eyeColor) {
  // Set ellipses and rects to CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  // Draw Zoog's arms with a for loop
  for (float i = y - h/3; i < y + h/2; i += 10) {
    stroke(0);
    line(x - w/4, i, x + w/4, i);
  }
  // Draw Zoog's body
  stroke(0);
  fill(175);
  rect(x, y, w/6, h);
  // Draw Zoog's head
  stroke(0);
  fill(255);
  ellipse(x, y - h, w, h);
  // Draw Zoog's eyes
  fill(eyeColor);
  ellipse(x - w/3, y - h, eyeSize, eyeSize*2);
  ellipse(x + w/3, y - h, eyeSize, eyeSize*2);
  // Draw Zoog's legs
  stroke(0);
  line(x - w/12, y + h/2, x - w/4, y + h/2 + 10);
  line(x + w/12, y + h/2, x + w/4, y + h/2 + 10);
}