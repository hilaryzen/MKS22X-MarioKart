class Computer extends Kart{
  float[] xValues, yValues;
  int mapNum;
  float mapX, mapY;
  Player p;
  float rightBound;
  float leftBound;
  
  Computer(int map, Player user) {
    super(65, 60, 0, 0, 0, 0, "Computer1");
    mapNum = map;
    p = user;
    mapX = 670.0;
    mapY = 150.0;
    direction = 90.0;
    speed = 1.3;
  }
  
  void draw() {
    //rotate(radians(360)-radians(direction));
    x = p.getX() + (mapX - p.getMapX());
    y = p.getY() + (mapY - p.getMapY());
    fill(red, green, blue);
    rect(x, y, 10, 10);
  }
  
  void randomDirection() {
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
        //directionValues.add((float) angle);
        //println(directionValues);
        //println(angle);
      }
    }
    /*
    if (directionValues.size() == 0) {
      direction += 20.0;
      //println("Can't find road");
    } else {
      int index = (int) (Math.random() * directionValues.size());
      setDirection(directionValues.get(index));
      //println("Direction: " + getDirection());
    }
    */
  }
  
  void randomDirection2() {
    //println("randomDirection called");
    for (float i = 0.0; i < 180.0; i += 5.0) {
      int newX = (int) (mapX + 10 * cos(radians(getDirection() + i)));
      int newY = (int) (mapY - 10 * sin(radians(getDirection() + i)));
      int c = get(newX, newY);
      //println("Direction: " + getDirection() + " " + isOnRoad(c));
      if (isOnRoad(c)) {
        setDirection(convertAngle(getDirection() + i));
        //println("Direction: " + direction);
        return;
      } 
      newX = (int) (mapX + 10 * cos(radians(getDirection() - i)));
      newY = (int) (mapY - 10 * sin(radians(getDirection() - i)));
      c = get(newX, newY);
      if (isOnRoad(c)) {
        setDirection(convertAngle(getDirection() - i));
        //println("Direction: " + direction);
        return;
      } 
    }
  }
  
  void path() {
    if (mapX == 670 && mapY == 90) {
      direction = 150;
    } else if ((int) mapX == 636 && (int) mapY == 70) {
      direction = 180;
    } else if ((int) mapX == 570 && (int) mapY == 70) {
      direction = 225;
    } else if ((int) mapX == 528 && (int) mapY == 112) {
      direction = 240;
    } else if ((int) mapX == 480 && (int) mapY == 196) {
      direction = 200;
    } else if ((int) mapX == 399 && (int) mapY == 225) {
      direction = 135;
    } else if ((int) mapX == 233 && (int) mapY == 60) {
      direction = 180;
    } else if ((int) mapX == 171 && (int) mapY == 60) {
      direction = 225;
    } else if ((int) mapX == 138 && (int) mapY == 93) {
      direction = 270;
    } else if ((int) mapX == 138 && (int) mapY == 141) {
      direction = 315;
    } else if ((int) mapX == 237 && (int) mapY == 240) {
      direction = 270;
    } else if ((int) mapX == 237 && (int) mapY == 619) {
      direction = 225;
    } else if ((int) mapX == 204 && (int) mapY == 652) {
      direction = 180;
    } else if ((int) mapX == 138 && (int) mapY == 652) {
      direction = 135;
    } else if ((int) mapX == 113 && (int) mapY == 627) {
      direction = 90;
    } else if ((int) mapX == 113 && (int) mapY == 569) {
      direction = 45;
    } else if ((int) mapX == 152 && (int) mapY == 530) {
      direction = 0;
    } else if ((int) mapX == 353 && (int) mapY == 530) {
      direction = 315;
    } else if ((int) mapX == 388 && (int) mapY == 565) {
      direction = 0;
    } else if ((int) mapX == 419 && (int) mapY == 565) {
      direction = 315;
    } else if ((int) mapX == 604 && (int) mapY == 750) {
      direction = 45;
    } else if ((int) mapX == 728 && (int) mapY == 626) {
      direction = 90;
    } else if ((int) mapX == 728 && (int) mapY == 601) {
      direction = 180;
    } else if ((int) mapX == 593 && (int) mapY == 601) {
      direction = 135;
    } else if ((int) mapX == 458 && (int) mapY == 467) {
      direction = 150;
    } else if ((int) mapX == 381 && (int) mapY == 423) {
      direction = 90;
    } else if ((int) mapX == 381 && (int) mapY == 388) {
      direction = 30;
    } else if ((int) mapX == 502 && (int) mapY == 318) {
      direction = 330;
    } else if ((int) mapX == 669 && (int) mapY == 415) {
      direction = 90;
    }
  }
  
  void move() {
    path();
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
    //x += (speed) * sin(radians(getDirection()));
    //y -= (speed) * cos(radians(getDirection()));
    //println("X: " + x + " Y: " + y);
    mapX += (1) * cos(radians(getDirection()));
    mapY -= (1) * sin(radians(getDirection()));
    println("Direction: " + direction);
    println("mapX: " + mapX + " mapY: " + mapY);
  }
  
  void reset() {
    mapX = 670.0;
    mapY = 150.0;
    speed = 1.3;
    direction = 90.0;
  }
  
}
