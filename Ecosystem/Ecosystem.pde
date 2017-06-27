
  for (int i=0; i<initWolves; i++) wolves.add(new Wolf());
}
float initGrass  = 0;
int   initSheep  = 0;
int   initWolves = 0;

ArrayList<Wolf> wolves;
ArrayList<Sheep> sheeps;
  for (int i=0; i<initWolves; i++) wolves.add(new Wolf());
}
float initGrass  = 0;
int   initSheep  = 0;
int   initWolves = 0;

ArrayList<Wolf> wolves;
ArrayList<Sheep> sheeps;
Grass[][] lawn;

PrintWriter output;

Map map;
Graph graph;
Labels labels;

boolean showMap;
int showVersion;

void setup() {
  size(1200, 800);
  colorMode(HSB, 360, 100, 100);
  map = new Map(2);
  graph = new Graph(0.1);
  labels = new Labels();
  showMap = true;
  showVersion=0;
  
  output = createWriter("DataG4P.txt");
  output.println("year;day;numOfSheep;numOfWolves;avgOfGrass");

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
void draw() {
  background(259);

  updateWorld();
  graph.update();
  toText();

  graph.show();
  if (showMap)map.show();
  labels.show();
}

void toText() {
  //output.format("Year:%-2d day:%-3d sheeps:%-4d wolf:%-4d grass:%4f\n",frameCount/365,frameCount%365,sheeps.size(),wolves.size(),graph.avgOfGrass());
  String o = ""+frameCount/365+';'+frameCount%365+';'+sheeps.size()+';'+wolves.size()+';'+graph.avgOfGrass();
  output.println(o);
} 

void closeFile() {
  output.flush();
  output.close();
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
    if (wolves.get(i).dead()) {
      print("fed:"+wolves.get(i).fedForDays+" lifespan:"+wolves.get(i).lifespan+"/"+wolves.get(i).maxLifespan+"\t");
      wolves.remove(i);
    }
  }
}

void mouseClicked() {
  labels.click();
}

void keyPressed() {
  switch(key) {
  case 'q' : 
    {
      closeFile();
      exit();
      break;
    }
  case 'm' : 
    {
      showMap = !showMap;
      break;
    }
  }
}

Grass[][] lawn;

PrintWriter output;

Map map;
Graph graph;
Labels labels;

boolean showMap;
int showVersion;

void setup() {
  size(1200, 800);
  colorMode(HSB, 360, 100, 100);
  map = new Map(2);
  graph = new Graph(0.1);
  labels = new Labels();
  showMap = true;
  showVersion=0;
  
  output = createWriter("DataG4P.txt");
  output.println("year;day;numOfSheep;numOfWolves;avgOfGrass");

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
void draw() {
  background(259);

  updateWorld();
  graph.update();
  toText();

  graph.show();
  if (showMap)map.show();
  labels.show();
}

void toText() {
  //output.format("Year:%-2d day:%-3d sheeps:%-4d wolf:%-4d grass:%4f\n",frameCount/365,frameCount%365,sheeps.size(),wolves.size(),graph.avgOfGrass());
  String o = ""+frameCount/365+';'+frameCount%365+';'+sheeps.size()+';'+wolves.size()+';'+graph.avgOfGrass();
  output.println(o);
} 

void closeFile() {
  output.flush();
  output.close();
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
    if (wolves.get(i).dead()) {
      print("fed:"+wolves.get(i).fedForDays+" lifespan:"+wolves.get(i).lifespan+"/"+wolves.get(i).maxLifespan+"\t");
      wolves.remove(i);
    }
  }
}

void mouseClicked() {
  labels.click();
}

void keyPressed() {
  switch(key) {
  case 'q' : 
    {
      closeFile();
      exit();
      break;
    }
  case 'm' : 
    {
      showMap = !showMap;
      break;
    }
  }
}
