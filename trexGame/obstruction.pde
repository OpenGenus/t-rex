class Barrier 
{
  float bottom; //This contains height of barriers
  float w = 40; //This contains width of barriers
  float x; //This contains x location of the barrier
  float barrier_speed = 3; //This is the rate of change in position of barrier
  
  Barrier()
  {
    bottom = random(150, 160); //Set value of height of barrier
    x = wid + w; //Increase the x location by with
  }
  void update ()
  {
    //if the game is going on modify barrier x-locations if the game is going on
    if(start)
    {
      x -= barrier_speed; 
    }
  }
  
  //Check for collision, if locations of the player and the pipe is overla
  boolean hits(Player b)
  {
    return ((b.pos.x > x) && (b.pos.x < (x + wid))) &&  (b.pos.y > (height - bottom - b.r));
  }
  void show(boolean hit)
  {
    
      if(start) //display barriers if game is in progress
      {
          if(hit)
          {
            //fill red if we hit the barrier
            fill(217,74,30,127);
          }
          else
          {
            //fill green normally
            fill(65,224,129,127);
          }
        stroke(0,0,0);
        strokeWeight(2);
        rect(x, height - bottom, w, bottom-110);
      
      }
    
  }
}
