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
  PShape sheepLS, sheepRS, wolfLS, wolfRS, sheepS;

  Map(int scale_) {
    scale = scale_;
    mapSize  = (min(width, height)-100)/scale;
    sheepR = 3;
    wolfR = 5;
    R = (wolfR+sheepR)/scale;
    sheepRS = loadShape("sheepR.svg");
    sheepLS = loadShape("sheepL.svg");
    sheepS = loadShape("sheepS.svg");
    wolfRS = loadShape("wolfR.svg");
    wolfLS = loadShape("wolfL.svg");
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
    for (int i=0; i<lawn.length; i++) {
      for (int j=0; j<lawn[i].length; j++) {
        fill(120, 100, 50, lawn[i][j].quantity); //green
        rect(i*scale, j*scale, scale, scale);
        fill(32, 100, 38, 100 - lawn[i][j].quantity);  //brown
        rect(i*scale, j*scale, scale, scale);
      }
    }
    for (Sheep s : sheeps) {
      if (sheeps.size()<250) {
        if (s.vel.x>0)shape(sheepRS, s.pos.x*scale, s.pos.y*scale, 10*scale, 10*scale);
        if (s.vel.x<=0)shape(sheepLS, s.pos.x*scale, s.pos.y*scale, 10*scale, 10*scale);
      } else if (sheeps.size()<1000) {
        shape(sheepS, s.pos.x*scale, s.pos.y*scale, 10*scale, 10*scale);
      } else {
        fill(360);  //fill(0, 0, 100, s.fedForDays*50);
        ellipse(s.pos.x*scale, s.pos.y*scale, sheepR*scale, sheepR*scale);
      }
    }
    for (Wolf w : wolves) {
      if (wolves.size()<250) {
        if (w.vel.x>0)shape(wolfRS, w.pos.x*scale, w.pos.y*scale, 10*scale, 10*scale);
        if (w.vel.x<=0)shape(wolfLS, w.pos.x*scale, w.pos.y*scale, 10*scale, 10*scale);
      } else {
        fill(250);  //fill(350, 100, 100, w.fedForDays*10);
        ellipse(w.pos.x*scale, w.pos.y*scale, wolfR*scale, wolfR*scale);
      }
    }
    popMatrix();
  }
}