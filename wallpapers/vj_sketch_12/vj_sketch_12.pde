float t;
float theta;
int maxFrameCount = 150;
float space = 25;

int a = 24;
int b = 11;

void setup() {
  size(800, 600, P3D);
  fill(255);
  noStroke();
 
  }

void draw() {
   lights();
  background(0);
  pushMatrix();
  translate(width/2, height/2);

  t = (float)frameCount/maxFrameCount;
  theta = TWO_PI*t;

  for (float x = -250; x <= 250; x += 100){
    for (float y = -250; y <= 250; y += 100) {
      pushMatrix();
      float offSet = (x*a)+(y*b);   
      float sz1 = map(sin(-theta+offSet), 0, noise(millis()*0.00002), space, 0) * noise(millis()*0.00002) + 20;
      float sz2 = map(cos(-theta+offSet), 0, noise(millis()*0.00002), 0, -space) * noise(millis()*0.00002) + 27;
    
      //strokeWeight(3);
      //stroke(50,30,90);
      rotateX(millis()*0.00001-y);
      rotateY(millis()*0.00001-x-y);
      rotateZ(millis()*0.0001-x);
      // 
      shape(x, y, sz1, sz2);
      popMatrix();
    }
  } 

  popMatrix();
}


void shape(float xPos, float yPos, float pOne, float pTwo) {
  pushMatrix();
  translate(xPos, yPos);

  beginShape();
  vertex(-pTwo, pOne);
  vertex(-pTwo, -pOne);
  vertex(pTwo, pOne);
  vertex(pOne, pOne);
  vertex(pOne, pTwo);
  vertex(-pOne, pTwo);
  vertex(-pOne, -pOne);
  vertex(-pOne, -pTwo);
  vertex(pOne, -pTwo);
  vertex(pOne, -pOne);
  vertex(pTwo, -pOne);
  vertex(-pOne, pOne);
  endShape(CLOSE);
  

  popMatrix();
}
