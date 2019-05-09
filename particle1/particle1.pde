

ParticleSystem ps;

void setup() {
  size(640, 480, P3D);
  ps = new ParticleSystem(new PVector(width/2, 50));
}

void draw() {
  background(0);
  lights();
  pushMatrix();
  translate(0, height /2 );
  rotateX(millis() * PI * 0.0003);
  ps.addParticle();
  ps.run();
  popMatrix();
}
