class Map {
  /*  Shows the actual status of grass, sheep and wolves
   *  in the picture frame on the right
   *  
   *  
   */

  int mapSize;
  int scale;
  float sheepR;
  float wolfR;
  float R;
  PShape sheepLS, sheepRS, wolfLS, wolfRS, sheepS, wolfS;

  Map(int scale_) {
    scale = scale_;
    mapSize  = (min(width, height)-100)/scale;
    sheepR = 3;
    wolfR = 5;
    R = 2*(wolfR+sheepR)/scale;
    sheepRS = loadShape("sheepR.svg");
    sheepLS = loadShape("sheepL.svg");
    sheepS = loadShape("sheepS.svg");
    wolfRS = loadShape("wolfR2.svg");
    wolfLS = loadShape("wolfL2.svg");
    wolfS = loadShape("wolfS.svg");
  }

  void show() {
    pushMatrix();    //save the coordinates
    translate(width-mapSize*scale-50, 50);  //shift coordinates to the map
    fill(0);
    text("size: "+mapSize+"x"+mapSize, 1, -10);
    text("scale: "+scale, 100, -10);
    noFill();                                //no color of map
    stroke(60, 100, 100);                    
    rect(-1, -1, mapSize*scale+1, mapSize*scale+1);
    noStroke();
    shapeMode(CENTER);
    fill(32, 100, 38, 75);
    rect(0, 0, mapSize*scale, mapSize*scale);
    for (int i=0; i<lawn.length; i+=1) {
      for (int j=0; j<lawn[i].length; j+=1) {
        fill(120, 100, 50, map(lawn[i][j].quantity, 0, lawn[i][j].maxGrass, 0, 80)); //green
        rect(i*scale, j*scale, scale*1, scale*1);
      }
    }
    switch(showVersion) {
    case 0 : 
      {
        for (Sheep s : sheeps) {
          fill(360);  //fill(0, 0, 100, s.fedForDays*50);
          ellipse(s.pos.x*scale, s.pos.y*scale, sheepR*scale, sheepR*scale);
        }
        for (Wolf w : wolves) {
          fill(250);  //fill(350, 100, 100, w.fedForDays*10);
          ellipse(w.pos.x*scale, w.pos.y*scale, wolfR*scale, wolfR*scale);
        }
        break;
      }
    case 1 : 
      {
        for (Sheep s : sheeps) {
          shape(sheepS, s.pos.x*scale, s.pos.y*scale, 10*scale, 10*scale);
        }
        for (Wolf w : wolves) {
          shape(wolfS, w.pos.x*scale, w.pos.y*scale, 10*scale, 10*scale);
        }
        break;
      }
    case 2 :
      {
        for (Sheep s : sheeps) {
          if (s.vel.x>0)shape(sheepRS, s.pos.x*scale, s.pos.y*scale, 10*scale, 10*scale);
          if (s.vel.x<=0)shape(sheepLS, s.pos.x*scale, s.pos.y*scale, 10*scale, 10*scale);
        }
        for (Wolf w : wolves) {
          if (w.vel.x>0)shape(wolfRS, w.pos.x*scale, w.pos.y*scale, 10*scale, 10*scale);
          if (w.vel.x<=0)shape(wolfLS, w.pos.x*scale, w.pos.y*scale, 10*scale, 10*scale);
        }
        break;
      }
    } 
    popMatrix();
  }
}
