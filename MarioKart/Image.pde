class Image{
  float xcor;
  float ycor;
  float angle = 0;
  float speed;
  int[] greenValues;
  int[] startingPoint;
  int[] endingPoint;
  int startTime;
  Kart kart;

  
  Image(float x, float y, Kart a){
    speed = 1.0;
    greenValues = new int[2];
    greenValues[0] = 209;
    greenValues[1] = 146;
    startingPoint = new int[2];
    startingPoint[0] = 680;
    startingPoint[1] = 250;
    xcor = x - (startingPoint[0] - 60) ;
    ycor = y - (startingPoint[1]) + 60;
    endingPoint = new int[2];
    endingPoint[0] = 680;
    endingPoint[1] = 150;
    kart = a;
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
  
  int getStartTime() {
    return startTime;
  }
  
  void setStartTime() {
    startTime = millis();
  }
  
  void draw() {
    scale(7);
    
    pushMatrix();
    
    //translate(kart.getX(), kart.getY());
    //rotate(angle);
    translate(xcor, ycor);
    //scale(7);
    image(map, 0, 0, 800, 800);
    popMatrix();
 
    //translate(xcor, ycor);
    displayTime();
  }
  
  /*void move() {
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
        angle += 0.005;
      }
      if (key == 't') {
        angle -= 0.005;
      }
      
    }
    
  }*/
  
  void moveStraight() {
    xcor = xcor + (kart.getSpeed() * sin(radians(kart.getDirection())));
    ycor = ycor + (kart.getSpeed() * cos(radians(kart.getDirection())));
  }
   void moveBack() {
    xcor = xcor - (kart.getSpeed() * sin(radians(kart.getDirection())));
    ycor = ycor - (kart.getSpeed() * cos(radians(kart.getDirection())));
  }
  
  void endRace() {
    if (abs(kart.getX() - endingPoint[0]) < 20 && abs(kart.getY() - endingPoint[1]) < 10) {
      kart.setEndTime();
      kart.finish();
    }
  }
  
  void displayTime() {
    textSize(18);
    //textFont(font);
    fill(255,0,0);
    text("" + (millis() - startTime) / 1000, 400, 100);
  }
}
