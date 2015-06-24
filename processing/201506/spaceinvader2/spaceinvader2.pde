/**
PFont myFont;
//-----------player-----
int playerX = 240;
int playerY = 400;
int playerSize = 20;
//shot
int shotPx = playerX;
int shotPy = playerY;
int shotPVy = -5;
int shotPr = 7;
//flag
boolean playerFlag = true;
boolean moveLeft = false;
boolean moveRight = false;
boolean shotPFlag = false;

//-----------enemy-------
PImage img;
int enemyX = 40;
int enemyY = 30;
int enemyR = 40;
int moveEVx = 10;
int moveEVy = 30;
int moveCount = 0;
boolean enemyFlag = true;

//shot
int shotEx = enemyX;
int shotEy = enemyY;
int shotEr = 7;
int shotEVx = 0;
int shotEVy = 5;
int shotECount = 0;
boolean shotEFlag = false;

void setup() {
  size(480, 480);
  background(0);
  fill(0, 0, 0);
  smooth();
  noStroke();
  frameRate(50);
  myFont = createFont("MS Gothic", 24, true);
  img = loadImage("enemy.png");
}

//------------------------
boolean collisionCheck(int myX, int myY, int myR, int youX, int youY, int youR) {
  return (pow(myX - youX, 2) + pow(myY - youY, 2)) <= pow(myR / 2 + youR / 2, 2);
}

//-----------PLAYER--------------------------------
void playerMove()
{
  if (playerFlag)
  {
    if (moveLeft)
    {
      playerX -= 3;
    }
    if (moveRight)
    {
      playerX += 3;
    }
    fill(255);
    ellipse(playerX, playerY, playerSize, playerSize);
  }
}

void playerShot()
{
  fill(255, 0, 0);
  if (shotPFlag)
  {
    shotPy += shotPVy;
    if (collisionCheck(shotPx, shotPy, shotPr, enemyX, enemyY, enemyR))
    {
      shotPFlag = false;
      enemyFlag = false;  
      shotEFlag = false;
    }
    if (shotPy < 0)
    {
      shotPFlag = false;
    }
    ellipse(shotPx, shotPy, shotPr, shotPr);
  }
}
//----------------------------------------------

//-------------------ENEMY------------------------
void enemyMove()
{
  if (enemyFlag)
  {
    if (moveCount % 20 == 0)
    {
      enemyX += moveEVx;
      if (enemyX < 50 || 400 < enemyX)
      {
        enemyY += moveEVy;
        enemyX -= moveEVx;
        moveEVx *= -1;
      }
    }
    moveCount++;
    fill(0, 255, 0);
    image(img, enemyX - (enemyR / 2), enemyY - enemyR / 2, enemyR, enemyR);
  }
}

void enemyShot()
{
  if ((shotECount = ++shotECount % 150) == 0 && enemyFlag && !shotEFlag)
  {
    shotEFlag = true;
    shotEx = enemyX;
    shotEy = enemyY;
  }
  if (shotEFlag)
  {
    shotEy+= shotEVy;
    if (collisionCheck(shotEx, shotEy, shotEr, playerX, playerY, playerSize))
    {
      playerFlag = false;
      shotEFlag = false;
      shotPFlag = false;
    }
    if (shotEy > 480)
    {
      shotEFlag = false;
    }
    ellipse(shotEx, shotEy, shotEr, shotEr);
  }
}
//------------------------------------------------------

void draw()
{
  background(0);
  playerMove();
  playerShot();
  enemyMove();
  enemyShot();
}

void keyPressed()
{
  if (key == 'a' || keyCode == LEFT)
  {
    moveLeft = true;
  }
  if (key == 'd' || keyCode == RIGHT)
  {  
    moveRight = true;
  }
  if (!shotPFlag && playerFlag)
  {
    if (key == ' ' || keyCode == UP)
    {
      shotPFlag = true;
    }
    shotPx = playerX;
    shotPy = playerY;
  }
}

void keyReleased()
{
  if (key == 'a' || keyCode == LEFT)
  {
    moveLeft = false;
  }
  if (key == 'd' || keyCode == RIGHT)
  {
    moveRight = false;
  }
}
*/
