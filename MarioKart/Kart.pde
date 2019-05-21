class Kart {
  float x;
  float y;
  int score;
  float speed;
  float direction;
  int fuel;
  int health;
  
  Kart(float X, float Y) {
    x = X;
    y = Y;
    score = 0;
    speed = 1.0;
    direction = 0.0;
    fuel = 100;
    health = 100;
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  float getSpeed() {
    return speed;
  }
  
  float getDirection() {
    return direction;
  }
  
  int getFuel() {
    return fuel;
  }
  
  int getHealth() {
    return health;
  }
  
  boolean isOnRoad() {
    return true;
  }
  
  void display() {
    rect(x, y, 23, 23);
  }
}
