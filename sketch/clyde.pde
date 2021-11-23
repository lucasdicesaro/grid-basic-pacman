final int CLYDE_TYPE = 6;

class Clyde extends Ghost {
  Clyde (int x, int y) {  
    super(x, y, CLYDE_TYPE, "Clyde", color(255, 184, 82)); 
  }

  void setTarget() {
    int distanceBetweenClydeAndPacman = (int) dist(x, y, creatures[0].getX(), creatures[0].getY());

    if (distanceBetweenClydeAndPacman > 8) {
      targetX = creatures[0].getX();
      targetY = creatures[0].getY();
    } else {
      // Clyde scatter target
      targetX = 0;
      targetY = 35;
    }
  }

  boolean hasToGoOutFromHouse() {
    return pelletCounter > 60;
  }
}
