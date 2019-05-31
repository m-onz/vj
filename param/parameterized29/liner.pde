
class liner {

  float t = 0;
  float incro = 0;
  int trail = 0;

  float r1 = 0;
  float r2 = 0;
  float r3 = 0;
  float r4 = 0;
  float size = 0;
  float s1 = 0;
  float s2 = 0;
  float s3 = 0;
  float s4 = 0;
  boolean rot =false;
  int switcher = 0;

  boolean showLines;

  liner () {

    r1 = random(120)+50;
    r2 = random(120)+50;
    r3 = random(120)+50;
    r4 = random(120)+50;
   
  }

  void draw () {
    //s1 = noise(frameCount * PI * 0.004) * 600;
    //s2 = noise(frameCount * PI * 0.005) * 600;
    //s3 = noise(frameCount * PI * 0.006) * 600;
    //s4 = noise(frameCount * PI * 0.009) * 600;
    if(random(100)>99&&random(100)>99) switcher++;
    if (switcher >2) switcher =0;
    ortho();
    pushStyle();
    pushMatrix();
    translate(width/2, height/2);
    noStroke();
    
    for (int i = 0; i < 25; i+=7) {
      pushMatrix();
      noFill();
      scale(1);
      switch(switcher) {
        case 0:
          rotateY(sin(frameCount*PI/ 9000-i)*5);
        break;
        case 1:
          rotateX(cos(frameCount*PI/ 6000-i)*3);
        break;
        case 2:
          rotateZ(sin(frameCount*PI/ 1900-i)*4);
        break;

      }
      stroke(sin(frameCount*PI*0.0003+(i/20))*200, 255, 255);
      if (random(100)>99)stroke(255);
      strokeWeight(2);

      box(10*(i+noise(frameCount * PI * 0.004) * 60));
      stroke(sin(frameCount*PI*0.0003+(i/30))*255, 255, 255);
      strokeWeight(4);
      line(x2(t+i)+s1, y2(t+i)+s2, x1(t+i)+s3, y1(t+i)+s4);
      popMatrix();
    }      
    t += noise(frameCount * PI * 0.004) * 2; 
    popMatrix();
    popStyle();
  }


  float x1(float t) {
    return sin(t/r1) * 100 + sin(t/r1+r2) * 100;
  }

  float y1(float t) {
    return cos(t / r2) * 100 + cos(t/r3)* 170;
  }

  float x2(float t) {
    return sin(t/r3) * 70 + cos(t/r1) * 250 + cos(t/r4) * 70;
  }

  float y2(float t) {
    return cos(t / r4) * 60 + sin(t/r3) * 250 ;
  }
}
