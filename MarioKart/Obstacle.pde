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
    image(tree, x, y, 10, 10);
  }
}
