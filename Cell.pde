class Cell
{
  int i,j;
  boolean visited;
  boolean stacked;
  boolean current;
  boolean[] walls;
  ArrayList<Cell> neighbors;
  
  Cell(int pi, int pj)
  {
    i = pi;
    j = pj;
    visited = false;
    stacked = false;
    current = false;
    walls = new boolean[]{true,true,true,true};    //[top,right,bottom,left]
  }
  
  void add_neighbors()
  {
    neighbors = new ArrayList<Cell>();
    if(i>0){neighbors.add(grid[i-1][j]);}
    if(i<ROWS-1){neighbors.add(grid[i+1][j]);}
    if(j>0){neighbors.add(grid[i][j-1]);}
    if(j<COLUMNS-1){neighbors.add(grid[i][j+1]);}
  }
  
  boolean check_neighbors()
  {
    for(Cell neighbor : neighbors)
    {
      if(!neighbor.visited){return true;}
    }
    return false;
  }
  
  Cell pick_neighbor()
  {
    ArrayList<Cell> unvisited = new ArrayList<Cell>();
    for(Cell neighbor : neighbors)
    {
      if(neighbor.visited == false){unvisited.add(neighbor);}
    }
    return unvisited.get(floor(random(unvisited.size())));
  }
  
  void draw_cell()
  {
    noStroke();
    noFill();
    if(current){fill(34,237,89);}
    else if(stacked){fill(114,160,250);}
    else if(visited){fill(220);}
    rect(j*CELL_SIZE,i*CELL_SIZE,CELL_SIZE,CELL_SIZE);
  }
  
  void draw_walls()
  {
    stroke(150);
    strokeWeight(5);
    if(walls[0])
    {
      line(j*CELL_SIZE,i*CELL_SIZE,j*CELL_SIZE,(i+1)*CELL_SIZE);
    }
    if(walls[1])
    {
      line(j*CELL_SIZE,(i+1)*CELL_SIZE,(j+1)*CELL_SIZE,(i+1)*CELL_SIZE);
    }
    if(walls[2])
    {
      line((j+1)*CELL_SIZE,(i+1)*CELL_SIZE,(j+1)*CELL_SIZE,i*CELL_SIZE);
    }
    if(walls[3])
    {
      line((j+1)*CELL_SIZE,i*CELL_SIZE,j*CELL_SIZE,i*CELL_SIZE);
    }
  }
}
