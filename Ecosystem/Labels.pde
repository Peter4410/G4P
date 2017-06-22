class Labels {

  Label labs[][];
  float rG, cG, w1, w2, h1;

  Labels() {
    labs = new Label[2][];
    labs[0] = new Label[8];
    labs[1] = new Label[8];

    rG = 10;        //rowGap
    cG = 5;         //columnGap
    w2 = width - map.mapSize*map.scale - 150;
    w1 = (w2-cG)/2;
    h1 = 25;

    labs[0][0] = new Label(0, 0, w1, h1, "add 1 sheep", true);
    labs[0][1] = new Label(0, 1*(h1+rG), w1, h1, "add 10 sheep", true);
    labs[0][2] = new Label(0, 2*(h1+rG), w1, h1, "add 100 sheep", true);
    labs[0][3] = new Label(0, 3*(h1+rG), w1, h1, "add 1000 sheep", true);
    labs[0][4] = new Label(0, 4*(h1+rG), w1, h1, "remove 1 sheep", false);
    labs[0][5] = new Label(0, 5*(h1+rG), w1, h1, "remove 10 sheep", false);
    labs[0][6] = new Label(0, 6*(h1+rG), w1, h1, "remove 100 sheep", false);
    labs[0][7] = new Label(0, 7*(h1+rG), w1, h1, "remove 1000 sheep", false);

    labs[1][0] = new Label(w1+cG, 0, w1, h1, "add 1 wolf", true);
    labs[1][1] = new Label(w1+cG, 1*(h1+rG), w1, h1, "add 10 wolves", true);
    labs[1][2] = new Label(w1+cG, 2*(h1+rG), w1, h1, "add 100 wolves", true);
    labs[1][3] = new Label(w1+cG, 3*(h1+rG), w1, h1, "add 1000 wolves", true);
    labs[1][4] = new Label(w1+cG, 4*(h1+rG), w1, h1, "remove 1 wolf", false);
    labs[1][5] = new Label(w1+cG, 5*(h1+rG), w1, h1, "remove 10 wolves", false);
    labs[1][6] = new Label(w1+cG, 6*(h1+rG), w1, h1, "remove 100 wolves", false);
    labs[1][7] = new Label(w1+cG, 7*(h1+rG), w1, h1, "remove 1000 wolves", false);
  }

  void show() {

    pushMatrix();
    translate(50, 50);

    for (int i=0; i<2; i++) {
      for (int j=0; j<8; j++) {
        labs[i][j].show();
      }
    }
    popMatrix();
  }


  void click() {
    if (labs[0][0].mouseOver()) {
      addSheep(1);
    } else if (labs[0][1].mouseOver()) {
      addSheep(10);
    } else if (labs[0][2].mouseOver()) {
      addSheep(100);
    } else if (labs[0][3].mouseOver()) {
      addSheep(1000);
    } else if (labs[0][4].mouseOver()) {
      removeSheep(1);
    } else if (labs[0][5].mouseOver()) {
      removeSheep(10);
    } else if (labs[0][6].mouseOver()) {
      removeSheep(100);
    } else if (labs[0][7].mouseOver()) {
      removeSheep(1000);
    } else if (labs[1][0].mouseOver()) {
      addWolves(1);
    } else if (labs[1][1].mouseOver()) {
      addWolves(10);
    } else if (labs[1][2].mouseOver()) {
      addWolves(100);
    } else if (labs[1][3].mouseOver()) {
      addWolves(1000);
    } else if (labs[1][4].mouseOver()) {
      removeWolves(1);
    } else if (labs[1][5].mouseOver()) {
      removeWolves(10);
    } else if (labs[1][6].mouseOver()) {
      removeWolves(100);
    } else if (labs[1][7].mouseOver()) {
      removeWolves(1000);
    }
  }

  void addSheep(int n) {
    for (int i=0; i<n; i++) {
      sheeps.add(new Sheep());
    }
  }

  void removeSheep(int n) {
    for (int i=0; i<n; i++) {
      if (sheeps.size()==0) return;
      sheeps.remove(0);
    }
  }

  void addWolves(int n) {
    for (int i=0; i<n; i++) {
      wolves.add(new Wolf());
    }
  }

  void removeWolves(int n) {
    for (int i=0; i<n; i++) {
      if (wolves.size()==0) return;
      wolves.remove(0);
    }
  }
}