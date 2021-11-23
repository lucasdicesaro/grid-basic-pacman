
class Creature extends Drawable { 
  
  int selectedMovement;
  int previousX;
  int previousY;
  
  Creature (int x, int y, int type, String name, color c) {  
    super(x, y, type, name, c);
    previousX = x;
    previousY = y;
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
 
  int getPreviousX() {
    return previousX;
  }

  int getPreviousY() {
    return previousY;
  }

  int getSelectedMovement() {
    return selectedMovement;
  }
  
  void processMovement(TileGrid tileGrid) {
  }

  void drawYourSelf() {
    super.drawYourSelf();
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
