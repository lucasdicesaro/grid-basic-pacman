
class Ghost extends Creature {

  int targetX;
  int targetY;
  boolean insideHouse;
  boolean scheduleReverseDirection;
  color frightenedColor = color(33, 33, 222);
  Ghost (int x, int y, int type, String name, color c) {  
    super(x, y, type, name, c);
    targetX = 0;
    targetY = 0;
    insideHouse = true;
    scheduleReverseDirection = false;
  }
  
  void drawYourSelf() {
    super.drawYourSelf();
    noStroke();
    fill(currentMode != FRIGHTENED ? c : frightenedColor);
    square(x * INTERSPACE, y * INTERSPACE, GHOST_SIZE);
    drawTarget();
  }

  void drawTarget() {
    stroke(c);
    noFill();
    square(targetX * INTERSPACE, targetY * INTERSPACE, GHOST_SIZE);
    stroke(0);
  }
  
  void processMovement(TileGrid tileGrid) {
    
    if (insideHouse && hasToGoOutFromHouse()) {
      goOutFromHouse();
      insideHouse = false;
    }

    checkIfShouldReverseDirection();

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

  void checkIfShouldReverseDirection() {
    if (scheduleReverseDirection) {
      reverseDirection();
      scheduleReverseDirection = false;
    }
  }

  void reverseDirection() {
    switch(selectedMovement) {
      case UP:
        selectedMovement = DOWN;
        break;
      case DOWN:
        selectedMovement = UP;
        break;
      case LEFT:
        selectedMovement = RIGHT;
        break;
      case RIGHT:
        selectedMovement = LEFT;
        break;
    }
  }

  void setTarget() {
    if (currentMode == CHASE) {
      calculateChaseTarget();
    } else if (currentMode == SCATTER) {
      calculateScatterTarget();
    } else if (currentMode == FRIGHTENED) {
      calculateFrightenedTarget();
    }
  }

  void calculateChaseTarget() {
  }

  void calculateScatterTarget() {
  }

  void calculateFrightenedTarget() {
  }

  boolean hasToGoOutFromHouse() {
    return false;
  }

  void goOutFromHouse() {
    previousX = x;
    previousY = y;
    x = 14;
    y = 14;
    selectedMovement = LEFT;
  }

  void scheduleReverseDirection() {
    scheduleReverseDirection = true;
  }
} 
