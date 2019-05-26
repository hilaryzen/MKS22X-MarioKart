PImage map;
int x;
int y;

void setup() {
  size(800,800);
  map = loadImage("easy copy.png");
  x = 380;
  y = 400;
}

void draw() {
  image(map, 0, 0, 800, 800);
  
  color c = get(x,y);
  println("Red: " + red(c));
  println("Green: " + green(c));
  println("Blue: " + blue(c));
  
  rect(x, y, 10, 10);
}

void keyPressed() {
  if (key == 'w') {
    y += 20;
  } else if (key == 's') {
    y -= 20;
  } else if (key == 'a') {
    x -= 20;
  } else if (key == 'd') {
    x += 20;
  }
}
