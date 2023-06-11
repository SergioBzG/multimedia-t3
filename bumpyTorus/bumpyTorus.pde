import peasy.*;
PeasyCam camera;


float radius0_Slider=130; //rango 0-200
float radius1_Slider=80; //rango 0-200

float freqSlider=6; //rango 0-10
float freqSlider2=6; //rango 0-10

float offset = 0;

void setup(){
  camera = new PeasyCam(this, 400, 400, 0, 1000);
  size(700, 500, P3D);
  //angleMode(DEGREES);
  colorMode(HSB, 360, 100, 100, 100);

  strokeWeight(4);
  stroke(23, 59, 75);//color name: rakuda-iro
  noFill();
}

void draw(){
  background(43, 19, 100);//color name: torinoko-iro
  pushMatrix();
  translate(width/2,height/2);

  bumpyTorus1();

  offset += radians(0.5);
  popMatrix();
}

void bumpyTorus1(){
  for(float sigma = 0; sigma < radians(360); sigma += radians(8)){
    beginShape();
    for(float phi = 0; phi < radians(360); phi += radians(8)){
      float bump = (1+0.2*sin(phi*freqSlider)*sin(sigma*freqSlider2));
      float x = (radius0_Slider + radius1_Slider*bump * cos(phi+offset)) * sin(sigma+offset/5);
      float y = radius1_Slider*bump * sin(phi+offset);
      float z = (radius0_Slider + radius1_Slider*bump * cos(phi+offset)) * cos(sigma+offset/5);
      vertex(x, y, z);
    }
    endShape(CLOSE);
  }
}
