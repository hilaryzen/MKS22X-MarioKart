class Kart {
  float x;
  float y;
  int speed;
  float direction;
  int fuel;
  int health;
  float angle = 0;
  int red, green, blue, shape;
  String name;
  
  Kart(float X, float Y, int r, int g, int b, int s, String n) {
    x = X - 5;
    y = Y;
    speed = 1;
    direction = 0.0;
    fuel = 100;
    health = 100;
    red = r;
    green = g;
    blue = b;
    shape = s;
    name = n;
  }
  void setR(int r) {
    red = r;
  }
  void setG(int g) {
    green = g;
  }
  void setB(int b) {
    blue = b;
  }
  void setN(String n) {
    name = n;
  }
  void setS(int s) {
    shape = s;
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
    color c = get((int)x,(int)y);
    //println(green(c));
    return (green(c) == 209 || green(c) == 146);
    /*
    println(green(c)); //Returned 470896 on brown and 181 on green
    return c;
    */
  }
  
  public void draw() {
    //println(isOnRoad());
    //rect(x- 15, y- 15, 10, 10);
    //scale(7);
    pushMatrix();
    translate(55, 55);
    rotate(radians(360)-radians(direction));
    rect(0, 0, 10, 10);
    popMatrix();
    //rect(x - 15, y - 15, 10, 10);
  }
  
  /*void move() {
    if (keyPressed()) {
      if (key == 'w') {
        y = y + speed;
      }
      if (key == 'a') {
        x = x + speed;
      }
      if (key == 's') {
        y = y - speed;
      }
      if (key == 'd') {
        x = x - speed;
      }
      if (key == 'r') {
        angle += 0.006;
      }
      if (key == 't') {
        angle -= 0.006;
      }
    }
    
  }*/

  
  
  void turnRight() {
    direction = direction - 10/ (4+(speed/3));
    x = x + (speed/4 * sin(radians(direction+90)));
    y = y + (speed/4 * cos(radians(direction+90)));
  }
  
  void turnLeft() {
    direction = direction + 10/ (4+(speed/3));
    x = x + (speed/4 * sin(radians(direction-90)));
    y = y + (speed/4 * cos(radians(direction-90)));
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
