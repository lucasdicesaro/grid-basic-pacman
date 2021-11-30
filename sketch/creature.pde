
class Creature { 

  int x;
  int y;
  int previousX;
  int previousY;
  int type;
  String name;
  color c;
  int selectedMovement;

  Creature (int x, int y, int type, String name, color c) {  
    this.x = x;
    this.y = y;
    this.previousX = x;
    this.previousY = y;
    this.type = type;
    this.name = name;
    this.c = c;
  } 

  void moveLeft() {
    setPreviousPosition();
    x--;
  } 

  void moveRight() {
    setPreviousPosition();
    x++;
  } 

  void moveUp() {
    setPreviousPosition();
    y--;
  } 

  void moveDown() {
    setPreviousPosition();
    y++;
  }

  void setPreviousPosition() {
    previousX = x;
    previousY = y;
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }

  int getType() {
    return type;
  }

  int getPreviousX() {
    return previousX;
  }

  int getPreviousY() {
    return previousY;
  }

  int getSelectedMovement() {
    return selectedMovement;
  }

  void processMovement() {
  }

  void drawYourSelf() {
    cleanPreviousPosition();
  }

  void cleanPreviousPosition() {
    if (tileGrid.isPellet(previousX, previousY)) {
      drawPelletCell(previousX, previousY);
    } else if (tileGrid.isPowerPellet(previousX, previousY)) {
      drawPowerPelletCell(previousX, previousY);
    } else {
      drawCorridorCell(previousX, previousY);
    }
  }

  void debug() {
    println(name + " - Previous X,Y: " + previousX + "," + previousY + " Current X,Y: " + x + "," + y);
  }
} 
