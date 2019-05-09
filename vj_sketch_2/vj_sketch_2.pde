
class Meta2 {
  
  void run () { 
    stroke(255);
     noFill();
     translate(width/2, height/2);
     scale(6 + sin(millis()*0.00001)*3);
     for (int i = 0; i < 11; i++) {
       rotateX(sin(millis() * 0.0002 -i));
       rotateY(noise(sin(millis() * 0.0002))-i);
       //rotateZ(noise(sin(millis() * 0.0002))-i);
       box(sin(millis()* 0.0004)*200+i, 20, 20);
     }
  }
}

Meta2 m;

void setup () {
  size(640, 480, P3D);
  m = new Meta2();
}

void draw () {
   background(0);
   m.run();
}
