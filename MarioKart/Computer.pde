class Computer extends Kart {
  ArrayList<Float> directionValues;
  int mapNum;
  int mapX, mapY;
  Player p;
  float rightBound;
  float leftBound;
  
  Computer(int map, Player user) {
    super(80, 60, 0, 0, 0, 0, "Computer1");
    mapNum = map;
    p = user;
    directionValues = new ArrayList<Float>();
    mapX = 660;
    mapY = 150;
  }
  
  void draw() {
    fill(0,0,0);
    rect(x, y, 10, 10);
  }
  
  void randomDirection() {
    directionValues.clear();
    rightBound = convertAngle(getDirection() + 45.0);
    leftBound = convertAngle(getDirection() - 45.0);
    if (rightBound < leftBound) {
      rightBound += 360.0;
    }
    for (float angle = rightBound; angle >= leftBound; angle -= 5.0) {
      //println(angle);
      int newX = (int) (mapX - 10 * sin(radians(angle)));
      int newY = (int) (mapY - 10 * cos(radians(angle)));
      println("X: " + newX + "  Y: " + newY);
      int c = get(newX, newY);
      //println(c);
      //println(isOnRoad(c));
      if (isOnRoad(c)) {
        directionValues.add((float) angle);
        //println(directionValues);
        //println(angle);
      }
    }
    int index = (int) (Math.random() * directionValues.size());
    setDirection(directionValues.get(index));
    println("Angle: " + directionValues.get(index));
  }
  
  void move() {
    if (getDirection() >= 0) {
      x += (speed/4) * sin(radians(90 - getDirection()));
      y += (speed/4) * cos(radians(90 - getDirection()));
    } else {
      x += (speed/4) * sin(radians(90 - getDirection()));
      y += (speed/4) * cos(radians(90 - getDirection()));
    }
  }
}
