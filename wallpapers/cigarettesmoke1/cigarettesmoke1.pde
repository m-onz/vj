
ParticleSystem ps;
float incro = 0;

void setup() {
  fullScreen(P3D);
  ps = new ParticleSystem(new PVector(0, 0));
  sphereDetail(1);
}

void draw() {
  background(0);
  lights();
  incro = noise(millis()*0.0004) * width;
  ps.addParticle(incro, height/2);
  ps.update();
  ps.intersection();
  ps.display();
  if (incro > width) incro = 0;
}
