

final int INTERSPACE = 24;
final int WALL_SIZE = 24;
final int CORRIDOR_SIZE = 24;
final int PACMAN_SIZE = 24;
final int GHOST_SIZE = 24;

final int PELLET_SIZE = 5;
final int POWER_PELLET_SIZE = 13;

final int PIXEL_SIZE = 3;


int MAX_COLS = 28;
int MAX_ROWS = 36;

int CREATURES_SIZE = 5;
int GHOSTS_SIZE = 4;

int DELAY = 5;

final int CHASE = 0;
final int SCATTER = 1;
final int FRIGHTENED = 2;

int currentMode = CHASE;
int previousMode = CHASE;

MapFile mapFile;
TileGrid tileGrid;
Creature[] creatures;
Ghost[] ghosts;
Pacman pacman;
Blinky blinky;
Pinky pinky;
Inky inky;
Clyde clyde;

int delayCounter;
int pelletCounter;

PFont f;

void setup() {
  //size(224 * PIXEL_SIZE, 288 * PIXEL_SIZE);
  size(672, 864);
  f = createFont("Arial",16,true); // STEP 2 Create Font

  delayCounter = 0;
  pelletCounter = 0;

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

  ghosts = new Ghost[GHOSTS_SIZE];
  ghosts[0] = blinky;
  ghosts[1] = pinky;
  ghosts[2] = inky;
  ghosts[3] = clyde;
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

  drawPalletCounter();
}

void keyPressed() {
  if (key == CODED) {
     pacman.setSelectedMovement(keyCode);
  } else if (key == 'd') {
    tileGrid.debug();
    for (int i = 0; i < CREATURES_SIZE; i++) {
      creatures[i].debug();
    }
  } else if (key == 'c') {
    changeModeTo(CHASE);
  } else if (key == 's') {
    changeModeTo(SCATTER);
  } else if (key == 'f') {
    changeModeTo(FRIGHTENED);
  }
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

void drawPelletCell(int x, int y) {
  drawCorridorCell(x, y);
  fill(255);
  circle((x * INTERSPACE) + (CORRIDOR_SIZE / 2), (y * INTERSPACE) + (CORRIDOR_SIZE / 2), PELLET_SIZE);
}

void drawPowerPelletCell(int x, int y) {
  drawCorridorCell(x, y);
  fill(255);
  circle((x * INTERSPACE) + (CORRIDOR_SIZE / 2), (y * INTERSPACE) + (CORRIDOR_SIZE / 2), POWER_PELLET_SIZE);
}

void drawPalletCounter() {
  textFont(f,16);
  fill(255);
  text(nf(pelletCounter, 3),100,20);
}

void changeModeTo(int newMode) {
  previousMode = currentMode;
  currentMode = newMode;
  reverseDirectionForAllGhosts();
}

void reverseDirectionForAllGhosts() {
  if (previousMode != FRIGHTENED) {
    for (int i = 0; i < GHOSTS_SIZE; i++) {
      ghosts[i].scheduleReverseDirection();
    }
  }
}
