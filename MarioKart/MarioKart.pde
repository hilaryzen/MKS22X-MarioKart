PImage map;
Kart k;

interface Displayable {
  void display();
}

interface Moveable {
  void move();
  //void draw();
}

ArrayList<Displayable> thingsToDisplay; //from group lab
ArrayList<Moveable> thingsToMove;

void setup() {
  size(800,800);
  //Loading map
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  map = loadImage("easy.png");
  Kart a = new Kart(70, 70);
  Image b = new Image(0, 0, a.getSpeed());
  thingsToDisplay.add(b);
  thingsToDisplay.add(a);
  thingsToMove.add(b);
}

void draw() {
  //image(map, 0, 0, 800, 800);
  for (Displayable thing : thingsToDisplay) { //from group lab
    thing.display();
  }
  for (Moveable thing : thingsToMove) {
    thing.move();
    //thing.draw();
  }
}
