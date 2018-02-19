class Particle {
  color colorVar;
  float colorFloat = -1;
  float brighter = 0;
  float size = 0;
  float x;
  float y;
  float xoff = random(-100, 100);
  float yoff = random(-100, 100);
  float sizeoff = random(-100, 100);
  float xinc = 0.1;
  float yinc = 0.1;
  float sizeinc = 0.5;
  
  Particle (float posx, float posy, float colorFloatIn, float brighterIn, float gridSize) {
    x = posx;
    y = posy;
    colorFloat = colorFloatIn;
    brighter = brighterIn;
    
    size = map(colorFloat, 0, 255, 0, gridSize);
  }
  
  Particle (float posx, float posy, color colorIn, float brighterIn, float gridSize) {
    x = posx;
    y = posy;
    colorVar = colorIn;
    brighter = brighterIn;
    
    size = map(brightness(colorIn), 0, 255, 0, gridSize);
  }
  
  void update() {
    if(colorFloat > 0) {
      fill(colorFloat);
    } else {
      fill(colorVar);
    }
    
    float finalx = map(noise(xoff), 0, 1, x - gridSize, x + gridSize);
    float finaly = map(noise(yoff), 0, 1, y - gridSize, y + gridSize);
    float finalsize = map(noise(sizeoff), 0, 1, gridSize * 0.4, gridSize);
    
    noStroke();
    ellipse(finalx, finaly, finalsize, finalsize);
    xoff+= xinc;
    yoff+= yinc;
    sizeoff += sizeinc;
  }
}