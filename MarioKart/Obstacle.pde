class Obstacle {
  float x;
  float y;
  
  Obstacle(float xcor, float ycor) {
    x = xcor;
    y = ycor;
  }
  
  void draw() {
    
  }
}

class Tree extends Obstacle {
  PImage tree;
  
  Tree(float xcor, float ycor) {
    super(xcor, ycor);
    tree = loadImage("tree.png");
  }
  
  void draw() {
    image(tree, x, y, 50, 50);
  }
}

class Rock extends Obstacle {
  PImage rock;
  
  Rock(float x, float y) {
    super(x, y);
    rock = loadImage("rock.png");
  }
  
  void draw() {
    image(rock, x, y, 50, 50);
  }
}