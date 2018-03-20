int ROWS,COLUMNS,CELL_SIZE;
Cell[][] grid;
ArrayList<Cell> stack = new ArrayList<Cell>();
ArrayList<Cell> visit = new ArrayList<Cell>();
Cell current;

void setup()
{
  size(600,600);
  smooth(4);
  strokeCap(ROUND);
  
  ROWS = 20;
  COLUMNS = 20;
  CELL_SIZE = max(width/ROWS,height/COLUMNS);
  grid = new Cell[ROWS][COLUMNS];
  
  for(int i = 0; i < ROWS; i++)
  {
    for(int j = 0; j < COLUMNS; j++)
    {
      grid[i][j] = new Cell(i,j);
    }
  }
  
  for(int i = 0; i < ROWS; i++)
  {
    for(int j = 0; j < COLUMNS; j++)
    {
      grid[i][j].add_neighbors();
    }
  }
  
  current = grid[0][0];
  current.visited = true;
  current.current = true;
  visit.add(current);
}

void draw()
{
  background(60);
  draw_grid();
  
  if(visit.size() < ROWS*COLUMNS)
  {
    if(current.check_neighbors())
    {
      Cell chosen = current.pick_neighbor();
      
      stack.add(current);
      current.stacked = true;
      
      if(chosen.i - current.i == 1)
      {
        current.walls[1] = false;
        chosen.walls[3] = false;
      }
      else if(chosen.i - current.i == -1)
      {
        current.walls[3] = false;
        chosen.walls[1] = false;
      }
      else if(chosen.j - current.j == 1)
      {
        current.walls[2] = false;
        chosen.walls[0] = false;
      }
      else
      {
        current.walls[0] = false;
        chosen.walls[2] = false;
      }
      
      current.current = false;
      current = chosen;
      current.current = true;
      current.visited = true;
    }
    
    else if(stack.size()>0)
    {
      current.current = false;
      current = stack.remove(stack.size()-1);
      current.stacked = false;
      current.current = true;
    }
  }
    
}

void draw_grid()
{
  for(int i = 0; i < ROWS; i++)
  {
    for(int j = 0; j < COLUMNS; j++)
    {
      grid[i][j].draw_cell();
    }
  }
}
