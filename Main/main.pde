import processing.sound.*;
import peasy.*;

PeasyCam camera;
Amplitude amp;
AudioIn in;

GraysKlein graysK = new GraysKlein(60, 2.5, 3, 1, 0);
TorusLissajous torusL = new TorusLissajous(14, 15, 130, 80, 0);
TorusType torusT = new TorusType(36, 36, 130, 80, 0);
BumpyTorus bumpyT = new BumpyTorus(130,80,6,6,0);

int[] colors = new int[10];

void setup(){
  size(800, 800, P3D);
  colorMode(HSB, 360, 100, 100, 100);
  camera = new PeasyCam(this, 400, 400, 0, 1000);
  
  colors[0] = #FF0000;  
  colors[1] = #FF00B3; 
  colors[2] = #5500FF; 
  colors[3] = #00DEFF;  
  colors[4] = #00FF66; 
  colors[5] = #DEFF00;  
  colors[6] = #FF9100;  

  stroke(23, 59, 75);//color name: rakuda-iro
  strokeWeight(5);
  noFill();
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  
}

void draw(){
  
  if (amp.analyze() > 0.2){
    stroke(colors[int(random(7))]);
  }
  
  background(43, 19, 100);//color name: torinoko-iro

  pushMatrix();
  translate(200, 200);
  torusL.torusLissajous();
  popMatrix();
  
  pushMatrix();
  translate(600, 200);
  torusT.torusType();
  popMatrix();
  
  pushMatrix();
  translate(200, 600);
  graysK.graysKlein();
  popMatrix();
  
  pushMatrix();
  translate(600, 600);
  bumpyT.bumpyTorus();
  popMatrix();
  
  torusL.offset += radians(0.5);
  torusT.offset += radians(0.32);
  graysK.offset += radians(0.5);
  bumpyT.offset += radians(0.5);
  
}

class GraysKlein{
  
  float r0 = 60;
  float r1 = 2.5;
  float f0 = 3;
  float f1 = 1;
  float offset = 0;
  
  GraysKlein(float r0, float r1, float f0, float f1, float offset){
    this.r0 = r0;
    this.r1 = r1;
    this.f0 = f0;
    this.f1 = f1;
    this.offset = offset;
  }
  
  void graysKlein(){
    for(float theta = 0; theta < radians(360); theta += radians(7)){
      beginShape();
      for(float phi = 0; phi < radians(720); phi += radians(7)){
        float x = r0*((r1 + cos(f0*phi/2.0 + offset) * sin(theta) - sin(f0*phi/2.0) * sin(2*theta)) * cos(f1*phi/2.0));
        float y = r0*((r1 + cos(f0*phi/2.0) * sin(theta + offset) - sin(f0*phi/2.0) * sin(2*theta)) * sin(f1*phi/2.0));
        float z = r0*(sin(f0*phi/2.0) * sin(theta) + cos(f0*phi/2.0 + offset) * sin(2*theta));
        vertex(x, y, z);
      }
      endShape(CLOSE);
    }
  }
  
}
