float r0=60;
float r1=2.5;


float f0=3;
float f1=1;

float offset = 0;

void setup(){
  size(700, 700, P3D);
  colorMode(HSB, 360, 100, 100, 100);

  strokeWeight(3);
  stroke(23, 59, 75);//color name: rakuda-iro
  noFill();

}

void draw(){
  background(43, 19, 100);//color name: torinoko-iro
  pushMatrix();
  translate(width/2,height/2);

  GraysKleinBottle(
    r0,
    r1,
    f0,
    f1
  );
  offset += radians(0.5);
  popMatrix();
}



void GraysKleinBottle(float r0, float r1, float n, float m){//Work well
  for(float theta = 0; theta < radians(360); theta += radians(7)){
    beginShape();
    for(float phi = 0; phi < radians(720); phi += radians(7)){
      float x = r0*((r1 + cos(n*phi/2.0 + offset) * sin(theta) - sin(n*phi/2.0) * sin(2*theta)) * cos(m*phi/2.0));
      float y = r0*((r1 + cos(n*phi/2.0) * sin(theta + offset) - sin(n*phi/2.0) * sin(2*theta)) * sin(m*phi/2.0));
      float z = r0*(sin(n*phi/2.0) * sin(theta) + cos(n*phi/2.0 + offset) * sin(2*theta));
      vertex(x, y, z);
    }
    endShape(CLOSE);
  }
}
