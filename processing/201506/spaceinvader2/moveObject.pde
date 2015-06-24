class moveObject
{
  int x, y;
  int size;

  moveObject(int x, int y, int size)
  {
    this.x    = x;
    this.y    = y;
    this.size = size;
  }

  void moveX(int xAxis)
  {
    if ((x + xAxis) < 0)
    {
      x = 0;
    } else if ((x + xAxis) > width)
    {
      x = width;
    } else
    {
      x += xAxis;
    }
  }

  void moveY(int yAxis)
  {
    if ((y + yAxis) < 0)
    {
      y = 0;
    } else if ((y + yAxis) > height)
    {
      y = height;
    } else
    {
      y += yAxis;
    }
  }
}

