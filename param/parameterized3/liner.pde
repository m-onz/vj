
class liner {
 
   float t = 0;
   
   float r1 = 0;
   float r2 = 0;
   float r3 = 0;
   float r4 = 0;
  
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
      strokeWeight(2);
      //noFill();
      fill(0);
      for(int i = 0; i < 44; i+=1) {
        pushMatrix();
        rotateX(sin(t/1000-i)*4);
        rotateY(sin(t/1000-i)*4);
        rotateZ(sin(t/1000-i)*4);
        stroke(255-(i/8)-50 % 255, 255, 255);
        if (random(1000)>999) stroke(255);
        if (random(100)>99) {
          rotateX(random(1)*0.05);
          rotateY(random(1)* 0.05);
          rotateZ(random(1)* 0.05);
        }
        if (random(100)>99&&random(100)>90) {
          shearX(random(1));
          shearY(random(1));
        }
        translate(x1(t+i), y1(t+i)); 
        box(10, 10, noise(t/1000-i)*200);
        translate(x2(t+i), y2(t+i));
        box(2, 2, noise(t/9000-i)*200);
        popMatrix();
      }
      t+=0.3; 
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
