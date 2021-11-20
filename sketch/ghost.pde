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
} 
