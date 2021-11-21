

final int INTERSPACE = 20;
final int WALL_SIZE = 20;
final int CORRIDOR_SIZE = 20;

final int PIXEL_SIZE = 3;


int MAX_COLS = 13;
int MAX_ROWS = 10;

int CREATURES_SIZE = 5;

int DELAY = 5;

int delayCounter;

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

  delayCounter = 0;

  mapFile = new MapFile();
  
  mapFile.debug();
  tileGrid = mapFile.fillGrid();
  tileGrid.renderGrid();
  
  creatures = new Creature[CREATURES_SIZE];
  creatures[0] = pacman;
  creatures[1] = blinky;
  creatures[2] = pinky;
  creatures[3] = inky;
  creatures[4] = clyde;
}

void draw() {

  if (delayCounter == 0) {
    for (int i = 0; i < CREATURES_SIZE; i++) {
      creatures[i].processMovement(tileGrid);
    }
  }
  delayCounter++;
  if (delayCounter > DELAY) {
    delayCounter = 0;
  }

  tileGrid.refreshGrid();  
}

void keyPressed() {
  if (key == CODED) {
     pacman.setSelectedMovement(keyCode);
  } else if (key == 'd') {
    tileGrid.debug();
    for (int i = 0; i < CREATURES_SIZE; i++) {
      creatures[i].debug();
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
