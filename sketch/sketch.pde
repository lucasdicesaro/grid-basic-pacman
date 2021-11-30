

final int INTERSPACE = 24;
final int WALL_SIZE = 24;
final int CORRIDOR_SIZE = 24;
final int PACMAN_SIZE = 24;
final int GHOST_SIZE = 24;

final int PELLET_SIZE = 5;
final int POWER_PELLET_SIZE = 13;

final int PIXEL_SIZE = 3;

int CREATURES_SIZE = 5;
int GHOSTS_SIZE = 4;

int DELAY = 5;

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

PFont f;
GlobalGame globalGame;


void setup() {
  //size(224 * PIXEL_SIZE, 288 * PIXEL_SIZE);
  size(672, 864);
  f = createFont("Arial",16,true); // STEP 2 Create Font

  delayCounter = 0;

  mapFile = new MapFile();
  globalGame = new GlobalGame();
  
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
      creatures[i].processMovement();
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
    mapFile.debug();
    tileGrid.debug();
    for (int i = 0; i < CREATURES_SIZE; i++) {
      creatures[i].debug();
    }
  } else if (key == 'c') {
    globalGame.changeModeTo(CHASE);
  } else if (key == 's') {
    globalGame.changeModeTo(SCATTER);
  } else if (key == 'f') {
    globalGame.changeModeTo(FRIGHTENED);
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

void drawCorridorCell(Creature creature) {
  fill(0);
  square(creature.getX() * INTERSPACE, creature.getY() * INTERSPACE, CORRIDOR_SIZE);
}

void drawPelletCell(int x, int y) {
  drawCorridorCell(x, y);
  fill(255);
  circle((x * INTERSPACE) + (CORRIDOR_SIZE / 2), (y * INTERSPACE) + (CORRIDOR_SIZE / 2), PELLET_SIZE);
}

void drawPelletCell(Creature creature) {
  drawCorridorCell(creature.getX(), creature.getY());
  fill(255);
  circle((creature.getX() * INTERSPACE) + (CORRIDOR_SIZE / 2), (creature.getY() * INTERSPACE) + (CORRIDOR_SIZE / 2), PELLET_SIZE);
}

void drawPowerPelletCell(int x, int y) {
  drawCorridorCell(x, y);
  fill(255);
  circle((x * INTERSPACE) + (CORRIDOR_SIZE / 2), (y * INTERSPACE) + (CORRIDOR_SIZE / 2), POWER_PELLET_SIZE);
}

void drawPowerPelletCell(Creature creature) {
  drawCorridorCell(creature.getX(), creature.getY());
  fill(255);
  circle((creature.getX() * INTERSPACE) + (CORRIDOR_SIZE / 2), (creature.getY() * INTERSPACE) + (CORRIDOR_SIZE / 2), POWER_PELLET_SIZE);
}

void drawPalletCounter() {
  textFont(f,16);
  fill(255);
  text(nf(globalGame.getPelletCounter(), 3),100,20);
}
