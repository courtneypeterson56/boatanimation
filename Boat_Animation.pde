Boat boat;
Cloud cloud;
Wave wave;

void setup() {
  size(1000, 800);
  boat = new Boat(250, 250, 2.7);
  cloud = new Cloud(10, 10, -.25);
  wave = new Wave(10, 10, 1);
}

void draw() {
  background(225);

  //render
  boat.render();

  //update
  boat.move();

  //render
  cloud.render();

  //update
  cloud.move();

  //render
  wave.render();

  //update
  wave.move();
}

class Wave {

  float x;
  float y;
  float speed;
  float direction;

  Wave(float x, float y, float speed) {
    this.x = x;
    this.y = y;
    this.speed = speed;

    direction = 1;
  }

  void move() {
    x = x + speed*direction;
    if (x < 0 || x > 900) { //if you hit an edge...
      direction *= -1;

      if (x > 1000) {
        x=0;
      }
    }
  }

  void render() {

    pushMatrix();
    translate(x+1, y-70);

    pushMatrix();

    beginShape();
    stroke(#4372D6);
    strokeWeight(1.4);
    fill(#4372D6);
    vertex(1300, 600);
    vertex(1000, 900);
    vertex(0, 900);
    vertex(0, 600);
    bezierVertex(32, 628, 112, 646, 150, 600);
    bezierVertex(182, 628, 262, 646, 300, 600);
    bezierVertex(332, 628, 412, 646, 450, 600);
    bezierVertex(482, 628, 562, 646, 600, 600);
    bezierVertex(632, 628, 712, 646, 750, 600);
    bezierVertex(782, 628, 862, 646, 900, 600);
    bezierVertex(932, 628, 1012, 646, 1050, 600);
    bezierVertex(1082, 628, 1162, 646, 1300, 600);
    endShape();

    beginShape();
    translate(-900, 0);
    stroke(#4372D6);
    strokeWeight(1.4);
    fill(#4372D6);
    vertex(1300, 600);
    vertex(1000, 900);
    vertex(0, 900);
    vertex(0, 600);
    bezierVertex(32, 628, 112, 646, 150, 600);
    bezierVertex(182, 628, 262, 646, 300, 600);
    bezierVertex(332, 628, 412, 646, 450, 600);
    bezierVertex(482, 628, 562, 646, 600, 600);
    bezierVertex(632, 628, 712, 646, 750, 600);
    bezierVertex(782, 628, 862, 646, 900, 600);
    bezierVertex(932, 628, 1012, 646, 1050, 600);
    bezierVertex(1082, 628, 1162, 646, 1300, 600);
    endShape();

    popMatrix();
    popMatrix();
  }
}


class Cloud {

  float x;
  float y;
  float speed;

  Cloud(float x, float y, float speed) {
    this.x = x;
    this.y = y;
    this.speed = speed;
  }

  void move() {
    x = x + speed;
  }

  void render() {  

    pushMatrix();
    translate(x+100, y-20);

    pushMatrix();

    beginShape();//cloud
    stroke(0);
    strokeWeight(1.3);
    fill(255, 255, 255);
    vertex(140, 95);
    bezierVertex(126, 56, 200, 52, 212, 80);
    bezierVertex(233, 56, 305, 70, 270, 113);
    bezierVertex(312, 145, 233, 197, 210, 165);
    bezierVertex(193, 189, 131, 187, 136, 149);
    bezierVertex(90, 147, 89, 100, 140, 95);
    endShape();

    beginShape();//cloud
    translate(500, 50);
    scale(1.2);
    stroke(0);
    strokeWeight(1);
    fill(255, 255, 255);
    vertex(140, 95);
    bezierVertex(126, 56, 200, 52, 212, 80);
    bezierVertex(233, 56, 305, 70, 270, 113);
    bezierVertex(312, 145, 233, 197, 204, 165);
    bezierVertex(193, 189, 131, 187, 136, 149);
    bezierVertex(90, 147, 89, 100, 140, 95);
    endShape();

    beginShape();//cloud
    translate(-100, -20);
    scale(.6);
    stroke(0);
    strokeWeight(1.6);
    fill(255, 255, 255);
    vertex(140, 95);
    bezierVertex(126, 56, 200, 52, 212, 80);
    bezierVertex(233, 56, 305, 70, 270, 113);
    bezierVertex(312, 145, 233, 197, 204, 165);
    bezierVertex(193, 189, 131, 187, 136, 149);
    bezierVertex(90, 147, 89, 100, 140, 95);
    endShape();
    popMatrix();

    popMatrix();
  }
}




class Boat {

  float x;
  float startY;
  float y;
  float speed;
  float direction;

  Boat(float x, float startY, float speed) {
    this.x = x;
    this.startY = startY;
    this.speed = speed;

    y = startY;
    direction = 1;
  }

  void move() {
    x = x + speed*direction;
    y = wave(x) + startY; //compute y value for that x value
    if (x < 80 || x > 1840) { //if you hit an edge...
      direction *= -1;
    }
  }

  void render() {
    background(#AFDDFF);
    pushMatrix();
    scale(.5);
    translate(x-300, y+300);
    fill(0);
    beginShape();//bottom of boat
    fill(#D31E1E);//color of bottom of boat
    stroke(0);//color of bottom of boat
    strokeWeight(3);
    vertex(134, 431);//starting point
    bezierVertex(179, 601, 419, 605, 482, 431);  // boat bottom
    line(134, 431, 482, 431); //boat top
    endShape();
    beginShape();//mast
    stroke(0);//color of mast
    fill(#9B6105);//color of mast
    rect(298, 120, 12, 310); //mast
    arc(304, 120, 12, 12, PI, TWO_PI); 
    endShape();
    beginShape();//windows
    strokeWeight(2);
    fill(#FAF5F5);//color of inside windows
    stroke(0);
    ellipse(304, 470, 30, 30);
    ellipse(376, 470, 30, 30);
    ellipse(230, 470, 30, 30);
    endShape();
    beginShape();//
    vertex(220, 40);
    bezierVertex(270, 83, 344, 196, 383, 227);
    beginShape();
    fill(#FBFF36);//color of right side of sail
    stroke(0);
    vertex(310, 150);
    bezierVertex(419, 189, 480, 272, 456, 389);
    vertex(310, 389);
    bezierVertex(338, 341, 367, 227, 310, 150);
    endShape();
    beginShape();
    stroke(0);//color of left side of sail
    fill(#FBFF36);
    vertex(298, 135);
    bezierVertex(191, 222, 140, 302, 154, 389);
    vertex(298, 389);
    bezierVertex(243, 254, 270, 192, 298, 135);
    endShape();
    beginShape();
    stroke(0);//color of flag
    fill(#D31E1E);
    vertex(310, 130);
    bezierVertex(346, 158, 358, 106, 386, 131);
    vertex(386, 156);
    bezierVertex(356, 157, 352, 195, 310, 156);
    endShape();
    popMatrix();
  }

  float wave(float x) {
    float y = 50*(sin(x/100));
    return y;
  }
}