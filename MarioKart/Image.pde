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
    //xcor = xcor + 10;
    //keyPressed();
  }
  void draw() {
    
  }
  
  void keyPressed() {
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