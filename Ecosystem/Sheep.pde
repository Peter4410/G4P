class Sheep {
  /*  How much 1m x 1m of grass (1 pixel) does sheep need to eat a day?
   *
   *
   *
   */

  float fedForDays;
  float fedFromFood;
  float fedThreshold;

  float lifespan;
  float maxLifespan;

  float birthCycle;

  PVector pos;
  PVector vel;
  float maxVel;
  PVector acc;

  //consume 100m^2 a week

  Sheep(PVector pos_, float fedForDays_) {
    fedForDays = fedForDays_;
    fedFromFood = 1.5;
    fedThreshold = 1;

    lifespan = 0;
    maxLifespan = 12 * 365;

    birthCycle = 267;

    pos = pos_;
    vel = PVector.random2D();
    acc = new PVector(0, 0);
    maxVel = 1;
  }

  Sheep() {
    this(new PVector(random(map.mapSize), random(map.mapSize)), random(1.5));
    lifespan = random(maxLifespan);
    birthCycle = random(birthCycle);
  }

  void update() {
    move();
    out();

    eatGrass();
    birth();

    ++lifespan;
    --birthCycle;
    --fedForDays;
  }

  void move(){
    pos.add(vel);
    vel.add(acc);
    vel.limit(maxVel);
    acc.set(PVector.random2D());
    acc.mult(0.1);
  }
  
  void out() {
    if (pos.x<=1) {
      vel.set(-vel.x, vel.y);
      pos.set(1, pos.y);
      return;
    } else if (pos.y<=1) {
      vel.set(vel.x, -vel.y);
      pos.set(pos.x, 1);
      return;
    } else if (pos.x>=map.mapSize-1) {
      vel.set(-vel.x, vel.y);
      pos.set(map.mapSize - 1, pos.y);
      return;
    } else if (pos.y>=map.mapSize-1) {
      vel.set(vel.x, -vel.y);
      pos.set(pos.x, map.mapSize-1);
      return;
    }
  }

  void eatGrass() {
    if (fedForDays<fedThreshold && lawn[floor(pos.x)][floor(pos.y)].quantity>=fedFromFood) {
      fedForDays += fedFromFood;
      lawn[floor(pos.x)][floor(pos.y)].quantity -= fedFromFood*10;
    }
  }

  boolean dead() {
    return fedForDays<=0 || lifespan>=maxLifespan;
  }

  void birth() {
    if (birthCycle<0 && fedForDays>fedThreshold) {
      sheeps.add(new Sheep(pos, fedForDays/2));
      fedForDays /= 2;
      birthCycle = 267;
    }
  }
}