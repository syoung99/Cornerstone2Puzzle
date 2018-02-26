import processing.serial.*;

static final int PORT_INDEX = 2, BAUDS = 9600;

int[] vals;

int cols = 41;
int rows = 41;
int vision = 2;
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
//float width = 1000;
//float height = 1000;
Sprite sprite = new Sprite(0,1);
boolean placed = false;
boolean light = false;
boolean GameState = true;
void setup()
{
  fullScreen();
  background(255,255,255);
  //size(1000,1000);
  frameRate(10);
  noLoop();
  final String[] ports = Serial.list();
  printArray(ports);
  new Serial(this, ports[PORT_INDEX], BAUDS).bufferUntil(ENTER);
}

void draw()
{
  println(vals);
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
void serialEvent(final Serial s) {
  vals = int(splitTokens(s.readString()));
  //vals = float(splitTokens(s.readString()));
  redraw = true;
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
    //if (keyPressed == true)
    //{
      possibleX = xpos;
      possibleY = ypos;
      if (vals == null){
        
      }
      else if(vals[0] >= 10){
        possibleX = xpos - 1;
      }
      else if (vals[0] <= -10){
        possibleX = xpos + 1;
      }
      else if (vals[1] >= 10){
        possibleY = ypos - 1;
      }
      else if (vals [1] <= -10)
      {
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
          rect(xpos*(width/rows),ypos*(height/cols),width/rows,height/cols);
          //light = false;
        }
        else if (walls[ypos][xpos]==3)
        {
          fill(0,255,0);
          rect(xpos*(width/rows),ypos*(height/cols),width/rows,height/cols);
          light = false;
        }
        xpos = possibleX;
        ypos = possibleY;
        fill(255,0,0);
        rect(xpos*(width/rows),ypos*(height/cols),width/rows,height/cols);
      }
      else if (walls[possibleY][possibleX]==3)
      {
        fill(255,255,255);
        rect(xpos*(width/rows),ypos*(height/cols),width/rows,height/cols);
        xpos = possibleX;
        ypos = possibleY;
        fill(255,0,0);
        rect(xpos*(width/rows),ypos*(height/cols),width/rows,height/cols);
        light = true;
      }
      else if (walls[possibleY][possibleX]==4)
      {
        GameState = false;
      }
      else{ }
      //println("X pos: ", xpos + 1, "Y pos:", ypos + 1,"            Wall: ", walls[possibleY][possibleX]);
    //}
  }
  void shadow()
  {
    background(0,0,0);
    int sightX = xpos - vision;
    int sightY = ypos - vision;
    if(sightX < 0)
    {
      sightX = 0;
    }
    else if (sightX + vision*2 >= rows)
    {
      sightX = rows - vision*2 + 1;
    }
    if (sightY < 0)
    {
      sightY = 0;
    }
    else if (sightY + vision*2 >= cols)
    {
      sightY = cols - vision*2 + 1;
    }
    if (walls[39][40]==vision*2)//End position for AI one
    {
        fill(0,180,180);
        rect(40*(width/rows),39*(height/cols),width/rows,height/cols);
    }
    for (int i = 0; i < vision*2+1; i++)
    {
      for(int j = 0; j < vision*2+1; j++)
      {
        
        if (walls[sightY+i][sightX+j] == 1)
        {
          fill(150,150,150);
          rect((sightX+j)*(width/rows),(sightY+i)*(height/cols),width/rows,height/cols);
        }
        else if (xpos == (sightX+j) && ypos == (sightY+i))
        {
          fill(255,0,0);
          rect(xpos*(width/rows), ypos*(height/cols),width/rows,height/cols);
        }
        else if (walls[sightY+i][sightX+j] == 0)
        {
          fill(255,255,255);
          rect((sightX+j)*(width/rows),(sightY+i)*(height/cols),width/rows,height/cols);
        }
        else if (walls[sightY+i][sightX+j] == 3)
        {
          fill(0,255,0);
          rect((sightX+j)*(width/rows),(sightY+i)*(height/cols),width/rows,height/cols);
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
          rect(j*(width/rows),i*(height/cols),width/rows,height/cols);
        }
        else if (walls[i][j]==0)
        {
          fill(255,255,255);
          rect(j*(width/rows),i*(height/cols),width/rows,height/cols);
          if (placed == false)
          {
            rect(0*(width/rows),0*(height/cols),width/rows,height/cols);
            placed = true;
          }
        }
        else if (walls[i][j]==3)
        {
          fill(0,255,0);
          rect(j*(width/rows),i*(height/cols),width/rows,height/cols);
        }
        else if (walls[i][j]==4)
        {
          fill(0,180,180);
          rect(j*(width/rows),i*(height/cols),width/rows,height/cols);
        }
      }
    }
  }
}
        