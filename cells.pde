/**
 * Represents a connection, or an endpoint, in the grid.
 */
class Cell {
  /** Column position in the grid. 0-based index. */
  int x;
  /** Row position in the grid. 0-based index. */
  int y;
  /** Whether or not the cell is to be drawn. */
  boolean on=false;
  /** Whether or not this represents a point (or a link). */
  boolean point;

  /**
   * Construct a cell at a given point in the grid.
   * Cells at even rows and columns are point, the others are links.
   *
   * @param row The row in which this cell is located.
   * @param column The column in which this cell is located.
   */
  Cell(int row, int column) {
    x=row;
    y=column;
    point=x%2==0 && y%2==0;
  }

  /**
   * If the cell is "on", draw it at the appropriate position.
   */
  void show() {
    if (on) {
      pushMatrix();
      translate(cellSize*(x-xSize+1)+width/2, cellSize*(y-ySize+1)+height/2);
      drawCell(x, y);
      popMatrix();
    }
  }
  
  /**
   * If the cell represents a point, determine if it is connected to an adjacent point, 
   * and if so, set its "on" state randomly.
   * If it is not connected, set its "on" state to true (it will render as a circle).
   */
  void fillIn() {
    if (point) {
      if ((isOn(x+1, y) && isOn(x-1, y)) || (isOn(x, y+1) && isOn(x, y-1))) {
        on=round(random(1))==1;
      } else {
        on=true;
      }
    }
  }
  
  /**
   * If this cell represents a link, and none of the adjacent links are on, set 
   * its "on" state randomly.
   * If any of the adjacent links are on, set its "on" state to false.
   */
  void generate() {
    if (!point) {
      if (!(isOn(x+1, y-1) || isOn(x+1, y+1) || isOn(x-1, y-1) || isOn(x-1, y+1))) {
        on=round(random(1))==1;
      } else {
        on=false;
      }
    }
  }
}
