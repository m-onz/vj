
PImage tileTexture;
PShader tileShader;
PShader edges;  

void setup() {
  fullScreen(P3D);
  textureWrap(REPEAT);
  tileTexture = loadImage("column.png");
  edges = loadShader("edges.glsl");
  loadTileShader();
}

void loadTileShader() {  
  tileShader = loadShader("scroller.glsl");
  tileShader.set("resolution", float(width), float(height));  
  tileShader.set("tileImage", tileTexture);
}


boolean change = false;

void draw() {
  float a = millis() / (noise(millis()*0.0002)*1301);
  float b = millis() / noise(millis()*0.0002)*1400;
  float c = 0;
  if (random(1000) > 995) change = true;
  if (change) {
    c = b; 
    if (random(1000) > 900) change = false;
  } else {
    c = a;
  }
  tileShader.set("time", c);
  tileShader.set("time", c);
  shader(tileShader);
  //shader(edges);
  rect(0, 0, width, height);
}
