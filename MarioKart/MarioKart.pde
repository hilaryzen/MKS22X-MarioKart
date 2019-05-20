PImage map;
Kart k;

void setup() {
  size(800,800);
  //Loading map
  map = loadImage("easy.png");
}

void draw() {
  image(map, 0, 0, 800, 800);
  k = new Kart(400, 400);
  k.display();
}
