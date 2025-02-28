
class ParticleSystem {
  ArrayList<Particle> particles;

  ParticleSystem(PVector position) {
    particles = new ArrayList<Particle>();
  }

  void addParticle(float x, float y) {
    particles.add(new Particle(x, y));
  }


  void display() {
    for (Particle p : particles) {
      p.display();
    }
  }

  void intersection() {
    for (Particle p : particles) {
      p.intersects(particles);
    }
  }


  void update() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
