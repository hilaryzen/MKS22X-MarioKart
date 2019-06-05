PImage map;
PFont font;
int x;
int y;
<<<<<<< HEAD
Computer c;
=======
Tree tree;
Computer c1;
>>>>>>> master

void setup() {
  
  size(800,800);
  map = loadImage("easy copy.png");
<<<<<<< HEAD
  c = new Computer(1);
  x = 670;
  y = 150;
  //direction = 60.0;
  
  int newX = (int) (x + 50 * sin(radians(90.0)));
  int newY = (int) (y + 50 * cos(radians(90.0)));
  //println("newX: " + newX);
  //println("newY: " + newY);
  /*
  size(800,800);
  font = loadFont("ARCHRISTY-48.vlw");
  leaderboard();
  */
}

=======
  x = 695;
  y = 240;
  c1 = new Computer(1);
}


>>>>>>> master
void draw() {
  //scale(7);
  //pushMatrix();
  //translate(-650, -140);
  image(map, 0, 0, 800, 800);
<<<<<<< HEAD
  //popMatrix();
  c.draw();
  
  //c.move();
=======
  c1.draw();
  //tree.draw();
>>>>>>> master
  
  /*
  color c = get(x,y);
  if (isOnRoad2(c)) {
    fill(0,255,0); //Green kart
  } else {
    fill (255, 0, 0); //Red kart
  }
<<<<<<< HEAD
  
=======
  /*
>>>>>>> master
  println("Red: " + red(c));
  println("Green: " + green(c));
  println("Blue: " + blue(c));
  */
  
  //rect(x, y, 10, 10);
<<<<<<< HEAD
  println("X: " + x + " Y: " + y);
}
=======
}

>>>>>>> master

void keyPressed() {
  if (key == 'w') {
    y += 10;
  } else if (key == 's') {
    y -= 10;
  } else if (key == 'a') {
    x -= 10;
  } else if (key == 'd') {
    x += 10;
  }
  //Road: R = 244, G = 217, B = 149
  //Water: R = 125, G = 242, B = 249
  //Light green: R = 69, G = 181, B = 58
  //Dark green: R = 0, G = 145, B = 1
}

boolean isOnRoad(color c) {
  /*
  if (red(c) < 220) {
    return false;
  } else if (green(c) < 200 || green(c) > 230) {
    return false;
  } else if (blue(c) < 135 || blue(c) > 160) {
    return false;
  }
  return true;
  */
  if (red(c) > 230 && red(c) < 250 && green(c) > 200 && green(c) < 230 && blue(c) > 135 && blue(c) < 160) {
    return true;
  } 
  if (red(c) > 160 && red(c) < 195 && green(c) > 110 && green(c) < 150 && blue(c) > 0 && blue(c) < 30) {
    return true;
  } 
  return false;
}

<<<<<<< HEAD
boolean isOnRoad2(color c) {
  //Road: R = 244, G = 217, B = 149
  //Bridge: R = 184, G = 132, B = 21
  if (red(c) > 230 && red(c) < 250 && green(c) > 200 && green(c) < 230 && blue(c) > 135 && blue(c) < 160) {
    return true;
  } 
  if (red(c) > 160 && red(c) < 195 && green(c) > 110 && green(c) < 150 && blue(c) > 0 && blue(c) < 30) {
    return true;
  } 
  return false;
}

void move() {
  /*
  if (direction >= 0) {
    x += 2 * sin(radians(direction + 90));
    y += 2 * cos(radians(direction + 90));
  } else {
    x += 2 * sin(radians(180 - direction));
    y += 2 * cos(radians(180 - direction));
  }
  */
  //x -= 2 * cos(radians(direction));
  //y -= 2 * sin(radians(direction));
  c.move();
}

=======
/*
>>>>>>> master
void leaderboard() {
  fill(255,255,255);
  rect(0,0,800,800);
  fill(0,0,0);
  textSize(30);
  textFont(font);
  text("#1", 390, 50);
  text("LEADERBOARD", 300, 100);
}
*/
