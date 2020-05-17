import java.util.Collections;
ArrayList<Cell>grid=new ArrayList(0);
int xSize=3;
int ySize=40;
int cellSize;
void setup() {
  //size(600, 600,P2D);
  fullScreen(P2D);
  cellSize=min(width*2/3/2/xSize,height*2/3/2/ySize);
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

void draw() {
  background(0);
  colour=255;
  for (Cell c : grid) {
    //colour+=255/(3*xSize*ySize-ySize-xSize+2);
    fill(colour);
    stroke(colour);
    c.show();
  }
}
int colour;

void generate() {
  Collections.shuffle(grid);
  for(Cell c : grid){
    c.on=false;
  }
  for (Cell c : grid) {
    c.generate();
  }
  for (Cell c : grid) {
    c.fillIn();
  }
}

void keyPressed(){
 if(key==' '){
   generate();
 }
}
