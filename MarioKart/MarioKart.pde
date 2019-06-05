PImage map, mario, golden, start, cloud1, cloud2, sun, star, arrow, copy, select, replay, racecar, kart, car;
Image b, miniB;
Player k, miniK;
Computer c1, miniC;
int screen = 0;
PFont font;
String input = "";
color col;
int[][] colors = {{255, 18, 62}, {255, 126, 5}, {255, 243, 5}, {46, 255, 5}, {5, 255, 207}, {255, 93, 171}};
ArrayList<Integer[]> leaderboard = new ArrayList<Integer[]>();
int holdY;
//Integer[] score; //= new Integer[2];

interface Displayable {
  void draw();
}

/*
interface Moveable {
  void move();
  //void draw();
}
*/

ArrayList<Displayable> thingsToDisplay = new ArrayList<Displayable>(); //from group lab
//ArrayList<Moveable> thingsToMove;

interface Collideable {
  boolean isTouching(Obstacle o);
}

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
  select = loadImage("select.png");
  replay = loadImage("replay.png");
  racecar = loadImage("racecar.png");
  kart = loadImage("kart.png");
  car = loadImage("car.png");
  startScreen();
  font = loadFont("ARCHRISTY-48.vlw");
  //thingsToDisplay = new ArrayList<Displayable>();
  //thingsToMove = new ArrayList<Moveable>();
  k = new Player(60, 60, 255, 255, 255, -1, "hey");
  miniK = new Player(60, 60, 255, 255, 255, 0, "hey");
  c1 = new Computer(1, k);
  miniC = new Computer(1, k);
  b = new Image(0, 0, k, c1);
  miniB = new Image(0, 0, k, c1);
  thingsToDisplay.add(k);
  thingsToDisplay.add(c1);
  //thingsToMove.add(b);
  //thingsToMove.add(a);
}

void draw() {
  //scale(7);
  //image(map, 0, 0, 800, 800);

  if (screen == 1) {
    kartSelect();
  }
  if (screen == 2) {
    mapSelect();
    b.reset();
    k.reset();
    miniK.reset();
    c1.reset();
    miniC.reset();
  }
  else if (screen == 3) {
    //println(b.getY());
    image(copy, 0, 0, 800, 800);
    //c1.randomDirection2();
    c1.move();
    col = get((int)((b.getX() * -1) + 60),(int)((b.getY() * -1) + 60));
    k.placeOnMapX(((b.getX() * -1) + 60));
    k.placeOnMapY(((b.getY() * -1) + 60));
    //println((b.getX() * -1) + " " +(b.getY() * -1) + 60);
    b.draw();
    
    //k.draw();
    for (Displayable d : thingsToDisplay) {
      d.draw();
    }
    //k.draw();
    b.displayObstacles();
    miniB.displayMini();
    miniK.displayMini();
    miniC.displayMini();
    //b.displayTime();
    
    //k.draw();
    move();
    if (b.endRace()) {
      screen = 6; //ending screen
    }
    if (k.isOnWater(col)) {
      ////k.setColor(0, 0, 255); //Blue kart
      b.endRace();
      screen = 5;
    }
    else if (k.isOnRoad(col)) {
      //k.setColor(0, 255, 0); //Green kart
      k.setSpeed(2.8);
      miniK.setSpeed(2.8);
    } else {
      ///k.setColor(255,0, 0); //Red kart
      k.setSpeed(1.2);
      miniK.setSpeed(1.2);
    }
    for (Rock d : b.getRockCoor()) {
      if (k.isTouching(d)) {
        k.setSpeed(0);
        miniK.setSpeed(0);
      }
    }
    //println(k.isOnRoad(map.get((int)(680),(int)(250))));
  }
  else if (screen == 5) {
    lostScreen();
  }
  else if (screen == 6) {
    //endingScreen();
    int currentTime = millis();
    
    while (millis() - currentTime < 3000) {
      //endingScreen();
      
    }
    fill(255,0,0);
    textSize(30);
    textFont(font);
    text("YOU WON!", 320, 340);
    //fill(0);
    text("Click l to view the leaderboard", 110, 670);
    
  }
  else if (screen == 7) {
    leaderboard();
  }

  //translate(k.getX(), k.getY());
  
  /*for (Displayable thing : thingsToDisplay) { //from group lab
    thing.display();
  }
  for (Moveable thing : thingsToMove) {
    thing.move();
    //thing.draw();is
  }*/
}

void move() {
  if (k.isRacing()) {
    b.moveStraight();
    miniK.moveStraight();
    if (k.isOnRoad(col)) {
      k.setScore(1);
    } else {
      k.setScore(-1);
    }
  }
  //c1.move();
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
  if (screen == 3 && k.isRacing()) {
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
      miniK.turnLeft();
    }
    if (key == 's') {
      
      if (k.isOnRoad(col)) {
        k.setScore(1);
        k.setSpeed(1.6);
        miniK.setSpeed(1.6);
      } else {
        k.setScore(-1);
        k.setSpeed(1);
        miniK.setSpeed(1);
      }
      b.moveBack();
      miniK.moveBackMini();
      b.moveBackObs();
    }
    if (key == 'd') {
      k.turnRight();
      miniK.turnRight();
    }
  }
  if (screen == 6) {
    if (key == 'l') {
      Integer[] score = {(k.getEndTime() - b.getStartTime()) / 1000, k.getScore()};
      //score[0] = (k.getEndTime() - b.getStartTime()) / 1000;
      //score[1] = k.getScore();
      if ((leaderboard.size() != 0) && !(leaderboard.get(leaderboard.size() - 1)[0] < score[0])) {
        for (int a = 0; a < leaderboard.size(); a++) {
          if (leaderboard.get(a)[0] >= score[0]) {
            leaderboard.add(a, score);
            break;
          }
        }
        //leaderboard.add(score);
      }
      else {
        leaderboard.add(score);
      }
      /*for (int a = 0; a < leaderboard.size(); a++) {
        println(leaderboard.get(a)[0]);
      }*/
      screen = 7;
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
      //k.start();
      //image(map,0,0,800,800);
      //b.setStartTime();
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
  if (screen == 2) {
    if (mouseX > 50 && mouseY> 135 && mouseX < 220 && mouseY < 305) {
      b.resetRock();
      b.roadPixels();
      b.rockCoor();
      
      k.start();
      image(map,0,0,800,800);
      b.setStartTime();
      screen = 3;
    }
  }
  if (screen == 5) {
    if (mouseX > 590 && mouseY> 680 && mouseX < 725 && mouseY < 740) {
      //b.roadPixels();
      //b.rockCoor();
      screen = 2;
    }
  }
  if (screen == 7) {
    if (mouseX > 590 && mouseY> 680 && mouseX < 725 && mouseY < 740) {
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
  image(racecar, 26, 429, 90, 120);
  image(kart, 132, 429, 90, 120);
  image(car, 242, 429, 90, 120);
  k.display();
  if (mouseX > 40 && mouseY> 160 && mouseX < 110 && mouseY < 230) {
      k.setColor(255, 18, 62); //red
      computerColor(0);
  }
  if (mouseX > 130 && mouseY> 160 && mouseX < 200 && mouseY < 230) {
      k.setColor(255, 126, 5); //orange
      computerColor(1);
  }
  if (mouseX > 220 && mouseY> 160 && mouseX < 290 && mouseY < 230) {
      k.setColor(255, 243, 5); //yellow
      computerColor(2);
  }
  if (mouseX > 40 && mouseY> 250 && mouseX < 110 && mouseY < 320) {
      k.setColor(46, 255, 5); //green
      computerColor(3);
  }
  if (mouseX > 130 && mouseY> 250 && mouseX < 200 && mouseY < 320) {
      k.setColor(5, 255, 207); //turquoise
      computerColor(4);
  }
  if (mouseX > 220 && mouseY> 250 && mouseX < 290 && mouseY < 320) {
      k.setColor(255, 93, 171); //pink
      computerColor(5);
  }
  if (mouseX > 26 && mouseY> 429 && mouseX < 116 && mouseY < 549) {
      k.setS(0);
  }
  if (mouseX > 132 && mouseY> 429 && mouseX < 222 && mouseY < 549) {
      k.setS(1);
  }
  if (mouseX > 242 && mouseY> 429 && mouseX < 332 && mouseY < 549) {
      k.setS(2);
  }
  //if (mouseX > 335 && mouseY> 690 && mouseX < 485 && mouseY < 760) {
  //    screen++;
  //} next button
}

void computerColor(int c) {
  int index = (int) (Math.random() * 5);
  if (index < c) {
    c1.setColor(colors[index][0], colors[index][1], colors[index][2]);
  } else {
    c1.setColor(colors[index + 1][0], colors[index + 1][1], colors[index + 1][2]);
  }
}
    

void mapSelect() {
  int b = 0;
  for (int a = 0; a < height; a++) {
    if (b < 255) {
      stroke(b, 229, 66);
      b += 1;
    }
    line(0, a, width, a);
  }
  fill(255);
  //image(select, 335, 690, 150, 70);
  textSize(18);
  textFont(font);
  text("Select A Map", 280, 68);
  stroke(4);
  rect(45, 130, 180, 180);
  image(copy, 50, 135, 170, 170);
}

void lostScreen() {
  fill(66, 234, 225);
  rect(0, 0, 800, 600);
  fill(53, 224, 20);
  rect(0, (2*height/3) + 30, 800, 400);
  image(cloud1, 70, 70, 140, 70);
  image(cloud2, 630, 130, 130, 120);
  image(replay, 590, 680, 135, 60);
  fill(34, 224, 25);
  textSize(30);
  textFont(font);
  text("OH NO!!", 320, 340);
  text("YOU DROWNED!!", 260, 400);
}

void endingScreen() {
  fill(255,0,0);
  textSize(30);
  textFont(font);
  text("YOU WON!", 320, 340);
}

void leaderboard() {
  int c = 0;
  for (int a = 0; a < height; a++) {
    if (c < 255) {
      stroke(c, 110, 255, 50);
      c += 1;
    }
    line(0, a, width, a);
  }
  fill(255);
  //fill(255,255,255);
  //rect(0,0,800,800);
  fill(0,0,0);
  textSize(30);
  textFont(font);
  int place = k.getPlace();
  if (place == 1) {
    text("You got 1st place!", 235, 80);
  } else if (place == 2) {
    text("You got 2nd place!", 235, 80);
  } else if (place == 3) {
    text("You got 3rd place!", 235, 80);
  } else {
    text("You got " + place + "th place!", 235, 80);
  }
  textSize(35);
  text("LEADERBOARD", 300, 170);
  holdY = 250;
  String name = k.getName(); 
  for (int a = 0; a < leaderboard.size(); a++) {
    //println(leaderboard.get(a)[0]);
    text(a + 1 + "      " + name + "        " + leaderboard.get(a)[0] + " sec" + "        " + leaderboard.get(a)[1], 130, holdY + (a * 45));
  }
  //text("1" + "      " + name + "        " + (k.getEndTime() - b.getStartTime()) / 1000 + " sec" + "        " + k.getScore(), 130, 250);
  //text(name, 190, 250);
  //text((k.getEndTime() - b.getStartTime()) / 1000 + " sec", 350, 250);
  //text(k.getScore(), 520, 250);
  image(replay, 590, 680, 135, 60);
}
