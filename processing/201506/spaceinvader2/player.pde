class player extends moveObject
{
  int speed = 5;
  boolean moveLeftFlag   = false;
  boolean moveRightFlag  = false;
  boolean shotPlayerFlag = false;

  player(int x, int y, int size)
  {
    super(x, y, size);

    moveLeftFlag   = false;
    moveRightFlag  = false;
    shotPlayerFlag = false;
  }

  bullet process()
  {
    move();
    paint();
    return makeBullet();
    //shotMove();
  }

  void move()
  {
    if (moveLeftFlag == true)
    {
      moveX(-speed);
    } else if (moveRightFlag == true)
    {
      moveX(speed);
    }
  }

  void paint()
  {
    fill(255, 255, 255);
    ellipse(x, y, size, size);
  }

  bullet makeBullet()
  {
    if (shotPlayerFlag == true)
    {
      shotPlayerFlag = false;
      return new bullet(x, y, 5, false);
    }
    return null;
  }
}

