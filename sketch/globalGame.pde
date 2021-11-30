final int CHASE = 0;
final int SCATTER = 1;
final int FRIGHTENED = 2;

class GlobalGame {
  int currentMode;
  int previousMode;
  int pelletCounter;

  GlobalGame () {  
    currentMode = CHASE;
    previousMode = CHASE;
    pelletCounter = 0;
  }

  void changeModeTo(int newMode) {
    previousMode = currentMode;
    currentMode = newMode;
    reverseDirectionForAllGhosts();
  }

  boolean isChase() {
    return CHASE == currentMode;
  }

  boolean isScatter() {
    return SCATTER == currentMode;
  }

  boolean isFrightened() {
    return FRIGHTENED == currentMode;
  }

  int getPelletCounter() {
    return pelletCounter;
  }

  void addPelletCounter() {
    pelletCounter++;
  }

  void reverseDirectionForAllGhosts() {
    if (previousMode != FRIGHTENED) {
      for (int i = 0; i < GHOSTS_SIZE; i++) {
        ghosts[i].scheduleReverseDirection();
      }
    }
  }
}
