
class liner {

  float t = 0;
  float incro = 0;

  float r1 = 0;
  float r2 = 0;
  float r3 = 0;
  float r4 = 0;
  
  boolean showLines;

  liner () {

    r1 = random(50)+50;
    r2 = random(50)+50;
    r3 = random(50)+50;
    r4 = random(50)+50;
  }

  void draw () {
    ortho();
    pushStyle();
    pushMatrix();
    translate(width/2, height/2);
    scale(1.5);
    noStroke();
    //strokeWeight(1);
    //noFill();
    fill(0);
    for (int i = 0; i < 44; i+=1) {
      pushMatrix();
      rotateX(sin(t/1000-i)*4);
      rotateY(sin(t/1000-i)*4);
      rotateZ(sin(t/1000-i)*4);
      fill(255-(i/8)-50 % 255, 255, 255);

      if (random(100)>99) {
        rotateX(random(1)*0.05);
        rotateY(random(1)* 0.05);
        rotateZ(random(1)* 0.05);
      }
      if (random(100)>99&&random(100)>90) {
        shearX(random(1));
        shearY(random(1));
      }
      noStroke();
      if (random(100) > 99 && random(100)>99) {
        showLines = !showLines;
      }
      if (showLines) stroke(20);
      translate(x1(t+i), y1(t+i)); 
      sphere(noise(t/1000-i)*100);
      //box(10, 10, );
      translate(x2(t+i), y2(t+i));
      //box(2, 2, );
      if (showLines) stroke(incro % 255);
      fill(0);
      sphere(noise(t/9000-i)*50);
      popMatrix();
    }
    t+=0.3; 
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