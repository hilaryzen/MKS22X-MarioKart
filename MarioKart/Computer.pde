class Computer extends Kart {
  float[] xValues, yValues;
  int mapNum;
  Player p;
  
  Computer(int map, Player user) {
    super(60, 80, 0, 0, 0, 0, "Computer1");
    mapNum = map;
    p = user;
  }
  
  void draw() {
    fill(0,0,0);
    rect(-5, -5, 10, 10);
  }
}
