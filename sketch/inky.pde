final int INKY_TYPE = 5;

class Inky extends Ghost {
  Inky (int x, int y) {  
    super(x, y, INKY_TYPE, "Inky", color(0, 255, 255)); 
  }

  void setTarget() {
    targetX = creatures[0].getX();
    targetY = creatures[0].getY();
    switch(creatures[0].getSelectedMovement()){
      case UP:
        targetY = creatures[0].getY() - 2;
        targetX = creatures[0].getX() - 2; // Intentional bug
      break;
      case LEFT:
        targetX = creatures[0].getX() - 2;
        break;
      case DOWN:
        targetY = creatures[0].getY() + 2;
        break;
      case RIGHT:
        targetX = creatures[0].getX() + 2;
        break;
    }
    // TODO: Calculate vector from Blinky to resultant (targetX, targetY), and double that result. That will be Inky´s target
  }
}
