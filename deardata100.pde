void setup(){

size(625,600);
fill(64);
noStroke();
background(#F7AFF6);

//noLoop();



}
 void draw(){
fill(#F7F7F7);
stroke(0);
strokeWeight(1);

for (int y = 0; y < height; y++) {
    float t = map(y, 0, height, 0, 1);
    color c = lerpColor(color(255, 235, 245), color(255, 0, 128), t);
    stroke(c);
    line(0, y, width, y);
}

noFill();
stroke(0);




int diameter = 20;

for (int i = 0; i < 5; i++) {
   purpleCircle(10 + diameter/2 + i * diameter,
           20, diameter);

           
triangle(116, 10, 126, 30, 106, 30);
triangle(136, 10, 146, 30, 126, 30);


for (int j = 0; j < 5; j++) {
  purpleCircle(154 + i * diameter, 20, diameter);
}

triangle(250, 10, 260, 30, 240, 30);
triangle(270, 10, 280, 30, 260, 30);


           
 

  line(95, 96, 105, 96);
  line(92, 100, 108, 100);
  line(95, 104, 105, 104);


}



 beginShape();

  for (int y = 0; y <= 60; y += 2) {
    float x = 22 + sin(y * 0.2) * 3;
    vertex(x, 32 + y);
  }
  
   endShape();





 }
 
 
void purpleCircle(float x, float y, float d) {
  float pulse = (sin(frameCount * 0.05) + 1) / 2;

  for (int py = 0; py < d; py++) {
    float dy = py - d / 2.0;
    float halfWidth = sqrt(d * d / 4.0 - dy * dy);

    for (float px = -halfWidth; px <= halfWidth; px++) {
      float amount = (float) py / d;

      fill(lerpColor(
        color(100, 0, 180),
        color(220, 150, 255),
        amount * pulse
      ));

      noStroke();
      rect(x + px, y - d / 2 + py, 1, 1);
    }
  }

  noFill();
  stroke(0);
  ellipse(x, y, d, d);
}

 
