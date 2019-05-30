class Computer extends Kart {
  float[] xValues, yValues;
  int mapNum;
  
  Computer(int map) {
    super(60, 80, 0, 0, 0, 0, "Computer1");
    mapNum = map;
  }
  
  void draw() {
    fill(0,0,0);
    rect(-5, -5, 10, 10);
  }
}
