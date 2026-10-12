class PowerUp {
  int x, y, size, speed;
  char type;
  boolean isHit;
  PImage PU1;

  PowerUp(int x, int y) {
    this.x = x;
    this.y = y;
    size = int(random(20, 100));
    speed = int(random(1, 10));
    if (random(2) > 1.0) {
      type = 'h';
    } else {
      type = 't';
    }
    isHit = false;
    PU1 = loadImage("Piskel+1.png");
  }

  void display() {
    fill(55, 200, 44);
    ellipse(x, y, size, size);
    textAlign(CENTER, CENTER);
    fill(50);
    textSize(12);
    text(type, x, y);
  }

  void move() {
    y = y + speed;
  }

  boolean isOffScreen() {
    return y > height + 50;
  }

  boolean intersect(Lazer l) {
    float d = dist(x, y, l.x, l.y);
    return d < (size / 2 + l.w / 2);
  }
}
