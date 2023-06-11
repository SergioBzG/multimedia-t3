import peasy.*;
PeasyCam camera;

/*float freqSlider = 14; //from 1 to 30
float freqSlider2 = 15; //from 1 to 30
float radius0_Slider = 130; //from 1 to 200
float radius1_Slider = 80;  //from 1 to 200

float offset = 0;*/

TorusLissajous torusL = new TorusLissajous(14, 15, 130, 80, 0);

void setup(){
  size(700, 500, P3D);
  colorMode(HSB, 360, 100, 100, 100);
  camera = new PeasyCam(this, 400, 400, 0, 1000);


  stroke(23, 59, 75);//color name: rakuda-iro
  strokeWeight(5);
  noFill();
  
}

void draw(){
  background(43, 19, 100);//color name: torinoko-iro
  //orbitControl(4, 4);//Mouse control
  pushMatrix();
  //rotateX(-25);
  translate(width/2 , height/2);
  torusL.torusLissajous1();
  torusL.offset += radians(0.5);
  popMatrix();
  
}
