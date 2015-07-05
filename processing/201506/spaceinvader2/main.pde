static int width = 500;
static int height = 500;
int count = 0;

int enemyValue = 10;

player myPlayer = null;
ArrayList<enemy> enemyList = new ArrayList<enemy>();
ArrayList<bullet> bulletList = new ArrayList<bullet>();

void setup() {
  size(width, height);
  colorMode(RGB, 255);
  background(0, 0, 0);
  smooth();
  noStroke();
  frameRate(50);

  myPlayer = new player(width / 2, height - 50, 20);

  for (int i = 0; i < enemyValue; i++)
  {
    enemyList.add(new enemy(50 + (i * 40), 50, 40));
  }

  count = 0;
}

void draw() {
  background(0, 0, 0);

  playerTurn();
  enemyTurn();
  bulletTurn();

  count++;
}

void playerTurn()
{
  bullet myBullet = myPlayer.process();
  boolean bulletState = isNullBullet(myBullet);
  if (bulletState == false)
  {
    bulletList.add(myBullet);
  }
}

void enemyTurn()
{
  enemy myEnemy       = null;
  bullet myBullet     = null;
  boolean bulletState = true;
  for (int i = 0; i < enemyValue; i++)
  {
    myEnemy     = enemyList.get(i);
    myBullet    = myEnemy.process();
    bulletState = isNullBullet(myBullet);
    if (bulletState == false)
    {
      bulletList.add(myBullet);
    }
  }
}

void bulletTurn()
{
  bullet myBullet     = null;
  boolean bulletState = true;
  for (int i = 0; i < bulletList.size (); i++) {
    myBullet = bulletList.get(i);
    bulletState = myBullet.process();

    if (bulletState == false)
    {
      bulletList.remove(i);
    }
  }
}

boolean isNullBullet(bullet b)
{
  if (b == null)
  {
    return true;
  }
  return false;
}

boolean isLivePlayerBullet()
{
  bullet myBullet = null;
  for (int i = 0; i < bulletList.size (); i++) {
    myBullet = bulletList.get(i);
    if (myBullet.enemyFlag == false)
    {
      return true;
    }
  }
  return false;
}

boolean collisionCheck(int myX, int myY, int myR, int youX, int youY, int youR) {
  return (pow(myX - youX, 2) + pow(myY - youY, 2)) <= pow(myR / 2 + youR / 2, 2);
}

void keyPressed()
{
  print("aaa");
  if (key == 'a' || keyCode == LEFT)
  {
    myPlayer.moveLeftFlag = true;
  }
  if (key == 'd' || keyCode == RIGHT)
  {  
    myPlayer.moveRightFlag = true;
  }

  if (key == ' ')
  {
    if (isLivePlayerBullet() == false)
    {
      myPlayer.shotPlayerFlag = true;
    }
  }
}

void keyReleased()
{
  if (key == 'a' || keyCode == LEFT)
  {
    myPlayer.moveLeftFlag = false;
  }
  if (key == 'd' || keyCode == RIGHT)
  {
    myPlayer.moveRightFlag = false;
  }
  if (key == ' ')
  {
    myPlayer.shotPlayerFlag = false;
  }
}

