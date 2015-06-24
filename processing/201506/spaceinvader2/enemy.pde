class enemy extends moveObject
{
  PImage image;
  int speed               = 10;
  int forwardMoveValue    = 30;
  int moveIntervalCount   = 50;
  int shotIntervalCount   = 60;
  boolean moveRightFlag   = false;
  boolean moveForwardFrag = false;

  ArrayList<bullet> bulletList = new ArrayList<bullet>();

  enemy(int x, int y, int size)
  {
    super(x, y, size);

    image = loadImage("enemy.png");

    shotIntervalCount -= (int)random(-20, 20);
  }

  void process()
  {
    move();
    moveForward();
    paint();
    makeBullet();
    shotMove();
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
    if (moveForwardFrag != true)
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

  void makeBullet()
  {
    if (count % shotIntervalCount != 0)
    {
      return;
    }
    bullet myBullet = new bullet(x, y, 5, true);
    bulletList.add(myBullet);
  }

  void shotMove()
  {
    for (int i = 0; i < bulletList.size (); i++) {
      bullet myBullet = bulletList.get(i);

      boolean bulletState = myBullet.process();

      if (bulletState == false)
      {
        bulletList.remove(i);
      }
    }
  }
}

