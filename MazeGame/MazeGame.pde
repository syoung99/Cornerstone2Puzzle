int cols = 41;
int rows = 41;
//int[][] walls = new int[cols][rows];
int[][] walls = {
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
{1,0,1,0,1,0,1,0,1,1,1,1,1,0,1,1,1,0,1,0,1,0,1,1,1,1,1,0,1,1,1,0,1,1,1,1,1,1,1,0,1},
{1,0,1,0,1,0,1,0,0,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,1},
{1,1,1,0,1,1,1,1,1,1,1,0,1,0,1,0,1,1,1,0,1,1,1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,0,1},
{1,0,0,0,1,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,1,0,1},
{1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,0,1,0,1,0,1,1,1,1,1,0,1,0,1,1,1,0,1,1,1,0,1,0,1,1,1},
{1,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0,1,0,1},
{1,0,1,1,1,0,1,0,1,0,1,1,1,0,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1,0,1},
{1,0,1,0,0,0,1,0,1,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,0,0,1,0,1,0,1},
{1,0,1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,0,1,0,1},
{1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,1,0,1},
{1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,0,1},
{1,0,0,0,1,0,1,0,1,0,1,0,1,0,0,0,0,0,1,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1},
{1,1,1,1,1,0,1,0,1,0,1,0,1,0,1,1,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1},
{1,0,0,0,1,0,0,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,0,0,0,0,0,0,0,1,0,1},
{1,0,1,0,1,1,1,1,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1},
{1,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,1},
{1,1,1,1,1,1,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,0,1,1,1,0,1},
{1,0,0,0,1,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,0,0,1,0,0,0,1,0,1},
{1,0,1,1,1,0,1,0,1,0,1,1,1,1,1,0,1,0,1,1,1,0,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1},
{1,0,1,0,0,0,1,0,1,0,0,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,1},
{1,0,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,0,1,1,1},
{1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,0,0,0,0,1,0,1},
{1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,0,1,1,1,0,1,0,1,1,1,1,1,1,1,0,1},
{1,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1},
{1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,0,1,1,1},
{1,0,1,0,1,0,0,0,1,0,1,0,1,0,1,0,0,0,0,0,1,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,1},
{1,0,1,1,1,0,1,1,1,0,1,0,1,0,1,1,1,1,1,0,1,1,1,0,1,0,1,1,1,1,1,0,1,1,1,0,1,1,1,0,1},
{1,0,0,0,1,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,0,1},
{1,1,1,0,1,1,1,0,1,1,1,1,1,0,1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,0,1,1,1},
{1,0,1,0,0,0,1,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,0,1,0,1,0,1,0,1},
{1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,0,1,0,1,0,1,0,1},
{1,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,1},
{1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,0,1,1,1,1,1,0,1,0,1,0,1,1,1,1,1,1,1,0,1,1,1},
{1,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,1,0,1},
{1,0,1,0,1,0,1,1,1,1,1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,0,1,0,1,0,1,0,1,1,1,1,1,0,1,0,1},
{1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,1},
{1,0,1,0,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1},
{1,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,4},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
};

char Left = 'a';
char Right = 'd';
char Up = 'w';
char Down = 's';
float ScreenWidth = 1000;
float ScreenHeight = 1000;
Sprite sprite = new Sprite(0,0);
boolean placed = false;
boolean light = false;
boolean GameState = true;
void setup()
{
  background(255,255,255);
  size(1000,1000);
  frameRate(10);
  
}

void draw()
{
  if (GameState)
  {
    sprite.move();
    if (light)
    {
      sprite.Light();
    }
    else
    {
      sprite.shadow();
    }
  }
  else //user reaches end
  {
    println("You won");
  }
}
class Sprite
{
  int xpos;
  int ypos;
  int possibleX;
  int possibleY;
  Sprite(int xposin, int yposin)
  {
    xpos = xposin;
    ypos = yposin;
  }
  void move()
  {
    if (keyPressed == true)
    {
      possibleX = xpos;
      possibleY = ypos;
      if (key == Left){
        possibleX = xpos - 1;
      }
      else if(key== Right){
        possibleX = xpos + 1;
      }
      else if (key == Up){
        possibleY = ypos - 1;
      }
      else if (key == Down){
        possibleY = ypos + 1;
      }
      else{}
      if (possibleX < 0)
      {
        possibleX = 0;
      }
      else if (possibleX >= rows)
      {
        possibleX = rows - 1;
      }
      if (possibleY < 0)
      {
        possibleY = 0;
      }
      else if (possibleY >= cols)
      {
        possibleY = cols - 1;
      }
      if (walls[possibleY][possibleX]==1)
      {
        //println("BOOOOOOOO");
      }
      else if (walls[possibleY][possibleX]==0)
      {
        if (walls[ypos][xpos]==0)
        {
          fill(255,255,255);
          rect(xpos*(ScreenWidth/rows),ypos*(ScreenHeight/cols),ScreenWidth/rows,ScreenHeight/cols);
          //light = false;
        }
        else if (walls[ypos][xpos]==3)
        {
          fill(0,255,0);
          rect(xpos*(ScreenWidth/rows),ypos*(ScreenHeight/cols),ScreenWidth/rows,ScreenHeight/cols);
          light = false;
        }
        xpos = possibleX;
        ypos = possibleY;
        fill(255,0,0);
        rect(xpos*(ScreenWidth/rows),ypos*(ScreenHeight/cols),ScreenWidth/rows,ScreenHeight/cols);
      }
      else if (walls[possibleY][possibleX]==3)
      {
        fill(255,255,255);
        rect(xpos*(ScreenWidth/rows),ypos*(ScreenHeight/cols),ScreenWidth/rows,ScreenHeight/cols);
        xpos = possibleX;
        ypos = possibleY;
        fill(255,0,0);
        rect(xpos*(ScreenWidth/rows),ypos*(ScreenHeight/cols),ScreenWidth/rows,ScreenHeight/cols);
        light = true;
      }
      else if (walls[possibleY][possibleX]==4)
      {
        GameState = false;
      }
      else{ }
      println("X pos: ", xpos + 1, "Y pos:", ypos + 1,"            Wall: ", walls[possibleY][possibleX]);
    }
  }
  void shadow()
  {
    background(0,0,0);
    int sightX = xpos - 2;
    int sightY = ypos - 2;
    if(sightX < 0)
    {
      sightX = 0;
    }
    else if (sightX + 4 >= rows)
    {
      sightX = rows - 5;
    }
    if (sightY < 0)
    {
      sightY = 0;
    }
    else if (sightY + 4 >= cols)
    {
      sightY = cols - 5;
    }
    if (walls[39][40]==4)//End position for AI one
    {
        fill(0,180,180);
        rect(40*(ScreenWidth/rows),39*(ScreenHeight/cols),ScreenWidth/rows,ScreenHeight/cols);
    }
    for (int i = 0; i < 5; i++)
    {
      for(int j = 0; j < 5; j++)
      {
        
        if (walls[sightY+i][sightX+j] == 1)
        {
          fill(150,150,150);
          rect((sightX+j)*(ScreenWidth/rows),(sightY+i)*(ScreenHeight/cols),ScreenWidth/rows,ScreenHeight/cols);
        }
        else if (xpos == (sightX+j) && ypos == (sightY+i))
        {
          fill(255,0,0);
          rect(xpos*(ScreenWidth/rows), ypos*(ScreenHeight/cols),ScreenWidth/rows,ScreenHeight/cols);
        }
        else if (walls[sightY+i][sightX+j] == 0)
        {
          fill(255,255,255);
          rect((sightX+j)*(ScreenWidth/rows),(sightY+i)*(ScreenHeight/cols),ScreenWidth/rows,ScreenHeight/cols);
        }
        else if (walls[sightY+i][sightX+j] == 3)
        {
          fill(0,255,0);
          rect((sightX+j)*(ScreenWidth/rows),(sightY+i)*(ScreenHeight/cols),ScreenWidth/rows,ScreenHeight/cols);
        }
      }
    }
  }
  void Light()
  {
    for(int i = 0; i < cols; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        //walls[i][j] = 0;//(int)random(2);
        if (walls[i][j] == 1)
        {
          fill(150,150,150);
          rect(j*(ScreenWidth/rows),i*(ScreenHeight/cols),ScreenWidth/rows,ScreenHeight/cols);
        }
        else if (walls[i][j]==0)
        {
          fill(255,255,255);
          rect(j*(ScreenWidth/rows),i*(ScreenHeight/cols),ScreenWidth/rows,ScreenHeight/cols);
          if (placed == false)
          {
            rect(0*(ScreenWidth/rows),0*(ScreenHeight/cols),ScreenWidth/rows,ScreenHeight/cols);
            placed = true;
          }
        }
        else if (walls[i][j]==3)
        {
          fill(0,255,0);
          rect(j*(ScreenWidth/rows),i*(ScreenHeight/cols),ScreenWidth/rows,ScreenHeight/cols);
        }
        else if (walls[i][j]==4)
        {
          fill(0,180,180);
          rect(j*(ScreenWidth/rows),i*(ScreenHeight/cols),ScreenWidth/rows,ScreenHeight/cols);
        }
      }
    }
  }
}
        