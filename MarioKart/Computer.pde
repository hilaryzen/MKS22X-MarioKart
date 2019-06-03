class Computer extends Kart {
  ArrayList<Float> directionValues;
  int mapNum;
  int mapX, mapY;
  Player p;
  float rightBound;
  float leftBound;
  
  Computer(int map, Player user) {
    super(70, 60, 0, 0, 0, 0, "Computer1");
    mapNum = map;
    p = user;
    directionValues = new ArrayList<Float>();
    mapX = 660;
    mapY = 150;
  }
  
  void draw() {
    fill(red, green, blue);
    rect(x, y, 10, 10);
  }
  
  void randomDirection() {
    directionValues.clear();
    rightBound = convertAngle(getDirection() + 90.0);
    leftBound = convertAngle(getDirection() - 90.0);
    //println(rightBound + " " + leftBound);
    if (rightBound < leftBound) {
      rightBound += 360.0;
    }
    for (float angle = rightBound; angle >= leftBound; angle -= 5.0) {
      //println(angle);
      int newX = (int) (mapX - 5 * sin(radians(angle)));
      int newY = (int) (mapY - 5 * cos(radians(angle)));
      //println("X: " + newX + "  Y: " + newY);
      int c = get(newX, newY);
      //println(c);
      //println(isOnRoad(c));
      if (isOnRoad(c)) {
        directionValues.add((float) angle);
        //println(directionValues);
        //println(angle);
      }
    }
    if (directionValues.size() == 0) {
      direction += 20.0;
      //println("Can't find road");
    } else {
      int index = (int) (Math.random() * directionValues.size());
      setDirection(directionValues.get(index));
      //println("Direction: " + getDirection());
    }
  }
  
  void randomDirection2() {
    for (float i = 0.0; i < 180.0; i += 5.0) {
      int newX = (int) (mapX + 5 * cos(radians(direction + i)));
      int newY = (int) (mapY - 5 * sin(radians(direction + i)));
      int c = get(newX, newY);
      if (isOnRoad(c)) {
        direction += i;
        direction = convertAngle(direction);
        println(direction);
        return;
      } 
      newX = (int) (mapX + 5 * cos(radians(direction - i)));
      newY = (int) (mapY - 5 * sin(radians(direction - i)));
      c = get(newX, newY);
      if (isOnRoad(c)) {
        direction -= i;
        direction = convertAngle(direction);
        println(direction);
        return;
      } 
    }
  }
  
  void move() {
    /*
    if (getDirection() >= 0) {
      x += (speed/4) * sin(radians(getDirection()));
      y += (speed/4) * cos(radians(getDirection()));
      mapX += (speed/28) * sin(radians(getDirection()));
      mapY += (speed/28) * cos(radians(getDirection()));
    } else {
      x += (speed/4) * sin(radians(getDirection()));
      y += (speed/4) * cos(radians(getDirection()));
      mapX += (speed/28) * sin(radians(getDirection()));
      mapY += (speed/28) * cos(radians(getDirection()));
    }
    */
    //x += (speed / 4) * cos(radians(direction));
    //y -= (speed / 4) * sin(radians(direction));
    mapX += (speed / 28) * cos(radians(direction));
    mapY -= (speed / 28) * sin(radians(direction));
  }
}
