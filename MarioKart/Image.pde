class Image implements Displayable, Moveable{
  float xcor;
  float ycor;
  float angle = 0;
  
  Image(float x, float y){
    xcor = x;
    ycor = y;
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
