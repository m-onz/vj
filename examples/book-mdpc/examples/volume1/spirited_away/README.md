---
permalink: /examples/volume1/spirited_away/
---
# Spirited Away (2001)

Animazione, Avventura, Ragazzi

## Il film in breve
During her family's move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches, and spirits, and where humans are changed into beasts.

[details](https://www.imdb.com/title/tt0245429/)

## Movie Poster
<img src="spirited-away.png"  width="360px" title="Spirited Away">


## The code
```java
// Manuale di Programmazione Cinematografica
// Daniele Olmisani, 2016

// Spirited away

final color PAPER = color(20);
final color INK1 = color(205, 195, 180);
final color INK2 = color(145, 35, 35);

void setup() {
  size(480, 640);
  noLoop();
}

void draw() {
  
  float d = min(width, height) / 1.5;
  
  translate(width/2.0, height/2.0);
  
  background(PAPER);
  
  noStroke();
  
  fill(INK1);
  ellipse(0, 0, d, 1.3*d);
  
  fill(INK2);
  ellipse(0, 0, 0.7*d, 1.1*d);
  
  rectMode(CENTER);
  
  fill(INK1);
  rect(0, 0, 0.4*d, 1.1*d);
  rect(0, -0.1*d, 0.9*d, 0.25*d);
  
  fill(0x44000000 | (PAPER & 0x00FFFFFF));
  rect(width/4.0, 0, width/2.0, height);
  
  fill(PAPER);
  rect(0, 0.5*d, 0.25*d, 0.09*d, d);
  
  ellipse(-0.26*d, -0.1*d, 0.2*d, 0.1*d);
  ellipse( 0.26*d, -0.1*d, 0.2*d, 0.1*d);
  
  save("spirited-away.png");
}
```

> MdPC - a collection of minimalist movie posters
