class Computer extends Kart {
  ArrayList<Float> xValues, yValues;
  int mapNum;
  Player p;
  float rightBound = 45.0;
  float leftBound = 315.0;
  
  Computer(int map, Player user) {
    super(80, 60, 0, 0, 0, 0, "Computer1");
    mapNum = map;
    p = user;
    xValues = new ArrayList<Float>();
    yValues = new ArrayList<Float>();
  }
  
  void draw() {
    fill(0,0,0);
    rect(x, y, 10, 10);
  }
  
  void setDirection() {
    for (float angle = rightBound; angle >= leftBound; angle -= 5.0) {
      int newX = (int) (x + 10 * sin(radians(angle)));
      int newY = (int) (y + 10 * cos(radians(angle)));
      int c = get(newX, newY);
      if (isOnRoad(c)) {
        xValues.add((float) newX);
        yValues.add((float) newY);
      }
    }
  }
}
