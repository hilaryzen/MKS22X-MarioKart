class Computer{
  ArrayList<Float> directionValues;
  int mapNum;
  float mapX, mapY;
  float direction;
  float rightBound;
  float leftBound;
  
  Computer(int map) {
    direction = 90.0;
    mapNum = map;
    directionValues = new ArrayList<Float>();
    mapX = 381.6244; //Original = 670
    mapY = 388.02332; //Original = 150
  }
  
  void draw() {
    move();
    fill(0,0,0);
    println("mapX: " + mapX + " mapY: " + mapY);
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
      int newX = (int) (mapX + 10 * cos(radians(direction + i)));
      int newY = (int) (mapY - 10 * sin(radians(direction + i)));
      int c = get(newX, newY);
      if (isOnRoad(c)) {
        direction += i;
        direction = convertAngle(direction);
        println(direction);
        return;
      } 
      newX = (int) (mapX + 10 * cos(radians(direction - i)));
      newY = (int) (mapY - 10 * sin(radians(direction - i)));
      c = get(newX, newY);
      if (isOnRoad(c)) {
        direction -= i;
        direction = convertAngle(direction);
        println(direction);
        return;
      } 
    }
    println("Direction: " + direction);
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
    //randomDirection2();
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
    mapX += (1) * cos(radians(direction));
    mapY -= (1) * sin(radians(direction));
  }
}
