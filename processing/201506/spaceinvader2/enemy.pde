class enemy extends moveObject
{
  PImage image;
  int speed               = 10;
  int forwardMoveValue    = 30;
  int moveIntervalCount   = 5;
  int shotIntervalCount   = 60;
  boolean moveRightFlag   = false;
  boolean moveForwardFrag = false;

  enemy(int x, int y, int size)
  {
    super(x, y, size);

    image = loadImage("enemy.png");

    shotIntervalCount -= (int)random(-20, 20);
  }

  bullet process()
  {
    move();
    moveForward();
    paint();
    return makeBullet();
  }

  void move()
  {
    if (count % moveIntervalCount != 0)
    {
      return;
    }

    if (moveRightFlag == true)
    {
      moveX(-speed);
    } else
    {
      moveX(speed);
    }
    moveForwardFrag = true;
  }

  void moveForward()
  {
    if (moveForwardFrag == false)
    {
      return;
    }

    if (x < 50 || (width - 50) < x)
    {
      moveY(forwardMoveValue);
      moveRightFlag = !moveRightFlag;
      moveForwardFrag = false;
    }
  }

  void paint()
  {
    fill(0, 255, 0);
    image(image, x - (size / 2), y - (size / 2), size, size);
  }

  bullet makeBullet()
  {
    if (count % shotIntervalCount == 0 && count > 20)
    {
      return new bullet(x, y, 5, true);
    }
    return null;
  }
}

