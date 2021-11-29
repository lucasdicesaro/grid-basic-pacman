final int BLINKY_TYPE = 3;
final int BLINKY_SCATTER_X = 25;
final int BLINKY_SCATTER_Y = 0;

class Blinky extends Ghost {
  Blinky (int x, int y) {  
    super(x, y, BLINKY_TYPE, "Blinky", color(255, 0, 0)); 
    insideHouse = false;
  }

  void calculateChaseTarget() {
    targetX = creatures[0].getX();
    targetY = creatures[0].getY();
  }

  void calculateScatterTarget() {
    targetX = BLINKY_SCATTER_X;
    targetY = BLINKY_SCATTER_Y;
  }

  void calculateFrightenedTarget() {
  }
} 
