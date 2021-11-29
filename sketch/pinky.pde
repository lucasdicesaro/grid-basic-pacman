final int PINKY_TYPE = 4;
final int PINKY_SCATTER_X = 2;
final int PINKY_SCATTER_Y = 0;

class Pinky extends Ghost {
  Pinky (int x, int y) {  
    super(x, y, PINKY_TYPE, "Pinky", color(255, 184, 255)); 
  }

  void calculateChaseTarget() {
    targetX = creatures[0].getX();
    targetY = creatures[0].getY();
    switch(creatures[0].getSelectedMovement()){
      case UP:
        targetY = creatures[0].getY() - 4;
        targetX = creatures[0].getX() - 4; // Intentional bug
      break;
      case LEFT:
        targetX = creatures[0].getX() - 4;
        break;
      case DOWN:
        targetY = creatures[0].getY() + 4;
        break;
      case RIGHT:
        targetX = creatures[0].getX() + 4;
        break;
    }
  }

  void calculateScatterTarget() {
    targetX = PINKY_SCATTER_X;
    targetY = PINKY_SCATTER_Y;
  }

  void calculateFrightenedTarget() {
  }

  boolean hasToGoOutFromHouse() {
    return true;
  }
} 
