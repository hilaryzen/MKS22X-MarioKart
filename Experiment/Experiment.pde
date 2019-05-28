PImage map;
int x;
int y;

void setup() {
  size(800,800);
  map = loadImage("easy copy.png");
  x = 695;
  y = 240;
}

void draw() {
  image(map, 0, 0, 800, 800);
  
  color c = get(x,y);
  if (isOnRoad(c)) {
    fill(0,255,0); //Green kart
  } else {
    fill (255, 0, 0); //Red kart
  }
  println("Red: " + red(c));
  println("Green: " + green(c));
  println("Blue: " + blue(c));
  
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
