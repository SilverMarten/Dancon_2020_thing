void drawCell(int x,int y){
    int xPos=int(find(x+1, y))+int(find(x-1, y))+int(find(x, y+1))+int(find(x, y-1));
    switch(xPos){
     case(0):
     ellipse(0,0,cellSize,cellSize);
     break;
     case(1):
     if(find(x+1, y)){
       rect(cellSize/4,0,cellSize/2,cellSize);
     }else if(find(x-1, y)){
       rect(-cellSize/4,0,cellSize/2,cellSize);
     }else if(find(x, y+1)){
       rect(0,cellSize/4,cellSize,cellSize/2);
     }else if(find(x, y-1)){
       rect(0,-cellSize/4,cellSize,cellSize/2);
     }
     ellipse(0,0,cellSize,cellSize);
     break;
     case(2):
     rect(0,0,cellSize,cellSize);
     break;
    }
}
