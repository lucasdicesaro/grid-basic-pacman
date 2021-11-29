final int CLYDE_TYPE = 6;
final int CLYDE_SCATTER_X = 0;
final int CLYDE_SCATTER_Y = 34;

class Clyde extends Ghost {
  Clyde (int x, int y) {  
    super(x, y, CLYDE_TYPE, "Clyde", color(255, 184, 82)); 
  }

  void calculateChaseTarget() {
    int distanceBetweenClydeAndPacman = (int) dist(x, y, creatures[0].getX(), creatures[0].getY());

    if (distanceBetweenClydeAndPacman > 8) {
      targetX = creatures[0].getX();
      targetY = creatures[0].getY();
    } else {
      // Clyde scatter target
      targetX = CLYDE_SCATTER_X;
      targetY = CLYDE_SCATTER_Y;
    }
  }

  void calculateScatterTarget() {
    targetX = CLYDE_SCATTER_X;
    targetY = CLYDE_SCATTER_Y;
  }

  void calculateFrightenedTarget() {
  }

  boolean hasToGoOutFromHouse() {
    return pelletCounter > 60;
  }
}
