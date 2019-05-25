PImage map, mario, golden, start, cloud1, cloud2, sun;
Image b;
Kart k;
int screen = 0;

/*interface Displayable {
  void display();
}

interface Moveable {
  void move();
  //void draw();
}

ArrayList<Displayable> thingsToDisplay; //from group lab
ArrayList<Moveable> thingsToMove;*/

void setup() {
  size(800,800);
  
  //Loading map
  map = loadImage("easy.png");
  mario = loadImage("mario.png");
  golden = loadImage("golden.png");
  start = loadImage("start.png");
  cloud1 = loadImage("cloud1.png");
  cloud2 = loadImage("cloud2.png");
  sun = loadImage("sun.png");
  startScreen();
  //thingsToDisplay = new ArrayList<Displayable>();
  //thingsToMove = new ArrayList<Moveable>();
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
  if (screen != 0) {
    b.draw();
    k.draw();
  }

  //translate(k.getX(), k.getY());
  
  /*for (Displayable thing : thingsToDisplay) { //from group lab
    thing.display();
  }
  for (Moveable thing : thingsToMove) {
    thing.move();
    //thing.draw();
  }*/
}
void keyPressed() {
  if (key == 'w') {
    b.moveStraight();
  }
  if (key == 'a') {
    k.turnLeft();
  }
  if (key == 's') {
    b.moveBack();
  }
  if (key == 'd') {
    k.turnRight();
  }
}

void startScreen() {
  fill(66, 234, 225);
  rect(0, 0, 800, 600);
  fill(53, 224, 20);
  rect(0, (2*height/3) + 30, 800, 400);
  image(cloud1, 70, 70, 140, 70);
  image(cloud2, 630, 130, 130, 120);
  image(sun, 400, 0, 180, 180);
  image(golden, 95, 230, 620, 470);
  image(mario, 60, 170, 690, 150);
  image(start, 335, 690, 150, 70);
}
