import java.util.*;

/** The collection of cells which make up the grid.*/
List<Cell> grid = new ArrayList(0);
/** The number of columns in the code. */
int xSize=4;
/** The number of rows of the code. */
int ySize=4;
/** The number of pixels of a cell.*/
int cellSize;

/**
 * Scale the grid to 2/3 of the smallest dimention of the window.   
 */
void setup() {
  size(600, 600, P2D);
  //fullScreen(P2D);
  cellSize=min(width*2/3/2/xSize, height*2/3/2/ySize);
  rectMode(CENTER);
  for (int x=0; x<2*xSize-1; x++) {
    for (int y=0; y<2*ySize-1; y++) {
      if ((x%2==0 || y%2==0)) {
        grid.add(new Cell(x, y));
      }
    }
  }
  generate();
}

/**
 * Main draw loop.
 * Tell each cell to draw itself.
 */
void draw() {
  background(0);
  colour=255;
  for (Cell c : grid) {
    //colour+=255/(3*xSize*ySize-ySize-xSize+2);
    fill(colour);
    stroke(colour);
    c.show();
  }
  noLoop();
}
int colour;

/**
 * Randomize the grid, resets all the cells, goes through it setting the links, and fills in the verticies. 
 */
void generate() {
  Collections.shuffle(grid);
  for (Cell c : grid) {
    c.on=false;
  }
  for (Cell c : grid) {
    c.generate();
  }
  for (Cell c : grid) {
    c.fillIn();
  }
}

/**
 * When the space key is pressed, generate a new code.
 */
void keyPressed() {
  if (key==' ') {
    generate();
    loop();
  }
}

/**
 * Locate the cell at the given row and column,
 * and return its "on" state.
 *
 * @param row The row in which to locate the cell.
 * @param column The column in which to locate the cell.
 * @return {@code true} if there cell is a cell at the given row and column,
 *   and it is "on". {@code false} if the cell was found, but it was not "on", 
 *   or if the cell could not be found. 
 */
boolean isOn(int row, int column) {  
  if (row<2*xSize-1 && row>-1 && column<2*ySize-1 && column>-1) {
    for (Cell c : grid) {
      if (c.x==row && c.y==column) {
        return c.on;
      }
    }
  }
  return false;
}

void blur(){
  
  
  
}
