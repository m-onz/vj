
class Meta {
  
  void run () { 
    stroke(255);
     noFill();
     translate(width/2, height/2);
     scale(sin(millis()*0.00001)*7);
     for (int i = 0; i < 11; i++) {
       rotateX(sin(millis() * 0.0002 -i));
       rotateY(noise(sin(millis() * 0.0002))-i);
       rotateZ(noise(sin(millis() * 0.0002))-i);
       box(sin(millis()* 0.0004)*200+i);
     }
  }
}

Meta m;

void setup () {
  size(640, 480, P3D);
  m = new Meta();
}

void draw () {
   background(0);
   m.run();
}
