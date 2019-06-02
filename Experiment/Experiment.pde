PImage map;
PFont font;
int x;
int y;
Tree tree;
float direction;

void setup() {
  
  size(800,800);
  map = loadImage("easy copy.png");
  x = 650;
  y = 154;
  direction = 60.0;
  
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

void draw() {
  image(map, 0, 0, 800, 800);
  
  move();
  
  color c = get(x,y);
  if (isOnRoad(c)) {
    fill(0,255,0); //Green kart
  } else {
    fill (255, 0, 0); //Red kart
  }
  /*
  println("Red: " + red(c));
  println("Green: " + green(c));
  println("Blue: " + blue(c));
  */
  
  rect(x, y, 10, 10);
}

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
  if (red(c) < 220) {
    return false;
  } else if (green(c) < 200 || green(c) > 230) {
    return false;
  } else if (blue(c) < 135 || blue(c) > 160) {
    return false;
  }
  return true;
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
  x -= 2 * cos(radians(direction));
  y -= 2 * sin(radians(direction));
}

void leaderboard() {
  fill(255,255,255);
  rect(0,0,800,800);
  fill(0,0,0);
  textSize(30);
  textFont(font);
  text("#1", 390, 50);
  text("LEADERBOARD", 300, 100);
}
