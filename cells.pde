class Cell {
  int x;
  int y;
  boolean on=false;
  boolean point;
  Cell(int _x, int _y) {
    x=_x;
    y=_y;
    point=x%2==0 && y%2==0;
  }
  void show() {
    if(on){
    pushMatrix();
    translate(cellSize*(x-xSize+1)+width/2, cellSize*(y-ySize+1)+height/2);
    drawCell(x,y);
    popMatrix();
    }
  }
  void fillIn() {
    if (point) {
      if ((find(x+1, y) && find(x-1, y)) || (find(x, y+1) && find(x, y-1))) {
        on=round(random(1))==1;
      } else {
        on=true;
      }
    }
  }
  void generate() {
    if (!point) {
      if (!find(x+1, y-1) && !find(x+1, y+1) && !find(x-1, y-1) && !find(x-1, y+1)) {
        on=round(random(1))==1;
      } else {
        on=false;
      }
    }
  }
}
  boolean find(int findX, int findY) {  
    if (findX<2*xSize-1 && findX>-1 && findY<2*ySize-1 && findY>-1) {
      for (Cell c : grid) {
        if (c.x==findX && c.y==findY) {
          return c.on;
        }
      }
    }
    return false;
  }
