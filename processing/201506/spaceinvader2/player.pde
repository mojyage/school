class player extends moveObject
{
  int speed = 5;
  boolean moveLeftFlag   = false;
  boolean moveRightFlag  = false;
  boolean shotPlayerFlag = false;
  bullet myBullet        = null;

  player(int x, int y, int size)
  {
    super(x, y, size);

    moveLeftFlag   = false;
    moveRightFlag  = false;
    shotPlayerFlag = false;
  }

  void process()
  {
    move();
    paint();
    makeBullet();
    shotMove();
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
  
  void makeBullet()
  {
    if (myBullet == null && shotPlayerFlag == true)
    {
      myBullet = new bullet(super.x, super.y, 5, false);
    }
  }

  void shotMove()
  {
    if (myBullet == null)
    {
      return;
    }

    boolean bulletState = myBullet.process();

    if (bulletState == false)
    {
      myBullet = null;
    }
  } 
}

