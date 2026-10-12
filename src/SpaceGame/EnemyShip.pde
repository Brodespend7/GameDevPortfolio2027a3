class EnemyShip {
  int x, y, w, h, health, speed;
  boolean isHit;
  PImage ES1;

  EnemyShip(int x, int y) {
    this.x = x;
    this.y = y;
    w = int(random(20, 100));
    h = int(random(20, 100));
    speed = int(random(1, 10));
    health = 100;
    isHit = false;
    ES1 = loadImage("");
  }

  void display() {
    fill(235);
    ellipse(x, y, w, h);
    textAlign(CENTER, CENTER);
    fill(50);
    textSize(12);
    text(health, x, y);
  }

  void move() {
    y = y + speed;
  }

  boolean isOffScreen() {
    return y > height + 50;
  }

  boolean intersect(Lazer l) {
    float d = dist(x, y, l.x, l.y);
    return d < (w / 2 + l.w / 2);
  }
}
