let freqSlider = 14; //from 1 to 30
let freqSlider2 = 15; //from 1 to 30

let radius0_Slider = 130; //from 1 to 200
let radius1_Slider = 80;  //from 1 to 200

let offset = 0;

function setup(){
  createCanvas(700, 500, WEBGL);
  angleMode(DEGREES);
  colorMode(HSB, 360, 100, 100, 100);

  stroke(23, 59, 75);//color name: rakuda-iro
  strokeWeight(5);
  noFill();
  
}

function draw(){
  background(43, 19, 100);//color name: torinoko-iro
  orbitControl(4, 4);//Mouse control

  rotateX(-25);

  torusLissajous1();
  //torusLissajous2();

  // radius0Value.html("radius0: " + radius0_Slider.value());
  // radius1Value.html("radius1: " + radius1_Slider.value());
  // freqValue.html("frequency: " + freqSlider.value());
  // freqValue2.html("frequency2: " + freqSlider2.value());
  
  offset += 0.5;
}

function torusLissajous1(){
  beginShape();
  for(let phi = 0; phi < 360; phi += 0.2){
    let x = (radius0_Slider + radius1_Slider * cos(phi*freqSlider2 + offset)) * sin(phi*freqSlider);
    let y = radius1_Slider * sin(phi*freqSlider2 + offset);
    let z = (radius0_Slider + radius1_Slider * cos(phi*freqSlider2 + offset)) * cos(phi*freqSlider);
    vertex(x, y, z);
  }
  endShape();
}
