class Graph {
  /*  Shows the actual status of grass, sheep and wolves
   *  in the gpahs on the left
   *  ??? + contains buttons for control of entities 
   *
   */
   
  float[] grassPop;
  int[] sheepPop;
  int[] wolvesPop;
  int graphSize;
  float scale;
  int maxSheep;
  int maxWolves;
  
  
  Graph(float scale_) {
    scale = scale_;
    graphSize = floor((width-150-map.mapSize*map.scale)/scale);
    wolvesPop  = new int[graphSize];
    sheepPop = new int[graphSize];
    grassPop = new float[graphSize];
    
  }

  void update() {
    if(sheeps.size() > maxSheep) maxSheep = sheeps.size();
    if(wolves.size() > maxWolves) maxWolves = wolves.size();
    
    for(int i=0; i<graphSize-1; i++){ //shifts the graph to left
      wolvesPop[i] = wolvesPop[i+1];
      sheepPop[i] = sheepPop[i+1];
      grassPop[i] = grassPop[i+1];
    }
    //loads the current
    wolvesPop[graphSize-1]  = wolves.size();
    sheepPop[graphSize-1] = sheeps.size();
    grassPop[graphSize-1] = avgOfGrass();
    
  }

  void show() {
    pushMatrix(); //saves the coordinates
    translate(50, height-50-graphSize*scale);//shifts the coordinates
    stroke(0); //color of frame
    fill(360);
    rect(0,0,graphSize*scale,graphSize*scale);
    
    fill(0);
    textAlign(LEFT, CENTER);
    text("maxSheep:"+maxSheep, 0, -30); //displays the data
    text("maxWolves:"+maxWolves, 0, -10); //displays the data
    text("year: "+frameCount/365,150, -30);
    text("day: "+frameCount%365, 150, -10);
    
    
    //grass
    noFill();
    stroke(120,100,50);
    beginShape(); //starts at the first point 
    for(int i=0; i<graphSize; i++){
      vertex(i*scale, map(grassPop[i], 0, 100, graphSize*scale, 0));
    }
    endShape(); //connects with the end point
    fill(120,100,50);
    text(grassPop[graphSize-1],graphSize*scale+2,map(grassPop[graphSize-1], 0, 100, graphSize*scale, 0));
    
    //sheep
    noFill();
    stroke(250,100,100);
    beginShape();
    for(int i=0; i<graphSize; i++){
      vertex(i*scale, map(sheepPop[i], 0, maxSheep, graphSize*scale, 0));
    }
    endShape();
    fill(250,100,100);
    text(sheepPop[graphSize-1],graphSize*scale+2,map(sheepPop[graphSize-1], 0, maxSheep, graphSize*scale, 0));
    
    //wolves
    noFill();
    stroke(350,100,100);
    beginShape();
    for(int i=0; i<graphSize; i++){
      vertex(i*scale, map(wolvesPop[i], 0, maxWolves, graphSize*scale, 0));
    }
    endShape();
    fill(350,100,100);
    text(wolvesPop[graphSize-1],graphSize*scale+2,map(wolvesPop[graphSize-1], 0, maxWolves, graphSize*scale, 0));
    
    popMatrix();
  }
  
  float avgOfGrass(){ 
    float total = 0;
    for (int i=0; i<map.mapSize; i++) {
      for (int j=0; j<map.mapSize; j++) {
        total += lawn[i][j].quantity;        //adds all the quantity of grass together
      }
    }
    return total/sq(map.mapSize);            //calculates the average
  }
  
}