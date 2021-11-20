

final int WALL = 0;
final int CORRIDOR = 1;
final int PACMAN = 2;

final int ASCII_0 = 48;
final int ASCII_1 = 49;
final int ASCII_2 = 50;

final int INTERSPACE = 20;
final int WALL_SIZE = 20;
final int CORRIDOR_SIZE = 20;
final int PACMAN_SIZE = 20;
final int MOVEMENT_VELOCITY = PACMAN_SIZE;

int MAX_COLS = 13;
int MAX_ROWS = 10;

int pacmanX = 0;
int pacmanY = 0;

int[][] grid = new int[MAX_ROWS][MAX_COLS];

void setup() {
  size(480, 480);

  for (int i = 0; i < MAX_ROWS; i++) {
    for (int j = 0; j < MAX_COLS; j++) {
      grid[i][j] = 0;
    }
  }

  //showMapFile();
  fillGrid();
  //showGrid();
}

void draw() {
  drawGrid();
}



void fillGrid() {
  String[] lines = loadStrings("map_1.txt");
  for (int i = 0 ; i < lines.length && i < MAX_ROWS; i++) {
    for (int j = 0 ; j < lines[i].length() && j < MAX_COLS; j++) {
      if (lines[i].charAt(j) == ASCII_0) {
        grid[i][j] = WALL;
      } else if (lines[i].charAt(j) == ASCII_1) {
        grid[i][j] = CORRIDOR;
      } else if (lines[i].charAt(j) == ASCII_2) {
        grid[i][j] = PACMAN;
        pacmanX = i;        
        pacmanY = j;
      }
    }
  }
}

void drawGrid() {
  for (int i = 0; i < MAX_ROWS; i++) {
    for (int j = 0; j < MAX_COLS; j++) {
      if (grid[i][j] == WALL) {
        drawWallCell(j, i);
      } else if (grid[i][j] == CORRIDOR) {
        drawCorridorCell(j, i);
      } else if (grid[i][j] == PACMAN) {
        drawPacman(j, i);
      }
    }
  }
}

void showMapFile() {
  println("File content:");
  String[] lines = loadStrings("map_1.txt");
  println("there are " + lines.length + " lines");
  for (int i = 0 ; i < lines.length && i < MAX_ROWS; i++) {
    for (int j = 0 ; j < lines[i].length() && j < MAX_COLS; j++) {
      print(lines[i].charAt(j));
    }
    println("");
  }
}

void showGrid() {
  println("Grid content:");
  for (int i = 0; i < MAX_ROWS; i++) {
    for (int j = 0; j < MAX_COLS; j++) {
      print(grid[i][j]);
    }
    println("");
  }
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT && grid[pacmanX][pacmanY-1] == CORRIDOR) {
      grid[pacmanX][pacmanY] = CORRIDOR;
      grid[pacmanX][--pacmanY] = PACMAN;
    } else if (keyCode == RIGHT && grid[pacmanX][pacmanY+1] == CORRIDOR) {
      grid[pacmanX][pacmanY] = CORRIDOR;
      grid[pacmanX][++pacmanY] = PACMAN;
    } else if (keyCode == UP && grid[pacmanX-1][pacmanY] == CORRIDOR) {
      grid[pacmanX][pacmanY] = CORRIDOR;
      grid[--pacmanX][pacmanY] = PACMAN;
    } else if (keyCode == DOWN && grid[pacmanX+1][pacmanY] == CORRIDOR) {
      grid[pacmanX][pacmanY] = CORRIDOR;
      grid[++pacmanX][pacmanY] = PACMAN;
    }
  } else if (key == 'd') {
    showGrid();
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

void drawPacman(int x, int y) {
  fill(255);
  circle((x * INTERSPACE) + (PACMAN_SIZE / 2), (y * INTERSPACE) + (PACMAN_SIZE / 2), PACMAN_SIZE);
}
