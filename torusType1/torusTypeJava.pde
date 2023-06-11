import peasy.*;

PeasyCam camera;

float offset = 0;
float sigmaDensitySlider = 36; //  de 0 a 36
float phiDensitySlider = 36; //  de 0 a 36
float radius0_Slider = 130; //  de 0 a 200
float radius1_Slider = 80; //  de 0 a 200

void setup(){

  camera = new PeasyCam(this, 400, 400, 0, 1000);
  
  colorMode(HSB, 360, 100, 100);
  size(800,800, P3D);

  stroke(23, 59, 75);//color name: rakuda-iro
  strokeWeight(4);
  noFill();
  
}

void draw(){
  background(43, 19, 100);//color name: torinoko-iro
  
  pushMatrix();
  translate(0, 0);
  torusType1();
  translate(width, height);
  torusType1();
  offset -= 0.5;
  popMatrix();
  
}

void torusType1(){
  for(float sigma = 0; sigma < radians(360); sigma += radians(360/sigmaDensitySlider)){
    beginShape(POINTS);
    for(float phi = 0; phi < radians(360); phi += radians(360/phiDensitySlider)){
      float x = (radius0_Slider + radius1_Slider * cos(phi+radians(offset))) * sin(sigma+radians(offset));
      float y = radius1_Slider * sin(phi+radians(offset));
      float z = (radius0_Slider + radius1_Slider * cos(phi+radians(offset))) * cos(sigma+radians(offset));
      vertex(x, y, z);
    }
    endShape();
  }
}
