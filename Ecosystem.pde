float initGrass  = 50;
int   initSheep  = 500;
int   initWolves = 10;

ArrayList<Wolf> wolves;
ArrayList<Sheep> sheeps;
Grass[][] lawn;

PrintWriter output;

Map map;
Graph graph;
Labels labels;

void setup() {
  size(1000, 700);
  colorMode(HSB, 360, 100, 100);
  map = new Map(2);
  graph = new Graph(1);
  labels = new Labels();
  
  output = createWriter("DataG4P.txt");

  lawn = new Grass[map.mapSize][map.mapSize];
  sheeps = new ArrayList();
  wolves = new ArrayList();

  //Add grass
  for (int i=0; i<map.mapSize; i++) {
    for (int j=0; j<map.mapSize; j++) {
      lawn[i][j] = new Grass();
    }
  }
  //Add sheep
  for (int i=0; i<initSheep; i++) sheeps.add(new Sheep());
  //Add wolves
  for (int i=0; i<initWolves; i++) wolves.add(new Wolf());
}

void draw() {
  background(259);

  updateWorld();
  graph.update();
  toText();

  graph.show();
  map.show();
  labels.show();
}

void toText() {
  output.format("Year:%-2d day:%-3d sheeps:%-4d wolf:%-4d grass:%4f",frameCount/365,frameCount%365,sheeps.size(),wolves.size(),graph.avgOfGrass());
} 

void closing() {
  output.flush();
  output.close();
  exit();
}

void updateWorld() {
  for (int i=0; i<map.mapSize; i++) {
    for (int j=0; j<map.mapSize; j++) {
      lawn[i][j].update();
    }
  }
  for (int i = 0; i<sheeps.size(); i++) {
    sheeps.get(i).update();
  }
  for (int i = 0; i < wolves.size(); i++) {
    wolves.get(i).update();
  }

  for (int i=sheeps.size()-1; i>=0; i--) {
    if (sheeps.get(i).dead()) sheeps.remove(i);
  }
  for (int i=wolves.size()-1; i>=0; i--) {
    if (wolves.get(i).dead()) wolves.remove(i);
  }
}

void mouseClicked(){
  labels.click();
}

void keyPressed() {
  switch(key) {
  case '1'  : 
    {
      sheeps.add(new Sheep()); 
      break;
    }
  case '2'  : 
    {
      for (int i = 0; i < 10; i++) { 
        sheeps.add(new Sheep());
      } 
      break;
    }
  case '3'  : 
    {
      for (int i = 0; i < 100; i++) { 
        sheeps.add(new Sheep());
      } 
      break;
    }
  case '4' :  
    {
      for (int i = 0; i < 1000; i++) { 
        sheeps.add(new Sheep());
      } 
      break;
    }
  case '5' : 
    {
      wolves.add(new Wolf()); 
      break;
    }
  case '6' : 
    {
      for (int i = 0; i < 10; i++) { 
        wolves.add(new Wolf());
      } 
      break;
    }
  case '7' : 
    {
      for (int i = 0; i < 100; i++) { 
        wolves.add(new Wolf());
      } 
      break;
    }
  case '8' : 
    {
      for (int i = 0; i < 1000; i++) { 
        wolves.add(new Wolf());
      } 
      break;
    }
  case '9' : 
    {
      if (sheeps.size() > 2) {
        for (int i = 0; i < 1; i++) {
          sheeps.remove(i);
        }
      } 
      break;
    }
  case '0' : 
    {
      if (sheeps.size() > 20) {
        for (int i = 0; i < 10; i++) {
          sheeps.remove(i);
        }
      } 
      break;
    }
  case 'a' : 
    {
      if (sheeps.size() > 200) {
        for (int i = 0; i < 100; i++) {
          sheeps.remove(i);
        }
      } 
      break;
    }
  case 'b' : 
    {
      if (sheeps.size() > 2000) {
        for (int i = 0; i < 1000; i++) {
          sheeps.remove(i);
        }
      } 
      break;
    }
  case 'c' : 
    {
      if (wolves.size() > 2) {
        for (int i = 0; i < 1; i++) {
          wolves.remove(i);
        }
      } 
      break;
    }
  case 'd' : 
    {
      if (wolves.size() > 20) {
        for (int i = 0; i < 10; i++) {
          wolves.remove(i);
        }
      } 
      break;
    }
  case 'e' : 
    {
      if (wolves.size() > 200) {
        for (int i = 0; i < 100; i++) {
          wolves.remove(i);
        }
      } 
      break;
    }
  case 'f' : 
    {
      if (wolves.size() > 2000) {
        for (int i = 0; i < 1000; i++) {
          wolves.remove(i);
        }
      } 
      break;
    }
  case 'q' : 
    {
      closing(); 
      break;
    }
  }
}