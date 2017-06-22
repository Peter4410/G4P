class Grass {
  /*  grass is 1m x 1m
   *  density?
   *  How fast can 1m x 1m of grass regrow?
   *
   */
   
  float quantity; // 0 to 100
  float rateOfGrowth = 10;
  float maxGrass;
  
  Grass() {
    quantity = initGrass*random(-0.1,0.1)+initGrass; //initial grass
    rateOfGrowth = 0.1;        //rate of growth per frame
    maxGrass = 100;
  }

  void update() { //if there is more grass than max, it equals max
    quantity += rateOfGrowth;
    if(quantity>maxGrass) quantity = maxGrass; 
  }

}