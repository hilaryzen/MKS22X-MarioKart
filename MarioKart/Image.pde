class Image implements Displayable, Moveable{
  float xcor;
  float ycor;
  int[] greenValues;
  int[] startingPoint;
  PImage map;
  
  Image(float x, float y){
    xcor = x;
    ycor = y;
    map = loadImage("easy.png");
    greenValues = new int[2];
    greenValues[0] = 209;
    greenValues[1] = 146;
    startingPoint = new int[2];
    startingPoint[0] = 680;
    startingPoint[1] = 250;
  }
  
  void display() {
    image(map, xcor, ycor, 800, 800);
  }
  
  void move() {
    if (keyPressed()) {
      if (key == 'w') {
      ycor = ycor - 5;
    }
    if (key == 'a') {
      xcor = xcor - 5;
    }
    if (key == 's') {
      ycor = ycor + 5;
    }
    if (key == 'd') {
      xcor = xcor + 5;
    }
      
    }
  }
  void draw() {
    
  }
  
  boolean keyPressed() {
    if ((key == 's') || (key == 'w') ||(key == 'a') ||(key == 'd') ) {
      return true;
    }
    return false;
  }
  
}
