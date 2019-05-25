PImage map;
Image b;
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
  map = loadImage("easy.png");
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  b = new Image(0, 0);
  k = new Kart(b.getStartX(), b.getStartY());
  //thingsToDisplay.add(b);
  //thingsToDisplay.add(a);
  //thingsToMove.add(b);
  //thingsToMove.add(a);
}

void draw() {
  //scale(7);
  //image(map, 0, 0, 800, 800);
  b.draw();
  //translate(k.getX(), k.getY());
  
  /*for (Displayable thing : thingsToDisplay) { //from group lab
    thing.display();
  }
  for (Moveable thing : thingsToMove) {
    thing.move();
    //thing.draw();
  }*/
  k.draw();
}
void keyPressed() {
  if (key == 'w') {
    k.moveStraight();
  }
  if (key == 'a') {
    k.turnLeft();
  }
  if (key == 's') {
    k.moveBack();
  }
  if (key == 'd') {
    k.turnRight();
  }
}
