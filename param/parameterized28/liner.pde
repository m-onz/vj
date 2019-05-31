
class liner {

  float t = 0;
  float incro = 0;
  int trail = 0;

  float r1 = 0;
  float r2 = 0;
  float r3 = 0;
  float r4 = 0;
  float size = 0;
  boolean rot =false;

  boolean showLines;

  liner () {

    r1 = random(120)+50;
    r2 = random(120)+50;
    r3 = random(120)+50;
    r4 = random(120)+50;
  }

  void draw () {
    //ortho();
    pushStyle();
    pushMatrix();
    translate(width/2, height/2);
    noStroke();
    strokeWeight(11);
    fill(255);
    lights();
    if (random(100)>99&&random(100)>79) shearX(random(1));
    if (random(100)>99&&random(100)>99) shearY(random(1));
    if (random(100)>99&&random(100)>69) shearX(random(2));
    if (random(100)>99&&random(100)>89) shearY(random(9));
    if (random(100)>99&&random(100)>89) shearX(random(3));
    if (random(100)>99&&random(100)>79) shearY(random(33));
    for (int i = 0; i < 50; i+=2) {
      pushMatrix();
      pushMatrix();
      rotateX(sin(frameCount*PI*0.0001)*13);
      //noFill();
      noStroke();
      scale(1);
      //stroke(noise(frameCount*PI*0.003)* 50+170);
      //fill(255-(i/4)-10 % 255, 255, 250);  
      //noStroke();
      rotateY(noise(frameCount*PI/ 900-i)*2);
      //rotateX(cos(frameCount*PI/ 600-i)*1);
      //rotateZ(noise(frameCount*PI/ 1900-i)*2);
      stroke(sin(frameCount*PI*0.0003+(i/20))*155);
      //box(10);
      line(x2(t+i), y2(t+i), x1(t+i)+noise(frameCount*PI*0.03)*size, y1(t+i)+noise(frameCount*PI*0.01)*size);
      popMatrix();


      popMatrix();
    }      
    size = noise(frameCount * PI* 0.002) * 430;
    //strokeWeight(7);
    //box(450, size, size);
    t+=2; 
    //incro+=0.1;
    popMatrix();
    popStyle();
  }


  float x1(float t) {
    return sin(t/r1) * 100 + sin(t/r1+r2) * 100;
  }

  float y1(float t) {
    return cos(t / r2) * 100 + cos(t/r3+r4)* 70;
  }

  float x2(float t) {
    return sin(t/r3) * 70 + cos(t/r1+r2) * 50;
  }

  float y2(float t) {
    return cos(t / r4) * 60 + sin(t/r3+r4) * 50 ;
  }
}
