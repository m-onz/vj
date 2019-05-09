// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 23-3: Using a java.awt.Rectangle object
import java.awt.Rectangle;

// This sketch uses two Rectangle objects. 
Rectangle rect1, rect2;

void setup() {
  size(640, 360);
  // The arguments for the constructor (x,y,width,height) are documented in the Java reference: 
  // http://docs.oracle.com/javase/8/docs/api/java/awt/Rectangle.html
  rect1 = new Rectangle(100, 75, 50, 50); 
  rect2 = new Rectangle(300, 150, 150, 75);
}

void draw() {
  background(255);
  stroke(0);

  // The contains() function is used to determine if the mouse is located inside the rectangle.
  if (rect1.contains(mouseX, mouseY)) { 
    fill(200);
  } else {
    fill(100);
  }

  // A Rectangle object only knows about the variables associated with a rectangle. 
  // It cannot display itself and so we use Processing's rect() function in combination with the Rectangle's data.
  rect(rect1.x, rect1.y, rect1.width, rect1.height); 

  // Repeat for the second Rectangle
  // (Of course, we could use an array or ArrayList here!)
  if (rect2.contains(mouseX, mouseY)) {
    fill(200);
  } else {
    fill(100);
  }
  rect(rect2.x, rect2.y, rect2.width, rect2.height);
}
