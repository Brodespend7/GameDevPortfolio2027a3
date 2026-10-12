class Lazer {
  int x, y, w, h, speed, damage;

  Lazer(int x, int y, int damage) {
    this.x = x;
    this.y = y;
    this.damage = damage;
    w = 6;
    h = 10;
    speed = 10;
  }

  void display() {
    fill(44, 222, 22);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void move() {
    y = y - speed;
  }

  boolean isOffScreen() {
    return y < -10;
  }
}
