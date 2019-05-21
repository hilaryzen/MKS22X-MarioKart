class Image implements Displayable, Moveable{
  float xcor;
  float ycor;
  
  Image(float x, float y){
    xcor = x;
    ycor = y;
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