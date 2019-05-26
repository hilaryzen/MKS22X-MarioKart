PImage map;

void setup() {
  size(800,800);
  map = loadImage("easy copy.png");
}

void draw() {
  image(map, 0, 0, 800, 800);
  int x = 380;
  int y = 400;
  
  color c = get(x,y);
  println("Red: " + red(c));
  println("Green: " + green(c));
  println("Blue: " + blue(c));
  
  rect(x, y, 10, 10);
}
