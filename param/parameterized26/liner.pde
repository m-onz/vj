
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
    strokeWeight(9);
    fill(255);
    lights();
    //if (random(100)>99) rot = !rot;
    for (int i = 0; i < 150; i+=11) {
      pushMatrix();
      pushMatrix();
      //rotateZ(noise(frameCount*PI*0.001)*3);
      //noFill();
      noStroke();
      scale(1);
      //stroke(noise(frameCount*PI*0.003)* 50+170);
      //fill(255-(i/4)-10 % 255, 255, 250);  
      //noStroke();
      rotateY(noise(frameCount*PI/ 900-i)*2);
      stroke(noise(frameCount*PI*0.0003+(i/200))*255, 255, 255);
      //box(10);
      line(x2(t+i), y2(t+i), x1(t+i), y1(t+i));
      popMatrix();


      popMatrix();
    }      
    size = noise(frameCount * PI* 0.002) * 130;
    //strokeWeight(7);
    //box(450, size, size);
    t+=noise(frameCount*PI/0.003)*3; 
    //incro+=0.1;
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
