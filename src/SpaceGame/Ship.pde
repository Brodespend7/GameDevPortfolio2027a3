class Ship {
  int x, y;
  PImage s1;
  PImage a1;

  Ship(int x, int y) {
    this.x = x;
    this.y = y;
    s1 = loadImage("SpaceShip.png");
    a1 = loadImage("");
  }

  void display() {
    imageMode(CENTER);
    if (s1 != null) {
      image(s1, x, y);
    }
  }

  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }
}
