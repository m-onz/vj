
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
    ortho();
    pushStyle();
    pushMatrix();
    translate(width/2, height/2);
    noStroke();
    strokeWeight(3);
    fill(0);
    if(random(100)>90)trail++;
    if (trail > 222) trail = 0;
    if (random(100)>99) rot = !rot;
    for (int i = 0; i < trail; i+=14) {
      pushMatrix();
      noStroke();
      //stroke(200+i % 255);
      pushMatrix();
      if (rot) {
      rotateY(noise(frameCount*PI*0.001-i+r2) * 3);
      } else {
      rotateX(noise(frameCount*PI*0.001-i+r1)*3);
      }
      rotateZ(noise(frameCount*PI*0.001)*3);
      noFill();
      scale(1.5);
      stroke(255-(i/4)-40 % 255, 255, 250);  
      translate(x1(t+i), y1(t+i));
      triangle(30, 75, 58, 20, 86, 75);
      translate(x2(t+i), y2(t+i));
      triangle(30, 75, 58, 20, 86, 75);
      popMatrix();


      popMatrix();
    }      
    size = noise(frameCount * PI* 0.002) * 70;
    strokeWeight(7);
    //box(450, size, size);
    t+=noise(t/400)*5; 
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
