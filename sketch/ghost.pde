final int GHOST_SIZE = 20;

class Ghost extends Creature {

  Ghost (int x, int y, int type, String name, color c) {  
    super(x, y, type, name, c); 
  }
  
  void drawYourSelf() {
    super.drawYourSelf();
    fill(c);
    square(x * INTERSPACE, y * INTERSPACE, GHOST_SIZE);
  }
  
  void processMovement(TileGrid tileGrid) {
    
    int selectedMovement = getRandomMovement();
    
    if (selectedMovement == LEFT && tileGrid.isNotWallOnCreatureLeft(this)) {
      moveLeft();
    } else if (selectedMovement == RIGHT && tileGrid.isNotWallOnCreatureRight(this)) {
      moveRight();
    } else if (selectedMovement == UP && tileGrid.isNotWallOnCreatureUp(this)) {
      moveUp();
    } else if (selectedMovement == DOWN && tileGrid.isNotWallOnCreatureDown(this)) {
      moveDown();
    } 
  }
  
  int getRandomMovement() {
    int[] movements = { LEFT, RIGHT, UP, DOWN };
    int index = int(random(movements.length));
    return movements[index];
  }
} 
