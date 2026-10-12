// Brodden Spendlove | SpaceGame
import gifAnimation.*;

ArrayList<EnemyShip> enemyships = new ArrayList<EnemyShip>();
ArrayList<Lazer> lazers = new ArrayList<Lazer>();
ArrayList<PowerUp> powups = new ArrayList<PowerUp>();
Ship ship01;
Timer eDist, puDist, bDist;
Boss b1;
Boss b2;
Boss b3;
Boss b4;
Boss b5;
Boss b6;
Boss b7;
Boss b8;
Boss b9;
Boss b10;
boolean gameOver = false;
int gameDuration = 60000; 
int startMillis;
int laserDamage = 200;
int fireRateDelay = 0; 
int lastShotTime = 10;
int level;

// Array to hold all gif frames individually
PImage[] bgFrames; 

void setup() {
  size(800, 1000);
  frameRate(60);
  
  // Extract all frames from the GIF
  bgFrames = Gif.getPImages(this, "SpaceBack.gif"); 
  
  resetGame();
}

void resetGame() {
  enemyships.clear();
  lazers.clear();
  powups.clear();
  ship01 = new Ship(width / 2, height - 100); 
  eDist = new Timer(1000);
  puDist = new Timer(1500);
  eDist.start();
  puDist.start();
  bDist = new Timer(120000);
  bDist = new Timer(120000);
  startMillis = millis();
  laserDamage = 200;
  fireRateDelay = 0;
  gameOver = false;
}

void draw() {
  // SLOW DOWN THE GIF HERE:
  // Increase the number (e.g., / 4, / 6, / 8) to make it play slower
  int currentFrame = (frameCount / 6) % bgFrames.length;
  background(bgFrames[currentFrame]);

  if (gameOver) {
    cursor();
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(50);
    text("GAME OVER", width / 2, height / 2 - 30);
    textSize(24);
    text("Press 'R' to Restart", width / 2, height / 2 + 30);
    return;
  }

  noCursor();

  int timePassed = millis() - startMillis;
  int timeLeft = max(0, (gameDuration - timePassed) / 1000);
  if (timePassed >= gameDuration) {
    gameOver = true;
  }

  if (eDist.isFinished()) {
    enemyships.add(new EnemyShip(int(random(50, width - 50)), -60));
    eDist.start();
  }

  if (puDist.isFinished()) {
    powups.add(new PowerUp(int(random(50, width - 50)), -60));
    puDist.start();
  }

  ship01.move(mouseX, height - 100);
  ship01.display();

  for (int i = powups.size() - 1; i >= 0; i--) {
    PowerUp pu = powups.get(i);
    pu.move();
    pu.display();
    if (pu.isOffScreen()) {
      powups.remove(i);
    }
  }

  for (int i = enemyships.size() - 1; i >= 0; i--) {
    EnemyShip e = enemyships.get(i);
    e.move();
    e.display();
    if (e.isOffScreen()) {
      enemyships.remove(i);
    }
  }

  for (int i = lazers.size() - 1; i >= 0; i--) {
    Lazer l = lazers.get(i);
    l.move();
    l.display();

    boolean hit = false;

    for (int j = powups.size() - 1; j >= 0; j--) {
      PowerUp pu = powups.get(j);
      if (pu.intersect(l)) {
        powups.remove(j);
        laserDamage += 25; 
        if (fireRateDelay > 80) {
          fireRateDelay -= 40; 
        }
        lazers.remove(i);
        hit = true;
        break;
      }
    }

    if (hit) continue;

    for (int j = enemyships.size() - 1; j >= 0; j--) {
      EnemyShip e = enemyships.get(j);
      if (e.intersect(l)) {
        e.health -= l.damage;
        lazers.remove(i);
        if (e.health <= 0) {
          enemyships.remove(j);
        }
        hit = true;
        break;
      }
    }

    if (!hit && l.isOffScreen()) {
      lazers.remove(i);
    }
  }

  fill(255);
  textSize(20);
  textAlign(LEFT, TOP);
  text("Enemies: " + enemyships.size(), 20, 20);
  text("PowerUps: " + powups.size(), 20, 50);

  textAlign(RIGHT, TOP);
  text("Time: " + timeLeft + "s", width - 20, 20);
  text("Damage: " + laserDamage, width - 20, 50);
}

void mousePressed() {
  if (!gameOver && millis() - lastShotTime >= fireRateDelay) {
    lazers.add(new Lazer(ship01.x, ship01.y, laserDamage));
    lastShotTime = millis();
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    resetGame();
  }
}
