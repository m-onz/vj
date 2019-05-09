---
permalink: /examples/volume2/inside_out/
---
# Inside Out (2015)

Animazione, Avventura, Commedia

## Il film in breve
After young Riley is uprooted from her Midwest life and moved to San Francisco, her emotions - Joy, Fear, Anger, Disgust and Sadness - conflict on how best to navigate a new city, house, and school.

[details](https://www.imdb.com/title/tt2096673/)

## Movie Poster
<img src="inside-out.png"  width="360px" title="Inside Out">


## The code
```java
// Manuale di Programmazione Cinematografica
// Daniele Olmisani, 2015

// Inside Out

final color PAPER = color(240);
final color[] INKS = new color[] {
  color(150, 125, 185),
  color(110, 160, 215),
  color(245, 220, 130),
  color(155, 35, 40),
  color(150, 195, 82)
};

void setup() {
  size(480, 640);
  noLoop();
}

void draw() {
  
  float delta = (float)height/(INKS.length+1);
  float size = 0.9*delta;
  
  translate(width/2.0, 0);
  
  background(PAPER);
  noStroke();
  
  for (int i=0; i<INKS.length; i++) {
    translate(0, delta);
    fill(INKS[i]);
    ellipse(0, 0, size, size);
  }
   
  save("inside-out.png");
}
```

> MdPC - a collection of minimalist movie posters
