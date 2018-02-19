PImage woman;
PImage ref;
int womanWidth = 236;
float gridSize = 6.8;
float brighter = 0;
float[][] elevations;
float minimumBrightness = 0.1;
int totalElements = 0;
boolean RECORDING = true;
Line[] lines;
Particle[] particles;

void setup() {
  size(1200, 1200);
  woman = loadImage("banana.jpg");
  ref = loadImage("bananaref.jpg");

  gridSize = ref.width/woman.width * 1.02;

  elevations = new float[woman.height][woman.width];
  calculateElevationElements();
  lines = new Line[totalElements];
  particles = new Particle[totalElements];
  storeElements();
}

float xPos (int x) {
  //return ((x * gridSize) + womanWidth);

  return ((x * gridSize));
}

void calculateElevationElements() {
  for (int y = 0; y < woman.height - 1; y ++) {
    for (int x = 1; x < woman.width - 1; x ++) {
      int index = x + (y + 1) * woman.width;
      color pix = woman.pixels[index];

      float colorBright = brightness(pix);

      if(colorBright > brighter)
        brighter = colorBright;

      float bright = map(colorBright, 0, 255, 0, 1);

      float elevate = map(colorBright, 0, 255, 1, 0.96);
      elevations[y][x] = elevate;

      if(bright > minimumBrightness) {
        totalElements++;
      }
    }
  }
}

void storeElements() {
  int elementNumber = 0;
  for (int y = 0; y < woman.height - 1; y ++) {
    for (int x = 1; x < woman.width - 1; x ++) {
      float elevate = elevations[y][x];
      if(x + 1 < woman.width) {

        int index = x + (y + 1) * woman.width;
        color pix = woman.pixels[index];

        float colorBright = brightness(pix);

        float bright = map(colorBright, 0, 255, 0, 1);

        if(bright > minimumBrightness) {
          float weight = map(colorBright, 0, 255, gridSize, gridSize * 2);

          float nextElevate = elevations[y][x + 1];

          //float col = y % 2 == 0 ? colorBright * 2 : colorBright;

          float col = map(sin(y), -1, 1, colorBright * 0.95, colorBright * 1.05);

          //lines[elementNumber++] = new Line(xPos(x), (y * gridSize) * elevate, xPos(x+1), (y * gridSize) * nextElevate, pix, weight);
          particles[elementNumber++] = new Particle(xPos(x), (y * gridSize), pix, brighter, gridSize);
        }
      }
    }
  }
}

void drawLines () {
  //for(int i = 0; i < totalElements; lines[i++].update() );
  for(int i = 0; i < totalElements; particles[i++].update() );
}

void draw() {
  background(0);
  image(ref, 0, 0);
  drawLines();
  //noLoop();
  if(RECORDING)
    println(frameRate);
  saveFrame("frames/smoke_####.png");
}