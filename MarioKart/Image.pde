class Image implements Displayable, Moveable{
  float xcor;
  float ycor;
  float angle = 0;
  float speed;
  
  Image(float x, float y, float sp){
    xcor = x;
    ycor = y;
    speed = sp;
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
