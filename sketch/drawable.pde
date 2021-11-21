
class Drawable { 
  int x;
  int y;
  int type;
  String name;
  color c;
  
  Drawable (int x, int y, int type, String name, color c) {  
    this.x = x; 
    this.y = y; 
    this.type = type; 
    this.name = name; 
    this.c = c;
  } 
 
  int getX() {
    return x;
  }

  int getY() {
    return y;
  }
  
  int getType() {
    return type;
  }
  
  void drawYourSelf() {
    fill(c);
  }
} 
