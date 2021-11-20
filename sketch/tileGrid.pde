final int WALL = 0;
final int CORRIDOR = 1;

class TileGrid {
  int[][] grid;
  
  TileGrid () {  
    grid = new int[MAX_ROWS][MAX_COLS];
    for (int y = 0; y < MAX_ROWS; y++) {
      for (int x = 0; x < MAX_COLS; x++) {
        cleanTile(x, y);
      }
    }
  }
  
  void renderGrid() {
    for (int y = 0; y < MAX_ROWS; y++) {
      for (int x = 0; x < MAX_COLS; x++) {
        if (tileGrid.isWall(x, y)) {
          drawWallCell(x, y);
        } else if (tileGrid.isCorridor(x, y)) {
          drawCorridorCell(x, y);
        } else if (tileGrid.isPacman(x, y)) {
          pacman = new Pacman(x, y);
        } else if (tileGrid.isBlinky(x, y)) {
          blinky = new Blinky(x, y);
        } else if (tileGrid.isPinky(x, y)) {
          pinky = new Pinky(x, y);
        } else if (tileGrid.isInky(x, y)) {
          inky = new Inky(x, y);
        } else if (tileGrid.isClyde(x, y)) {
          clyde = new Clyde(x, y);
        }
      }
    }
  }
  
  void refreshGrid() {

    for (int y = 0; y < MAX_ROWS; y++) {
      for (int x = 0; x < MAX_COLS; x++) {
        if (tileGrid.isWall(x, y)) {
          //drawWallCell(x, y); Walls don't change
        } else if (tileGrid.isCorridor(x, y)) {
          drawCorridorCell(x, y); // Cleans previous position from creatures.
          // There is a bug if I use cleanPreviousPosition(), and Pacman moves in diagonal.
        }
      }
    }
    
    for (int i = 0; i < CRATURES_SIZE; i++) {
      creatures[i].drawYourSelf();
    }
  }
   
  void cleanTile(int x, int y) {
    setTileValue(x, y, 0);
  }
  
  boolean isWall(int x, int y) {
   return getTileValue(x, y) == WALL;
  }

  boolean isCorridor(int x, int y) {
    return getTileValue(x, y) == CORRIDOR;
  }
  
  boolean isPacman(int x, int y) {
    return getTileValue(x, y) == PACMAN_TYPE;
  }
  
  boolean isBlinky(int x, int y) {
    return getTileValue(x, y) == BLINKY_TYPE;
  }
  
  boolean isPinky(int x, int y) {
    return getTileValue(x, y) == PINKY_TYPE;
  }
  
  boolean isInky(int x, int y) {
    return getTileValue(x, y) == INKY_TYPE;
  }
  
  boolean isClyde(int x, int y) {
    return getTileValue(x, y) == CLYDE_TYPE;
  }
  
  boolean isNotWallOnCreatureLeft(Creature creature) {
    return !isWall(creature.getX()-1, creature.getY());
  }
  
  boolean isNotWallOnCreatureRight(Creature creature) {
    return !isWall(creature.getX()+1, creature.getY());
  }
  
  boolean isNotWallOnCreatureUp(Creature creature) {
    return !isWall(creature.getX(), creature.getY()-1);
  }
  
  boolean isNotWallOnCreatureDown(Creature creature) {
    return !isWall(creature.getX(), creature.getY()+1);
  }
  
  void setCorridorInCreaturePosition(Creature creature) {
    setTileValue(creature.getX(), creature.getY(), CORRIDOR);
  }
 
  void refreshCreature(Creature creature) {
    setTileValue(creature.getX(), creature.getY(), creature.getType());
  } 
  
  void showYourSelf() {
    println("Grid content:");
    for (int y = 0; y < MAX_ROWS; y++) {
      for (int x = 0; x < MAX_COLS; x++) {
        print(getTileValue(x, y));
      }
      println("");
    }
  }
  
  int getTileValue(int x, int y) {
    return grid[y][x];
  } 
  
  void setTileValue(int x, int y, int value) {
    grid[y][x] = value;
  } 
} 
