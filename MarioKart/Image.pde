class Image implements Displayable, Moveable{
  float xcor;
  float ycor;
  
  Image(float x, float y){
    xcor = x;
    ycor = y;
  }
  
  void display() {
    scale(7);
    if (keyPressed()) {
      if (key == 'r') {
        rotate(PI/20);
      }
      if (key == 't') {
        rotate(-PI/20);
      }
    }
    image(map, xcor, ycor, 800, 800);
    
  }
  
  void move() {
    if (keyPressed()) {
      if (key == 'w') {
        ycor = ycor + 2;
      }
      if (key == 'a') {
        xcor = xcor + 2;
      }
      if (key == 's') {
        ycor = ycor - 2;
      }
      if (key == 'd') {
        xcor = xcor - 2;
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