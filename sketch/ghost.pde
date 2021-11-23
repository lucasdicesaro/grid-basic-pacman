final int GHOST_SIZE = 20;

class Ghost extends Creature {

  int targetX;
  int targetY;
  boolean insideHouse;
  Ghost (int x, int y, int type, String name, color c) {  
    super(x, y, type, name, c);
    targetX = 0;
    targetY = 0;
    insideHouse = true;
  }
  
  void drawYourSelf() {
    super.drawYourSelf();
    fill(c);
    square(x * INTERSPACE, y * INTERSPACE, GHOST_SIZE);
    //drawTarget();
  }

  void drawTarget() {
    fill(c, 127);
    square(targetX * INTERSPACE, targetY * INTERSPACE, GHOST_SIZE);
  }
  
  void processMovement(TileGrid tileGrid) {
    
    if (insideHouse && hasToGoOutFromHouse()) {
      goOutFromHouse();
      insideHouse = false;
    }

    setTarget();

    selectedMovement = getCalculatedMovement(selectedMovement);
    
    if (selectedMovement == LEFT && tileGrid.isNotWallOnCreatureLeft(this)) {
      moveLeft();
    } else if (selectedMovement == RIGHT && tileGrid.isNotWallOnCreatureRight(this)) {
      moveRight();
    } else if (selectedMovement == UP && tileGrid.isNotWallOnCreatureUp(this)) {
      moveUp();
    } else if (selectedMovement == DOWN && tileGrid.isNotWallOnCreatureDown(this)) {
      moveDown();
    } 
  }

  int getCalculatedMovement(int selectedMovement) {

    int min = 99999;
    int newMovement = -1;
    if (selectedMovement != DOWN && tileGrid.isNotWallOnCreatureUp(this)) {
      if (min > dist(x, y-1, targetX, targetY)) {
        min = (int) dist(x, y-1, targetX, targetY);
        newMovement = UP;
      }
    }
    if (selectedMovement != RIGHT && tileGrid.isNotWallOnCreatureLeft(this)) {
      if (min > dist(x-1, y, targetX, targetY)) {
        min = (int) dist(x-1, y, targetX, targetY);
        newMovement = LEFT;
      }
    }
    if (selectedMovement != UP && tileGrid.isNotWallOnCreatureDown(this)) {
      if (min > dist(x, y+1, targetX, targetY)) {
        min = (int) dist(x, y+1, targetX, targetY);
        newMovement = DOWN;
      }
    }
    if (selectedMovement != LEFT && tileGrid.isNotWallOnCreatureRight(this)) {
      if (min > dist(x+1, y, targetX, targetY)) {
        min = (int) dist(x+1, y, targetX, targetY);
        newMovement = RIGHT;
      }
    }

    return newMovement;
  }

  void setTarget() {
  }

  boolean hasToGoOutFromHouse() {
    return false;
  }

  void goOutFromHouse() {
    x = 14;
    y = 14;
    selectedMovement = LEFT;
  }
} 
