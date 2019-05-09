---
permalink: /examples/volume2/modern_times/
---
# Modern Times (1936)

Commedia, Drammatico, Ragazzi

## Il film in breve
The Tramp struggles to live in modern industrial society with the help of a young homeless woman.

[details](https://www.imdb.com/title/tt0027977/)

## Movie Poster
<img src="modern-times.png"  width="360px" title="Modern Times">


## The code
```java
// Manuale di Programmazione Cinematografica
// Daniele Olmisani, 2015

// Modern Times

final color PAPER = color(240);
final color INK = color(45, 60, 40);

void setup() {
  size(480, 640);
  noLoop();
}

void draw() {
  
  translate(width/2.0, height/3.0);
  
  background(PAPER);
  
  drawGear(0, 0, 75, 20, 0);
  drawGear(99, 98, 50, 20, 2);
  drawGear(21, 178, 50, 20, 0);
  drawGear(70, 262, 35, 20, 0);
  
  save("modern-times.png");
}

void drawGear(float x, float y, float r, float s, float a) {

  pushMatrix();
    fill(INK);
    noStroke();

    translate(x, y);
    rotate(a);
  
    rectMode(CENTER);
    ellipseMode(CENTER);
  
    int n = (int)((r*PI) / s);
  
    for (int i=0; i<n; i++) {
      rect(r, 0, s, s);
      rotate(TWO_PI / n);
    }
    ellipse(0, 0, 2*r, 2*r);
  
    fill(PAPER);
    ellipse(0, 0, 5, 5); 
  popMatrix();
}
```

> MdPC - a collection of minimalist movie posters
