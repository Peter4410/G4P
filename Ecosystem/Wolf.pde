class Wolf {
  /*  How many days can wolf last from 1 sheep
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

  
  Wolf(PVector pos_, float fedForDays_) {
    fedForDays = fedForDays_;
    fedFromFood = 11;
    fedThreshold = 10;

    lifespan = 0;
    maxLifespan = 7 * 365;

    birthCycle = 487;

    pos = pos_;
    vel = PVector.random2D();
    acc = new PVector(0, 0);
    maxVel = 10;
  }
  
  Wolf(){
    this(new PVector(random(map.mapSize), random(map.mapSize)), random(5)+6);
    lifespan = random(maxLifespan);
    birthCycle = random(birthCycle);
  }
  

  void update() {
    move();
    out();

    eatSheep();
    birth();

    ++lifespan;
    --birthCycle;
    --fedForDays;
  }
  
  void move() { 
    pos.add(vel);
    vel.add(acc);
    vel.limit(maxVel);
    acc.set(seekForce());
  }

  void out() {
    if (pos.x<=0) {
      vel.set(-vel.x, vel.y);
      pos.set(0, pos.y);
      return;
    } else if (pos.y<=0) {
      vel.set(vel.x, -vel.y);
      pos.set(pos.x, 0);
      return;
    } else if (pos.x>=map.mapSize) {
      vel.set(-vel.x, vel.y);
      pos.set(map.mapSize, pos.y);
      return;
    } else if (pos.y>=map.mapSize) {
      vel.set(vel.x, -vel.y);
      pos.set(pos.x, map.mapSize);
      return;
    }
  }

  boolean dead() {
    return fedForDays<=0 || lifespan >= maxLifespan;
  }

  void eatSheep() {
    if (fedForDays<fedThreshold) {
      for (int i=sheeps.size()-1; i>=0; i--) {
        Sheep s = sheeps.get(i);
        if (dist(pos.x, pos.y, s.pos.x, s.pos.y)<map.R) {
          sheeps.remove(i);
          fedForDays += fedFromFood;
          break;
        }
      }
    }
  }
  
  void birth() {
    if (birthCycle<0 && fedForDays>=fedThreshold) {
      wolves.add(new Wolf(pos, fedForDays/2));
      fedForDays /= 2;
      birthCycle = 365/5*48;
    }
  }
  
  PVector seekForce() {
    PVector force;
    
    Sheep closest = findClosest();
    if(closest==null) return new PVector();
    
    PVector start = new PVector(0, 0);
    start.add(pos);
    start.add(vel);
    PVector end = new PVector(0, 0);
    end.add(closest.pos);

    force = end.sub(start);
    force.setMag(map(fedForDays, 0, fedThreshold, 10, 2));

    return force;
  }
  
  Sheep findClosest() {
    if (sheeps.size()==0) return null;
    float closestDist = dist(this.pos.x, this.pos.y, sheeps.get(1).pos.x, sheeps.get(1).pos.y);
    int closestSheep = 0;
    for (int i = 1; i < sheeps.size(); i++) {
      float current = dist(this.pos.x, this.pos.y, sheeps.get(i).pos.x, sheeps.get(i).pos.y);
      if (current < closestDist) {
        closestDist = current;
        closestSheep = i;
      }
    }
    return sheeps.get(closestSheep);
  }
  
}
