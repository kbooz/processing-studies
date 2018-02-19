class Line {
  float c = -1;
  color cor;
  float w;
  float xi, yi, xf, yf;
  int offy = floor(random(-50, 50));
  int offx = floor(random(-50, 50));
  
  Line(float x, float y, float xfinal, float yfinal, float col, float weight){
    xi = x;
    yi = y;
    xf = xfinal;
    yf = yfinal;
    c = col;
    w = weight;
  }
  
  Line(float x, float y, float xfinal, float yfinal, color col, float weight){
    xi = x;
    yi = y;
    xf = xfinal;
    yf = yfinal;
    cor = col;
    w = weight;
  }
  
  void update() {
    if(c < 0) {
      stroke(cor);
    }
    else {
      stroke(c);
    }
    
    strokeWeight(w);
    
    float movy = map(noise(offy++), 0, 1, 0.99, 1.01);
    float movx = map(noise(offx++), 0, 1, 0.99, 1.01);
    
    line(xi * movx, yi * movy, xf * movx, yf * movy);
  }
}