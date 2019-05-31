class Computer implements Collideable{
  float[] xValues, yValues;
  int mapNum;
  
  Computer(int map) {
    mapNum = map;
  }
  
  boolean isTouching(Object b) {
    return true;
  }
}