final int INKY_TYPE = 5;
final int INKY_SCATTER_X = 27;
final int INKY_SCATTER_Y = 34;

class Inky extends Ghost {
  Inky (int x, int y) {  
    super(x, y, INKY_TYPE, "Inky", color(0, 255, 255)); 
  }

  void calculateChaseTarget() {
    int pacmanX = creatures[0].getX();
    int pacmanY = creatures[0].getY();
    switch(creatures[0].getSelectedMovement()){
      case UP:
        pacmanY = creatures[0].getY() - 2;
        pacmanX = creatures[0].getX() - 2; // Intentional bug
      break;
      case LEFT:
        pacmanX = creatures[0].getX() - 2;
        break;
      case DOWN:
        pacmanY = creatures[0].getY() + 2;
        break;
      case RIGHT:
        pacmanX = creatures[0].getX() + 2;
        break;
    }

    // Double of distance between Blinky and projected pacman (pacman + 2).
    int distX = abs(pacmanX - creatures[1].getX()) * 2;
    int distY = abs(pacmanY - creatures[1].getY()) * 2;
    if (pacmanX < creatures[1].getX()) {
      // Pacman is on the LEFT of Blinky
      targetX = creatures[1].getX() - distX;
    } else if (pacmanX > creatures[1].getX()) {
      // Pacman is on the RIGHT of Blinky
      targetX = creatures[1].getX() + distX;
    }

    if (pacmanY < creatures[1].getY()) {
      // Pacman is on top (UP) of Blinky
      targetY = creatures[1].getY() - distY;
    } else if (pacmanY > creatures[1].getY()) {
      // Pacman is under (DOWN) Blinky
      targetY = creatures[1].getY() + distY;
    }
  }

  void calculateScatterTarget() {
    targetX = INKY_SCATTER_X;
    targetY = INKY_SCATTER_Y;
  }

  boolean hasToGoOutFromHouse() {
    return globalGame.getPelletCounter() > 30;
  }
}
