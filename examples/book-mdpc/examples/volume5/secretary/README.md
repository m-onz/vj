---
permalink: /examples/volume5/secretary/
---
# Secretary (2002)

Commedia, Drammatico, Sentimentale

## Il film in breve
A young woman, recently released from a mental hospital, gets a job as a secretary to a demanding lawyer, where their employer-employee relationship turns into a sexual, sadomasochistic one.

[details](https://www.imdb.com/title/tt0274812/)

## Movie Poster
<img src="secretary.png"  width="360px" title="Secretary">


## The code
```java
// Manuale di Programmazione Cinematografica - Volume 5
// Daniele Olmisani, 2018

// Secretary (2002)


final color PAPER = color(245);
final color INK = color(250, 0, 0);


void setup() {
  size(480, 640);
  noLoop();
}

void draw() {
  
  final float S =  min(width, height);
  final float U = 0.002;
  
  translate(0.5*width, 0.3*height);
  scale(-S);
  rotate(-0.1);
  
  background(PAPER);
  
  noStroke();
  fill(INK);
  
  for (float r=0.5; r<TWO_PI+0.5; r+=0.01) {
    
    float a = (r>1.5*PI) ? 0.3 : 0.4;
    float b = r*(0.3/TWO_PI);
    
    float x = a * cos(r);
    float y = b * sin(r);
    
    pushMatrix();
      translate(x, y);
      rotate(0.5);
      ellipse(0, 0, 5*U, 10*U);
    popMatrix();
  }
  
  save("secretary.png");
}

```

> MdPC - a collection of minimalist movie posters
