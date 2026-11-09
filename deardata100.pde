int[] emotions = {
  0,2,0,1,2,3,0,4,2,0,
  1,2,3,0,2,4,0,1,2,3,
  0,0,2,1,4,2,3,0,1,2,
  3,2,0,4,1,2,0,3,2,1,
  0,2,4,3,1,0,2,2,3,0,
  1,0,2,4,3,2,0,1,2,0,
  3,2,1,0,4,2,3,1,0,2,
  2,0,3,4,1,2,0,2,3,1,
  0,4,2,1,3,0,2,1,4,2,
  3,0,2,1,0,4,2,3,1,0
};

int[] environments = {
  0,0,1,0,2,1,0,3,1,0,
  2,1,0,4,0,1,2,0,3,1,
  0,2,1,0,5,1,0,2,3,0,
  1,0,2,4,1,0,3,1,0,2,
  0,1,3,0,2,1,4,0,1,2,
  0,3,1,0,2,5,0,1,3,0,
  2,0,1,4,0,2,1,3,0,1,
  0,2,3,1,0,4,2,0,1,3,
  0,1,2,0,3,1,0,2,4,1,
  0,3,1,2,0,5,1,0,2,3
};

void setup() {
  size(850, 700);
  noLoop();
}

void draw() {
  background(255, 230, 242);

  // Ground
  noStroke();
  fill(180, 210, 150);
  rect(0, 610, width, 90);

  // Ten vertical stems
  for (int col = 0; col < 10; col++) {
    float x = 65 + col * 80;

    // Stem
    stroke(85, 140, 90);
    strokeWeight(3);
    line(x, 125, x, 590);

    // Ten data points per stem
    for (int row = 0; row < 10; row++) {
      int index = col * 10 + row;
      float y = 145 + row * 44;

      int emotion = emotions[index];
      int environment = environments[index];

      drawSymbol(x, y, emotion, environment);
    }

    // Flower at the top
    Flower flower = new Flower(x, 110, col);
    flower.display();
  }

  // Ground decorations
  noStroke();
  fill(255, 190, 110);

  for (int i = 0; i < 15; i++) {
    ellipse(i * 60, 625 + (i % 3) * 10, 5, 5);
  }
}

// FLOWER HEADS
void drawFlower(float x, float y, int type) {
  color[] pinkShades = {
    color(255, 200, 220),  // Baby pink
    color(255, 160, 195),  // Soft pink
    color(245, 120, 175),  // Rose pink
    color(220, 75, 145),   // Deep pink
    color(190, 45, 115)    // Dark pink
  };

  noStroke();

  // Five petals with different pink shades
  for (int i = 0; i < 5; i++) {
    float angle = TWO_PI * i / 5;
    fill(pinkShades[(i + type) % 5]);
    ellipse(
      x + cos(angle) * 9,
      y + sin(angle) * 9,
      15, 15
    );
  }

  // Dark pink flower centre
  fill(170, 35, 100);
  ellipse(x, y, 11, 11);
}

void drawSymbol(float x, float y, int emotion, int environment) {
  color[] pinks = {
    color(255, 190, 215),
    color(255, 150, 190),
    color(240, 110, 165),
    color(220, 75, 140),
    color(190, 45, 115),
    color(255, 215, 230)
  };

  float s = 19;

  pushStyle();
  fill(pinks[environment]);
  stroke(90, 35, 100);
  strokeWeight(1.5);

  if (emotion == 0) {
    // Circle
    ellipse(x, y, s, s);
  } else if (emotion == 1) {
    // Triangle
    triangle(
      x, y - s/2,
      x + s/2, y + s/2,
      x - s/2, y + s/2
    );
  } else if (emotion == 2) {
    // Square
    rectMode(CENTER);
    rect(x, y, s, s);
  } else if (emotion == 3) {
    // Diamond
    quad(
      x, y - s/2,
      x + s/2, y,
      x, y + s/2,
      x - s/2, y
    );
  } else if (emotion == 4) {
    // Zigzag
    noFill();
    beginShape();
    for (int i = 0; i < 5; i++) {
      vertex(x - s/2 + i * 5, y + (i % 2 == 0 ? -7 : 7));
    }
    endShape();
  }

  popStyle();
}

class Flower {
  float x;
  float y;
  int type;

  Flower(float x, float y, int type) {
    this.x = x;
    this.y = y;
    this.type = type;
  }

  void display() {
    drawFlower(x, y, type);
  }
}
