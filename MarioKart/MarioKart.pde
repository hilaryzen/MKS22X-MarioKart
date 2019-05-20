class MarioKart {

PImage map;

void setup() {
  size(800,800);
  //Loading map
  map = loadImage("easy.png");
}

void draw() {
  image(map, 0, 0, 800, 800);
  rect(10, 10, 20, 40);
}

}