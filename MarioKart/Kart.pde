class Kart implements Displayable{
  int x;
  int y;
  float speed;
  float direction;
  int fuel;
  int health;
  
  Kart(int X, int Y) {
    x = X;
    y = Y;
    speed = 1.0;
    direction = 0.0;
    fuel = 100;
    health = 100;
  }
  
  int getX() {
    return x;
  }
  
  int getY() {
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
    color c = get(x,y);
    //println(green(c));
    return (green(c) == 209 || green(c) == 146);
    /*
    println(green(c)); //Returned 470896 on brown and 181 on green
    return c;
    */
  }
  
  void display() {
    //println(isOnRoad());
    rect(x - 15, y - 15, 30, 30);
  }
}

class Player extends Kart {
  int score;
  
  Player(int X, int Y) {
    super(X, Y);
    score = 0;
  }
  
  int getScore() {
    return score;
  }
}
