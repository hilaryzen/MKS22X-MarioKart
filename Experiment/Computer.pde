class Computer{
  ArrayList<Float> directionValues;
  int mapNum;
  int mapX, mapY;
  float direction;
  float rightBound;
  float leftBound;
  
  Computer(int map) {
    direction = 90.0;
    mapNum = map;
    directionValues = new ArrayList<Float>();
    mapX = 660;
    mapY = 150;
  }
  
  void draw() {
    move();
    fill(0,0,0);
    rect(mapX, mapY, 10, 10);
  }
  
  void randomDirection() {
    directionValues.clear();
    rightBound = convertAngle(direction + 45.0);
    leftBound = convertAngle(direction - 45.0);
    //println(rightBound + " " + leftBound);
    if (rightBound < leftBound) {
      rightBound += 360.0;
    }
    for (float angle = rightBound; angle >= leftBound; angle -= 5.0) {
      //println(angle);
      int newX = (int) (mapX - 5 * cos(radians(angle)));
      int newY = (int) (mapY - 5 * sin(radians(angle)));
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
      direction += 10.0;
      //println("Can't find road");
    } else {
      int index = (int) (Math.random() * directionValues.size());
      direction = directionValues.get(index);
      println("Direction: " + direction);
    }
  }
  
  void randomDirection2() {
    for (float i = 0.0; i < 90.0; i += 5.0) {
      int newX = (int) (mapX - 5 * cos(radians(direction + i)));
      int newY = (int) (mapY - 5 * sin(radians(direction + i)));
      int c = get(newX, newY);
      if (isOnRoad(c)) {
        direction += i;
        i = 100;
      } 
      newX = (int) (mapX - 5 * cos(radians(direction - i)));
      newY = (int) (mapY - 5 * sin(radians(direction - i)));
      c = get(newX, newY);
      if (isOnRoad(c)) {
        direction -= i;
        i = 100;
      } 
    }
    println(direction);
    convertAngle(direction);
  }
  
  float convertAngle(float angle) {
    if (angle >= 0 && angle < 360.0) {
      return angle;
    } else if (angle >= 360) {
      return angle % 360.0;
    } else if (angle < 0) {
      return angle + 360.0;
    } else {
      return angle;
    }
  }
  
  void move() {
    randomDirection2();
    /*
    if (direction >= 0) {
      //x += (1/4) * sin(radians(direction));
      //y += (1/4) * cos(radians(direction));
      mapX += (2) * cos(radians(direction));
      mapY += (2) * sin(radians(direction));
    } else {
      //x += (1/4) * sin(radians(direction));
      //y += (1/4) * cos(radians(direction));
      mapX += (2) * cos(radians(direction));
      mapY += (2) * sin(radians(direction));
    }
    */
    mapX += (2) * cos(radians(direction));
    mapY -= (2) * sin(radians(direction));
  }
}
