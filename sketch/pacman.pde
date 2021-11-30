final int PACMAN_TYPE = 2;

class Pacman extends Creature { 

  Pacman (int x, int y) {
    super(x, y, PACMAN_TYPE, "Pacman", color(255, 204, 0));
    selectedMovement = LEFT;
  }
  
  void drawYourSelf() {
    super.drawYourSelf();
    fill(c);
    circle((x * INTERSPACE) + (PACMAN_SIZE / 2), (y * INTERSPACE) + (PACMAN_SIZE / 2), PACMAN_SIZE);
  }
  
  void processMovement() {
    if (selectedMovement == LEFT && tileGrid.isNotWallOnCreatureLeft(this)) {
      moveLeft();
    } else if (selectedMovement == RIGHT && tileGrid.isNotWallOnCreatureRight(this)) {
      moveRight();
    } else if (selectedMovement == UP && tileGrid.isNotWallOnCreatureUp(this)) {
      moveUp();
    } else if (selectedMovement == DOWN && tileGrid.isNotWallOnCreatureDown(this)) {
      moveDown();
    }

    if (tileGrid.isPellet(this) || tileGrid.isPowerPellet(this)) {
      globalGame.addPelletCounter();
      if (tileGrid.isPowerPellet(this)) {
        globalGame.changeModeTo(FRIGHTENED);
      }
      tileGrid.setTileValue(x, y, CORRIDOR); // Remove pellet from maze
    }
  }

  void setSelectedMovement(int movement) {
    if (isValidMovement()) {
      selectedMovement = movement;
    }
  }

  boolean isValidMovement() {
    return isValidMovementKey() &&
    (keyCode == LEFT && tileGrid.isNotWallOnCreatureLeft(this) ||
     keyCode == RIGHT && tileGrid.isNotWallOnCreatureRight(this) ||
     keyCode == UP && tileGrid.isNotWallOnCreatureUp(this) ||
     keyCode == DOWN && tileGrid.isNotWallOnCreatureDown(this)
    );
  }

  boolean isValidMovementKey() {
     return key == CODED && (keyCode == LEFT || keyCode == RIGHT || keyCode == UP || keyCode == DOWN);
  }
} 
