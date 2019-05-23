class Image implements Displayable, Moveable{
  float xcor;
  float ycor;
<<<<<<< HEAD
  float angle = 0;
  float speed;
=======
  int[] greenValues;
  int[] startingPoint;
  int[] endingPoint;
  PImage map;
>>>>>>> 9f59bef90e74cef1260f2923df97a9b3c1018c13
  
  Image(float x, float y, float sp){
    xcor = x;
    ycor = y;
<<<<<<< HEAD
    speed = sp;
=======
    map = loadImage("easy.png");
    greenValues = new int[2];
    greenValues[0] = 209;
    greenValues[1] = 146;
    startingPoint = new int[2];
    startingPoint[0] = 680;
    startingPoint[1] = 250;
    endingPoint = new int[2];
    endingPoint[0] = 680;
    endingPoint[1] = 150;
  }
  
  int getStartX() {
    return startingPoint[0];
  }
  
  int getStartY() {
    return startingPoint[1];
  }
  
  int getEndX() {
    return endingPoint[0];
  }
  
  int getEndY() {
    return endingPoint[1];
>>>>>>> 9f59bef90e74cef1260f2923df97a9b3c1018c13
  }
  
  void display() {
    scale(7);
    pushMatrix();
    translate(xcor, ycor);
    rotate(angle);
    image(map, 0, 0, 800, 800);
    popMatrix();
   
  }
  
  void move() {
    if (keyPressed()) {
      if (key == 'w') {
        ycor = ycor + speed;
      }
      if (key == 'a') {
        xcor = xcor + speed;
      }
      if (key == 's') {
        ycor = ycor - speed;
      }
      if (key == 'd') {
        xcor = xcor - speed;
      }
      if (key == 'r') {
        angle += 0.006;
      }
      if (key == 't') {
        angle -= 0.006;
      }
      
    }
    
  }
  void draw() {
    
  }
  
  boolean keyPressed() {
    if ((key == 's') || (key == 'w') ||(key == 'a') ||(key == 'd')|| (key == 'r')|| (key == 't')) {
      return true;
    }
    return false;
  }
  
}
