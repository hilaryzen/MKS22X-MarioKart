PImage map, mario, golden, start, cloud1, cloud2, sun, star, arrow, copy;
Image b;
Kart k;
int screen = 0;
PFont font;
String input = "";
color col;

/*interface Displayable {
  void display();
}

interface Moveable {
  void move();
  //void draw();
}

ArrayList<Displayable> thingsToDisplay; //from group lab
ArrayList<Moveable> thingsToMove;*/

void setup() {
  size(800,800);
  
  //Loading map
  map = loadImage("easy.png");
  copy = loadImage("easy.png");
  mario = loadImage("mario.png");
  golden = loadImage("golden.png");
  start = loadImage("start.png");
  cloud1 = loadImage("cloud1.png");
  cloud2 = loadImage("cloud2.png");
  star = loadImage("star.png");
  sun = loadImage("sun.png");
  arrow = loadImage("arrow.png");
  startScreen();
  font = loadFont("ARCHRISTY-48.vlw");
  //thingsToDisplay = new ArrayList<Displayable>();
  //thingsToMove = new ArrayList<Moveable>();
  k = new Kart(60, 60, 255, 255, 255, 0, "hey");
  b = new Image(0, 0, k);
  //thingsToDisplay.add(b);
  //thingsToDisplay.add(a);
  //thingsToMove.add(b);
  //thingsToMove.add(a);
}

void draw() {
  //scale(7);
  //image(map, 0, 0, 800, 800);

  if (screen == 1) {
    kartSelect();
  }
  else if (screen == 2) {
    //println(b.getY());
    image(copy, 0, 0, 800, 800);
    col = get((int)((b.getX() * -1) + 60),(int)((b.getY() * -1) + 60));
    b.draw();
    k.draw();
    //b.displayTime();
    
    k.draw();
    move();
    
    if (k.isOnRoad(col)) {
      k.setColor(0, 255, 0); //Green kart
      k.setSpeed(1.3);
    } else {
      k.setColor(255,0, 0); //Red kart
      k.setSpeed(0.7);
    }
    //println(k.isOnRoad(map.get((int)(680),(int)(250))));
  }

  //translate(k.getX(), k.getY());
  
  /*for (Displayable thing : thingsToDisplay) { //from group lab
    thing.display();
  }
  for (Moveable thing : thingsToMove) {
    thing.move();
    //thing.draw();
  }*/
}

void move() {
  if (k.isRacing()) {
    b.moveStraight();
    if (k.isOnRoad(col)) {
      k.setScore(1);
    } else {
      k.setScore(-1);
    }
  }
  b.endRace();
}

void keyPressed() {
  if (screen == 1) {
    if (key == BACKSPACE) {
      input = input.substring(0, input.length() - 1);
    }
    else {
      input += key;
    }
  }
  if (screen == 2 && k.isRacing()) {
    if (key == 'w') {
      /*
      b.moveStraight();
      if (k.isOnRoad(col)) {
        k.setScore(1);
      } else {
        k.setScore(-1);
      }
      */
    }
    if (key == 'a') {
      k.turnLeft();
    }
    if (key == 's') {
      b.moveBack();
      if (k.isOnRoad(col)) {
        k.setScore(1);
      } else {
        k.setScore(-1);
      }
    }
    if (key == 'd') {
      k.turnRight();
    }
  }
  
}

void startScreen() {
  fill(66, 234, 225);
  rect(0, 0, 800, 600);
  fill(53, 224, 20);
  rect(0, (2*height/3) + 30, 800, 400);
  image(cloud1, 70, 70, 140, 70);
  image(cloud2, 630, 130, 130, 120);
  image(sun, 400, 0, 180, 180);
  image(golden, 95, 230, 620, 470);
  image(mario, 60, 170, 690, 150);
  image(start, 335, 690, 150, 70);
}

void mouseClicked() {
  if (screen == 0) {
    if (mouseX > 335 && mouseY> 690 && mouseX < 485 && mouseY < 760) {
      screen = 1;
    }
  }
  if (screen == 1) {
    if (mouseX > 600 && mouseY> 680 && mouseX < 710 && mouseY < 750) {
      k.setN(input);
      k.start();
      image(map,0,0,800,800);
      b.setStartTime();
      //Tried a 3 2 1 animation
      /*
      textSize(18);
      textFont(font);
      for (int i = 3; i > 0; i--) {
        if (millis() > b.getStartTime() + 100000) {
          b.setStartTime();
          text("" + i, 400, 400);
        }
      }
      */
      screen = 2;
    }
  }
}

void kartSelect() {
  int b = 0;
  for (int a = 0; a < height; a++) {
    if (b < 255) {
      stroke(41, 229, b);
      b += 1;
    }
    line(0, a, width, a);
  }
  fill(255);
  ellipse(600, 400, 350, 350);
  image(star, 550, 30, 150, 150);
  image(arrow, 600, 680, 110, 70);
  textSize(18);
  textFont(font);
  text("Choose Your Kart Color", 20, 130);
  text("Choose Your Shape", 20, 400);
  text("Enter Your Username", 20, 630);
  fill(0);
  text(input, 20, 685);
  stroke(0);
  strokeWeight(4);
  fill(255, 18, 62);//red
  rect(40, 160, 70, 70);
  fill(255, 126, 5);//orange
  rect(130, 160, 70, 70);
  fill(255, 243, 5);//yellow
  rect(220, 160, 70, 70);
  fill(46, 255, 5);//green
  rect(40, 250, 70, 70);
  fill(5, 255, 207);//blue
  rect(130, 250, 70, 70);
  fill(255, 93, 171);//pink/purple
  rect(220, 250, 70, 70);
  k.display();
  if (mouseX > 40 && mouseY> 160 && mouseX < 110 && mouseY < 230) {
      k.setColor(255, 18, 62);
  }
  if (mouseX > 130 && mouseY> 160 && mouseX < 200 && mouseY < 230) {
      k.setColor(255, 126, 5);
  }
  if (mouseX > 220 && mouseY> 160 && mouseX < 290 && mouseY < 230) {
      k.setColor(255, 243, 5);
  }
  if (mouseX > 40 && mouseY> 250 && mouseX < 110 && mouseY < 320) {
      k.setColor(46, 255, 5);
  }
  if (mouseX > 130 && mouseY> 250 && mouseX < 200 && mouseY < 320) {
      k.setColor(5, 255, 207);
  }
  if (mouseX > 220 && mouseY> 250 && mouseX < 290 && mouseY < 320) {
      k.setColor(255, 93, 171);
  }
  //if (mouseX > 335 && mouseY> 690 && mouseX < 485 && mouseY < 760) {
  //    screen++;
  //} next button
}