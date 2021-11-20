

final int INTERSPACE = 20;
final int WALL_SIZE = 20;
final int CORRIDOR_SIZE = 20;

final int PIXEL_SIZE = 3;


int MAX_COLS = 13;
int MAX_ROWS = 10;

int CRATURES_SIZE = 5;

MapFile mapFile;
TileGrid tileGrid;
Creature[] creatures;
Pacman pacman;
Blinky blinky;
Pinky pinky;
Inky inky;
Clyde clyde;

void setup() {
  //size(224 * PIXEL_SIZE, 288 * PIXEL_SIZE);
  size(672, 864);

  mapFile = new MapFile();
  
  mapFile.showYourSelf();
  tileGrid = mapFile.fillGrid();
  tileGrid.renderGrid();
  
  creatures = new Creature[CRATURES_SIZE];
  creatures[0] = pacman;
  creatures[1] = blinky;
  creatures[2] = pinky;
  creatures[3] = inky;
  creatures[4] = clyde;
}

void draw() {
  tileGrid.refreshGrid();
}

void keyPressed() {
  if (key == CODED) {
    if (isValidMovement()) {
      for (int i = 0; i < CRATURES_SIZE; i++) {
        tileGrid.setCorridorInCreaturePosition(creatures[i]);
      }

      if (keyCode == LEFT && tileGrid.isNotWallOnCreatureLeft(pacman)) {
        pacman.moveLeft();
      } else if (keyCode == RIGHT && tileGrid.isNotWallOnCreatureRight(pacman)) {
        pacman.moveRight();
      } else if (keyCode == UP && tileGrid.isNotWallOnCreatureUp(pacman)) {
        pacman.moveUp();
      } else if (keyCode == DOWN && tileGrid.isNotWallOnCreatureDown(pacman)) {
        pacman.moveDown();
      }
      
      for (int i = 0; i < CRATURES_SIZE; i++) {
        tileGrid.refreshCreature(creatures[i]);
      }
    }
  } else if (key == 'd') {
    tileGrid.showYourSelf();
    for (int i = 0; i < CRATURES_SIZE; i++) {
      creatures[i].showYourSelf();
    }
  }
}

boolean isValidMovement() {
   return key == CODED && (keyCode == LEFT || keyCode == RIGHT || keyCode == UP || keyCode == DOWN);
}

  void drawWallCell(int x, int y) {
    fill(255);
    //ellipse(x*(width/MAX_ROWS), y*(height/MAX_COLS), 3, 3);
    //ellipse(x * INTERSPACE, y * INTERSPACE, 5, 5);
    square(x * INTERSPACE, y * INTERSPACE, WALL_SIZE);
  }
  
  void drawCorridorCell(int x, int y) {
    fill(0);
    square(x * INTERSPACE, y * INTERSPACE, CORRIDOR_SIZE);
  }
