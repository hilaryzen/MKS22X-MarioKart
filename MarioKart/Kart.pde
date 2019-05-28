class Kart {
  float x;
  float y;
  float speed;
  float direction;
  int fuel;
  int health;
  float angle = 0;
  int score;
  int red, green, blue, shape;
  String name;
  int endingTime;
  boolean racing;
  
  Kart(float X, float Y, int r, int g, int b, int s, String n) {
    x = X - 5;
    y = Y;
    speed = 1;
    direction = 0.0;
    fuel = 100;
    health = 100;
    score = 0;
    red = r;
    green = g;
    blue = b;
    shape = s;
    name = n;
    racing = false;
  }
  void setColor(int r, int g, int b) {
    red = r;
    green = g;
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
  
  void setSpeed(float s) {
    speed = s;
  }
  
  float getDirection() {
    return direction;
  }
  
  void setDirection(int d) {
    direction = d;
  }
  
  int getFuel() {
    return fuel;
  }
  
  int getHealth() {
    return health;
  }
  
  int getScore() {
    return score;
  }
  
  int getEndTime() {
    return endingTime;
  }
  
  void setScore(int change) {
    score = score + change;
  }
  
  void setEndTime() {
    endingTime = millis();
  }
  
  void start() {
    racing = true;
  }
  
  void finish() {
    racing = false;
  }
  
  boolean isOnRoad(int c) {
    //Doesn't work because of image shifting?
    //Road: R = 244, G = 217, B = 149
    //Water: R = 125, G = 242, B = 249
    //Light green: R = 69, G = 181, B = 58
    //Dark green: R = 0, G = 145, B = 1
    //color c = get((int)55,(int)55);
    println("Red: " + red(c));
    println("Green: " + green(c));
    println("Blue: " + blue(c));
    if (red(c) < 220) {
      return false;
    } else if (green(c) < 200 || green(c) > 230) {
      return false;
    } else if (blue(c) < 135 || blue(c) > 160) {
      return false;
    }
    return true;
  }
  
  void draw() {
    //println(isOnRoad());
    //rect(x- 15, y- 15, 10, 10);
    //scale(7);
    pushMatrix();
    translate(55, 55);
    rotate(radians(360)-radians(direction));
    strokeWeight(1);
    fill(red, green, blue);
    rect(0, 0, 10, 10);
    popMatrix();
    //rect(x - 15, y - 15, 10, 10);
  }
  
  void display() {
    pushMatrix();
    translate(600, 400);
    rotate(radians(360)-radians(angle));
    fill(red, green, blue);
    rect(-40, -40, 80, 80);
    popMatrix();
    angle+= 0.5;
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

/*
class Player extends Kart {
  int score;
  
  Player(int X, int Y) {
    super(X, Y, 0, 0, 0, 0, "hey");
    score = 0;
  }
  
  int getScore() {
    return score;
  }
}
*/
