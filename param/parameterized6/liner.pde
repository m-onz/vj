
class liner {

  float t = 0;
  float incro = 0;

  float r1 = 0;
  float r2 = 0;
  float r3 = 0;
  float r4 = 0;
  float size = 0;
  
  boolean showLines;

  liner () {

    r1 = random(50)+50;
    r2 = random(50)+50;
    r3 = random(60)+50;
    r4 = random(70)+50;
  }

  void draw () {
    ortho();
    pushStyle();
    pushMatrix();
    translate(width/2, height/2);
    noStroke();
    strokeWeight(3);
    fill(0);
    for (int i = 0; i < 22; i+=1) {
      pushMatrix();
      rotateY(sin(t/600-i)*4);
      rotateY(sin(t/600-i)*4);
      noStroke();
      stroke(200+i % 255);
      pushMatrix();
      rotateX(sin(t/1000-i)*4);
      rotateY(sin(t/600-i)*4);
      rotateY(sin(t/600-i)*4);
      line(x1(t+i), y1(t+i), x2(t+i), y2(t+i));
      popMatrix();
      fill(0);
      stroke(255-(i/8)-50 % 255, 255, 255);
      rotateX(sin(t/700-i)*4);
      rotateX(sin(t/1000-i)*4);
      rotateY(sin(t/600-i)*4);
      rotateY(sin(t/600-i)*4);      
      popMatrix();
    }
    rotateX(sin(t/1000)*4);
      rotateY(sin(t/600)*4);
      rotateY(sin(t/600)*4);
      
     size = noise(frameCount * PI* 0.002) * 70;
     //noFill();
     strokeWeight(7);
    box(450, size, size);
    t+=noise(t/1000)*2; 
    incro+=0.1;
    popMatrix();
    popStyle();
  }


  float x1(float t) {
    return sin(t/r1) * (r1+r2);
  }

  float y1(float t) {
    return cos(t / r2) * (r3+r4);
  }

  float x2(float t) {
    return sin(t/r3) * (r1+r2);
  }

  float y2(float t) {
    return cos(t / r4) * (r3+r4) ;
  }
}
