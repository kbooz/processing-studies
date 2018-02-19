/*
PImage woman;
int womanWidth = 236;
int gridSize = 2;
float brighter = 0;
float[][] elevations;

void setup() {
  size(800, 800);
  background(0);
  woman = loadImage("woman.jpg");
  woman.filter(GRAY);
  image(woman, 0, 0);
  elevations = new float[woman.height][woman.width];
  storeElevation();
}

float xPos (int x) {
  return ((x * gridSize) + womanWidth);
}

void circle() {
  for (int y = 0; y < woman.height; y ++) {
    for (int x = 0; x < woman.width; x ++) {
      int index = x + y * woman.width;
      color pix = woman.pixels[index];
      fill(pix);
      noStroke();
      ellipse(xPos(x), y * gridSize, gridSize, gridSize);
    }
  }
}

void prepareBrighter() {
    for (int y = 0; y < woman.height; y ++) {
      for (int x = 0; x < woman.width; x ++) {
        int index = x + y * woman.width;
        float brightness = brightness(woman.pixels[index]);
        if(brightness > brighter)
          brighter = brightness;
      }
    }
}

void circle2() {
  for (int y = 0; y < woman.height; y ++) {
    for (int x = 0; x < woman.width; x ++) {
      int index = x + y * woman.width;
      color pix = woman.pixels[index];
      float size = map(brightness(pix), 0, brighter, 0, gridSize);
      if(size < 0)
        size *= -1;
      fill(pix);
      noStroke();
      ellipse(xPos(x), y * gridSize, size, size);
    }
  }
}

void lines() {
  for (int y = 0; y < woman.height - 1; y ++) {
    beginShape();
    noFill();
    strokeWeight(gridSize);
    stroke(map(sin(y), -1, 1, 0, 255));
    for (int x = 1; x < woman.width - 1; x ++) {
      int index = x + (y + 1) * woman.width;
      color pix = woman.pixels[index];
      //int yPos = floor(map(pix, 0, 255, y - (gridSize / 2), y + (gridSize / 2.0) ));
      float elevate = map(brightness(pix), 0, 255, 1, 0.98);
      vertex(xPos(x), (y * gridSize) * elevate);
    }
    endShape();
  }
}

void storeElevation() {
  for (int y = 0; y < woman.height - 1; y ++) {
    for (int x = 1; x < woman.width - 1; x ++) {
      int index = x + (y + 1) * woman.width;
      color pix = woman.pixels[index];
      float elevate = map(brightness(pix), 0, 255, 1, 0.98);
      elevations[y][x] = elevate;
    }
  }
}

void lines2() {
  for (int y = 0; y < woman.height - 1; y ++) {
    for (int x = 1; x < woman.width - 1; x ++) {
      float elevate = elevations[y][x];
      if(x + 1 < woman.width) {
        
        int index = x + (y + 1) * woman.width;
        color pix = woman.pixels[index];

        float colorBright = brightness(pix);
        
        float bright = map(colorBright, 0, 255, 0, 1);
        
        if(bright > 0.1) {
          float weight = map(colorBright, 0, 255, gridSize, gridSize * 2);
          
          stroke(colorBright);
          strokeWeight(weight);
          
          float nextElevate = elevations[y][x + 1];
          line(xPos(x), (y * gridSize) * elevate, xPos(x+1), (y * gridSize) * nextElevate);
        }
      }
    }
  }
}

void draw() {
  //prepareBrighter();
  //lines();
  lines2();
  //circle2();
  noLoop();
}
*/