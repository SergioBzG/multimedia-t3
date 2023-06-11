class BumpyTorus{
  
  float radius0_Slider=130; //rango 0-200
  float radius1_Slider=80; //rango 0-200
  float freqSlider=6; //rango 0-10
  float freqSlider2=6; //rango 0-10
  float offset = 0;
  
  BumpyTorus(float radius0_Slider, float radius1_Slider, float freqSlider, float freqSlider2, float offset){
    this.radius0_Slider = radius0_Slider;
    this.radius1_Slider = radius1_Slider;
    this.freqSlider = freqSlider;
    this.freqSlider2 = freqSlider2;
    this.offset = offset;
  }
  
  void bumpyTorus(){
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
  
}
