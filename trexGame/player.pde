class Player{
  
  PVector pos; //This contains position of player
  PVector acc; //This contains acceleration of player
  PVector vel;  //This contains velocity of player

  float r=40; ////This contains radius of player object
  
  Player()
  {
    //initialise the player data members
    pos = new PVector(50,(height-200));
    vel = new PVector(0, 20);
    acc = new PVector();
  }


void applyForce(PVector force) 
  {
    acc.add(force); 
  }
  
  void update() 
  {
    applyForce(gravity); //applies downward gravity
    pos.add(vel); // in order to update pos wrt velocity
    if(pos.y >=height-170) 
    {
        pos.y=height-170;
        vel.mult(0);
    }
    else if(pos.y <=height-250)
    {
        //pos.y=height-115;
        vel.mult(0);
    }
    
    vel.add(acc); //in order to update the vel as per acc
    vel.limit(4); // in order to cap the vel for a smooth run
   
    acc.mult(0);
  }
  
  void show()
  {
    fill(255,0,34);
    stroke(0,0,0);
    strokeWeight(2);
    imageMode(CORNER); 
    image(pl, pos.x,pos.y,r*2,r*2);
    
  }
}
