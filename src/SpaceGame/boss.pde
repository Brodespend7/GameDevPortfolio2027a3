class Boss {
  int x, y, w, lvl, h, speed, health;
  PImage boss1,boss2,boss3,boss4,boss5,boss6,boss7,boss8,boss9,boss10;

  Boss(int x, int y, int lvl) {
    this.x = x;
    this.y = y;
    this.lvl = lvl;
    w = 200;
    h = 200;
    speed = 2;
    health = 1000;
    if (lvl == 1) {
      boss1 = loadImage("boss01.png");
    } else if (lvl == 2) {
      boss2 = loadImage("boss02.png");
    } else if (lvl == 3) {
      boss3 = loadImage("boss03.png");
    } else if (lvl == 4) {
      boss4 = loadImage("boss04.png");
    } else if (lvl == 5) {
      boss5 = loadImage("boss05.png");
    } else if (lvl == 6) {
      boss6 = loadImage("boss06.png");
    } else if (lvl == 7) {
      boss7 = loadImage("boss07.png");
    } else if (lvl == 8) {
      boss8 = loadImage("boss08.png");
    } else if (lvl == 9) {
      boss9 = loadImage("boss09.png");
    } else if (lvl == 10) {
      boss10 = loadImage("boss10.png");
    } 
  }
  void display() {
    fill(255,3,3);
    ellipse(x,y,h,w);
  }
}
