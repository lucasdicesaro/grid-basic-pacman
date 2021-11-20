
class Creature extends Drawable { 
  
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
  

  void drawYourSelf() {
    super.drawYourSelf();
    cleanPreviousPosition();
  }
  
  void cleanPreviousPosition() {
    drawCorridorCell(previousX, previousY);
  }
  
  void showYourSelf() {
    println(name + " - Previous X,Y: " + previousX + "," + previousY + " Current X,Y: " + x + "," + y);
  }
} 
