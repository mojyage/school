static int width = 500;
static int height = 500;
int count = 0;

int enemyValue = 10;

player myPlayer = null;
enemy[] myEnemy = new enemy[enemyValue];

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
    myEnemy[i] = new enemy(50 + (i * 40), 50, 40);
  }

  count    = 0;
}

void draw() {
  background(0, 0, 0);
  myPlayer.process();
  for (int i = 0; i < enemyValue; i++)
  {
    myEnemy[i].process();
  }
  count++;
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
    myPlayer.shotPlayerFlag = true;
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

