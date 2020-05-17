/**
 * Draw the cell at the given row and column.
 * 
 * @param row The row of the cell to be drawn.
 * @param column The column of the cell to be drawn.
 */
void drawCell(int row, int column) {
  // Count the number of adjacent cells which are "on".  
  int adjacentCells = int(isOn(row+1, column)) +
                      int(isOn(row-1, column)) +
                      int(isOn(row, column+1)) +
                      int(isOn(row, column-1));
  
  switch(adjacentCells) {
    // If there are no active adjacent cells, draw a circle.
    case(0):
      ellipse(0, 0, cellSize, cellSize);
      break;
    
    // If only one adjacent cell is active, figure out which one, 
    // and draw a rectangle to it.
    case(1):
      if (isOn(row+1, column)) {
        rect(cellSize/4, 0, cellSize/2, cellSize);
      } else if (isOn(row-1, column)) {
        rect(-cellSize/4, 0, cellSize/2, cellSize);
      } else if (isOn(row, column+1)) {
        rect(0, cellSize/4, cellSize, cellSize/2);
      } else if (isOn(row, column-1)) {
        rect(0, -cellSize/4, cellSize, cellSize/2);
      }
      ellipse(0, 0, cellSize, cellSize);
      break;
    
    // If this cell is in between two active cells,
    // draw a rectangle to bridge them.
    case(2):
      rect(0, 0, cellSize, cellSize);
      break;
  }
}
