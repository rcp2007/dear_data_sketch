void setup(){

size(1000,600);
fill(64);
noStroke();
background(#F7AFF6);

}
 void draw(){
circle(16,20,20);
fill(#F7F7F7);
stroke(0);
strokeWeight(1);

int diameter = 20;

for (int i = 0; i < 60; i++) {
   circle(10 + diameter/2 + i * diameter,
           20, diameter);

}

circle(30,45, 20);

  line(95, 96, 105, 96);
  line(92, 100, 108, 100);
  line(95, 104, 105, 104);






 }


 
