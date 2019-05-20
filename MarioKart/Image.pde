class Image {
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
    xcor = xcor + 10;
  }
  
}