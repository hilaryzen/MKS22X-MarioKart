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
  
  k = new Kart(60, 60);
  b = new Image(0, 0, k);
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
    b.moveStraight();
    if (k.isOnRoad()) {
      k.setScore(1);
    } else {
      k.setScore(-1);
    }
  }
  if (key == 'a') {
    k.turnLeft();
  }
  if (key == 's') {
    b.moveBack();
    if (k.isOnRoad()) {
      k.setScore(1);
    } else {
      k.setScore(-1);
    }
  }
  if (key == 'd') {
    k.turnRight();
  }
  //println(k.getScore());
}
