class Grass {
  /*  area    = 10m2
   *  density = 2.6kg
   *  growth  = 0.2kg/10m2/day
   *
   */
   
  float quantity; // 0 to 100
  float rateOfGrowth;
  float maxGrass;
  
  Grass() {
    quantity = initGrass*random(-0.1,0.1)+initGrass; //initial grass
    rateOfGrowth = 0.2;        //rate of growth per frame
    maxGrass = 5.1;
  }

  void update() { //if there is more grass than max, it equals max
    quantity += rateOfGrowth;
    if(quantity>maxGrass) quantity = maxGrass; 
  }

}
