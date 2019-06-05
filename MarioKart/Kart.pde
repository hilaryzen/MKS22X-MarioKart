class Kart implements Collideable, Displayable {
  float x, mapX, miniX;
  float y, mapY, miniY;
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
  boolean bottom = false;
  int place; 
  
  Kart(float X, float Y, int r, int g, int b, int s, String n) {
    x = X - 5;
    y = Y;
    speed = 1.3;
    direction = 90.0;
    fuel = 100;
    health = 100;
    score = 0;
    red = r;
    green = g;
    blue = b;
    shape = s;
    name = n;
    racing = false;
    mapX = 665.0;
    mapY = 150.0;
    miniX = 108.7;
    miniY = 7;
  }
  
  void setColor(int r, int g, int b) {
    red = r;
    green = g;
    blue = b;
  }
  
  String getName() {
    return name;
  }
  
  void setN(String n) {
    name = n;
  }
  
  int getS() {
    return shape;
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
  
  float getMapX() {
    return mapX;
  }
  
  float getMapY() {
    return mapY;
  }
  
  void setMapX(float newMap) {
    mapX = newMap;
  }
  
  void setMapY(float newMap) {
    mapY = newMap;
  }
  
  float getMiniX() {
    return miniX;
  }
  
  float getMiniY() {
    return miniY;
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
  
  void setDirection(float d) {
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
  
  int getPlace() {
    return place;
  }
  
  void setScore(int change) {
    score = score + change;
  }
  
  void setEndTime() {
    //println("setEndTime called");
    endingTime = millis();
  }
  
  void start() {
    racing = true;
  }
  
  void finish(int placeNum) {
    place = placeNum + 1;
    racing = false;
  }
  
  boolean isRacing() {
    return racing;
  }
  
  boolean isOnRoad(int c) {
    //Doesn't work because of image shifting?
    //Road: R = 244, G = 217, B = 149
    //Water: R = 125, G = 242, B = 249
    //Light green: R = 69, G = 181, B = 58
    //Dark green: R = 0, G = 145, B = 1
    //Bridge: R = 184, G = 132, B = 21
    
    //color c = get((int)55,(int)55);
    /*
    println("Red: " + red(c));
    println("Green: " + green(c));
    println("Blue: " + blue(c));
    */
    
    /*
    if (red(c) < 220) {
      return false;
    } else if (green(c) < 200 || green(c) > 230) {
      return false;
    } else if (blue(c) < 135 || blue(c) > 160) {
      return false;
    }
    return true;
    */
    
    //Includes the bridges
    if (red(c) > 230 && red(c) < 250 && green(c) > 200 && green(c) < 230 && blue(c) > 135 && blue(c) < 160) {
      return true;
    } 
    if (red(c) > 160 && red(c) < 195 && green(c) > 110 && green(c) < 150 && blue(c) > 0 && blue(c) < 30) {
      return true;
    } 
    return false;
  }
  
  boolean isOnWater(int c) {
    if ((red(c) < 200) && (green(c) < 250 && green(c) > 200) && (blue(c) < 250 && blue(c) > 238)) {
      return true;
    }
    return false;
  }
  
  boolean isOnBottom() {
    if ((mapX > 192 && mapX < 279) && (mapY > 510 && mapY < 528)) {
      return true;
    }
    return false;
  }
  
  boolean isOut() {
    if ((mapX > 192 && mapX < 279) && (mapY > 561 && mapY < 569)) {
      return true;
    }
    return false;
  }
  
  void draw() {
    //println(isOnRoad());
    //rect(x- 15, y- 15, 10, 10);
    //scale(7);
    pushMatrix();
    translate(55, 55);
    rotate(radians(360)-radians(direction));
    //println("Kart  mapX: " + mapX + " mapY: " + mapY);
    strokeWeight(0);
    if (bottom == false) {
      fill(red, green, blue);
      if (isOnBottom()) {
        bottom = true;
       }
    }
    else {
      fill(red, green, blue, 0);
      if (isOut()) {
        bottom = false;
        //fill(red, green, blue);
      }
    }
    //tint(255, 127);
      
    if (shape == 0) {
      rect(-2.5, -7, 5, 14);
      image(racecar, -7, -8, 14, 16);
    }
    if (shape == 1) {
      rect(-4, -8, 8, 16);
      image(kart, -7, -8, 14, 16);
    }
    if (shape == 2) {
      rect(-3, -8, 6, 16);
      image(car, -7, -8, 14, 16);
    }
    strokeWeight(1);
    popMatrix();
    //rect(x - 15, y - 15, 10, 10);
  }
  
  void display() {
    pushMatrix();
    translate(600, 400);
    rotate(radians(360)-radians(angle));
    fill(red, green, blue);
    strokeWeight(0);
    if (shape == 0) {
      //rotate(-90);
      rect(-19, -50, 38, 100);
      image(racecar, -45, -60, 90, 120);
    }
    if (shape == 1) {
      rect(-22, -57, 44, 114);
      image(kart, -45, -60, 90, 120);
    }
    if (shape == 2) {
      rect(-20, -57, 40, 114);
      image(car, -45, -60, 90, 120);
    }
    popMatrix();
    angle+= 0.63;
  }
  
  void displayMini() {
    pushMatrix();
    translate(miniX, miniY);
    //rotate(radians(360)-radians(direction));
    strokeWeight(0.5);
    fill(red, green, blue);
    rect(-0.1, -0.1, 0.2, 0.2);
    popMatrix();
  }
  
  void moveBackMini() {
    miniX = miniX + ((speed/(800/21)) * sin(radians(direction)));
    miniY = miniY + ((speed/(800/21)) * cos(radians(direction)));
  }
  
  void moveStraight() {
    miniX = miniX - ((speed/(800/21)) * sin(radians(direction)));
    miniY = miniY - ((speed/(800/21)) * cos(radians(direction)));
  }
  
  void reset() {
    x = 55;
    y = 60;
    speed = 1.3;
    direction = 0.0;
    fuel = 100;
    health = 100;
    score = 0;
    racing = false;
    angle = 0;
    miniX = 108.7;
    miniY = 7;
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
    
    //x = x + (speed/4 * sin(radians(direction+90)));
    //y = y + (speed/4 * cos(radians(direction+90)));
    //mapX += (speed/4 * sin(radians(direction + 90)));
    //mapY += (speed/4 * cos(radians(direction+90)));
    //xcor = xcor + (kart.getSpeed() * sin(radians(kart.getDirection())));
    //ycor = ycor + (kart.getSpeed() * cos(radians(kart.getDirection())));
  }
  
  void turnLeft() {
    direction = direction + 10/ (4+(speed/3));
    //x = x + (speed/4 * sin(radians(direction-90)));
    //y = y + (speed/4 * cos(radians(direction-90)));
    //mapX += (speed/4 * sin(radians(direction - 90)));
    //mapY += (speed/4 * cos(radians(direction-90)));
  }
  
  float convertAngle(float angle) {
    if (angle >= 0 && angle < 360.0) {
      return angle;
    } else if (angle >= 360) {
      return angle % 360.0;
    } else if (angle < 0) {
      return (angle % 360.0) + 360.0;
    } else {
      return angle;
    }
  }
  
  void placeOnMapX(float x) {
    mapX = x;
  }
  
  void placeOnMapY(float y) {
    mapY = y;
  }
  
  boolean isTouching(Obstacle b) {
    if (dist(mapX - 5, mapY - 5, b.getStartX(), b.getStartY()) < 9.6) {
    //if ((abs(mapX - b.getStartX()) < 9.5) && (((mapY - b.getStartY()) < 9.5) || (mapY - b.getStartY()) > -9.5)) {
      return true;
    }
    return false;
  }
 

}
