// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Exercise 6-1a: Fill in the blanks in the code to 
// recreate the following screenshots.

size(200, 200); 
background(255); 
int y = 0; 

while (y < height) { 
  stroke(0);
  line(0, y, width, y);  
  y = y + 10;
} 
