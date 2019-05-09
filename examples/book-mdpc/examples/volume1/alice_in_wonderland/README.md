---
permalink: /examples/volume1/alice_in_wonderland/
---
# Alice in Wonderland (1951)

Animazione, Avventura, Ragazzi

## Il film in breve
Alice stumbles into the world of Wonderland. Will she get home? Not if the Queen of Hearts has her way.

[details](https://www.imdb.com/title/tt0043274/)

## Movie Poster
<img src="alice-in-wonderland.png"  width="360px" title="Alice in Wonderland">


## The code
```java
// Manuale di Programmazione Cinematografica - Volume 1
// Daniele Olmisani, 2016

// Alice in Wonderland (1951)


final color PAPER = color(230, 145, 170);
final color INK = color(245);

final float L = 0.625;
final int COUNT = 8;


void setup() {
  size(480, 640);
  noLoop();
}


void draw() {
  
  final float S =  min(width, height);
  final float U = 0.002;
  
  translate(0.5*width, 0.3*height);
  scale(S);
  
  background(PAPER);
  
  noStroke();
  
  fill(INK);
  ellipse(0, 0, L, L);
  
  fill(PAPER);
  ellipse(0, -0.17*L, 1.08*L, L);
  
  stroke(PAPER);
  strokeWeight(U);
  for (float i=-L; i<L; i+=L/COUNT) {
    line(i, 0, i, 1.5); 
  }
  
  save("alice-in-wonderland.png");
}
```

> MdPC - a collection of minimalist movie posters
