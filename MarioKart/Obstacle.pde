class Obstacle implements Collideable{
  float x;
  float y;
  
  Obstacle(float xcor, float ycor) {
    x = xcor;
    y = ycor;
  }
  
  void draw() {
    
  }
  
  boolean isTouching(Object b) {
    return true;
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
  
  void changeX(float change) {
    x += change;
  }
  
  void changeY(float change) {
    y += change;
  }
  
  void draw() {
    pushMatrix();
    translate(x, y);
    translate(-680 + 60, -150 + 60);
    image(rock, -5, -5, 10, 10);
    popMatrix();
    
  }
  
}