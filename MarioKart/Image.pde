class Image implements Displayable, Moveable{
  float xcor;
  float ycor;
  float angle = 0;
  float speed;
  int[] greenValues;
  int[] startingPoint;
  int[] endingPoint;
  Kart kart;

  
  Image(float x, float y, float sp, Kart k){
    speed = sp;
    greenValues = new int[2];
    greenValues[0] = 209;
    greenValues[1] = 146;
    startingPoint = new int[2];
    startingPoint[0] = 680;
    startingPoint[1] = 250;
    xcor = x - (startingPoint[0] - 60);
    ycor = y - (startingPoint[1] / 2.0) - 60;
    endingPoint = new int[2];
    endingPoint[0] = 680;
    endingPoint[1] = 150;
    kart = k;
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
  }
  
  void display() {
    scale(7);
    pushMatrix();
    translate(xcor, ycor);
    //translate(kart.getX(), kart.getY());
    //rotate(angle);
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
        angle += 0.01;
      }
      if (key == 't') {
        angle -= 0.01;
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