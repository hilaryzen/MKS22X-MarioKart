class Kart {
  float x;
  float y;
  Kart(float X, float Y) {
    x = X;
    y = Y;
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  void display() {
    rect(x, y, 23, 23);
  }
}