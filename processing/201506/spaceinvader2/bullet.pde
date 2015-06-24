class bullet extends moveObject
{
  int speed = 5;
  color enemyColor  = color(0, 255, 0);
  color playerColor = color(0, 255, 255);
  boolean enemyFlag;

  bullet(int x, int y, int size, boolean enemyFlag)
  {
    super(x, y, size);

    this.enemyFlag = enemyFlag;
  }

  boolean process()
  {
    move();
    paint();
    return isLive();
  }

  void move()
  {
    if (enemyFlag == true)
    {
      moveY(speed);
    } else
    {
      moveY(-speed);
    }
  }

  void paint()
  {
    if (enemyFlag == true)
    {
      fill(enemyColor);
    } else
    {
      fill(playerColor);
    }
    ellipse(x, y, size, size);
  }

  boolean isLive()
  {
    if ( 0 < y && y < height)
    {
      return true;
    } else {
      return false;
    }
  }
}

