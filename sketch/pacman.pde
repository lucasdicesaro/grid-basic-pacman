final int PACMAN_SIZE = 20;
final int PACMAN_TYPE = 2;

class Pacman extends Creature { 

  Pacman (int x, int y) {
    super(x, y, PACMAN_TYPE, "Pacman", color(255, 204, 0)); 
  }
  
  void drawYourSelf() {
    super.drawYourSelf();
    fill(c);
    circle((x * INTERSPACE) + (PACMAN_SIZE / 2), (y * INTERSPACE) + (PACMAN_SIZE / 2), PACMAN_SIZE);
  }
  
  void processMovement(TileGrid tileGrid) {
    if (key == CODED) {
      if (isValidMovement()) {
        if (keyCode == LEFT && tileGrid.isNotWallOnCreatureLeft(this)) {
          moveLeft();
        } else if (keyCode == RIGHT && tileGrid.isNotWallOnCreatureRight(this)) {
          moveRight();
        } else if (keyCode == UP && tileGrid.isNotWallOnCreatureUp(this)) {
          moveUp();
        } else if (keyCode == DOWN && tileGrid.isNotWallOnCreatureDown(this)) {
          moveDown();
        }
      }   
    }
  }
} 
