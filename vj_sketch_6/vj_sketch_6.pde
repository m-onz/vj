

PShader edges;  
PImage img;
boolean enabled = true;

class Meta3 {
  
  void run () { 
     stroke(255);
     noFill();
     translate(width/2, height/2);
     scale(noise(6 + sin(millis()*0.00001))*5);
     for (int i = 0; i < 1; i++) {
       rotateX(noise(sin(millis() * 0.002 -i))*0.4);
       rotateY(noise(sin(millis() * 0.0002))*i* 0.04);
       rotateZ(noise(sin(millis() * 0.0002))*i);
       sphere(80+sin(millis()* 0.0004)*100+i);
     }
  }
}

Meta3 m;

void setup () {
  size(640, 480, P3D);
  m = new Meta3();
  sphereDetail(3);
  edges = loadShader("edges.glsl");
}

void draw () {
   if (enabled == true) {
    shader(edges);
   }
   background(11);
   m.run();
}
