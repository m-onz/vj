
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
      pushMatrix();
      translate(width/2, height/2);
      scale(1.5);
      strokeWeight(22);
      for(int i = 0; i < 250; i+=11) {
      stroke(255-(i/8)-50 % 255, 255, 255);
      line(x1(t+i), y1(t+i), x2(t+i), y2(t+i));
      }
      t+=0.9; 
      popMatrix();
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
