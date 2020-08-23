class Barrier {
  float bottom;
  float w = 40;
  float x;
  float barrier_speed = 3;
  
  Barrier()
  {
    bottom = random(150, 160);
    
    x = wid + w;
  }
  void update ()
  {
    x -= barrier_speed;
  }
  
  boolean hits(Player b)
  {
    return ((b.pos.x > x) && (b.pos.x < (x + wid))) &&  (b.pos.y > (height - bottom - b.r));
  }
  void show(boolean hit)
  {
    if(hit)
    {
      fill(217,74,30,127);
    }
    else
    {
      fill(65,224,129,127);
    }
    stroke(0,0,0);
    strokeWeight(2);
    rect(x, height - bottom, w, bottom-110);
  }
}
