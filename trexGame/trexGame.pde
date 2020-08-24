Player b;
int score=0;
int highScore=0;
boolean safe=true;
PVector gravity = new PVector(0, 0.1);
ArrayList<Barrier> barriers = new ArrayList<Barrier>();
int wid = 1100;
PImage pl;
void setup()
{
  size(1100,400);
  b = new Player();
  pl = loadImage("snowball.png");
  
}

void draw(){
  rect(0, height-50, width, 15);
    if(random(1)<0.5&&frameCount % 60 == 0)
  {
    barriers.add(new Barrier()); 
  }
 if(keyPressed)
  {
    if(b.pos.y == height-170)
    {
      PVector up = new PVector(0,-100);
      b.applyForce(up);
      //jump=true;
    }
    
  }
  
 background(255,255,102); 
 b.update();
 b.show();

  for(int i=barriers.size()-1; i>=0; i--){
   
        Barrier p = barriers.get(i);
        p.update();
        if (p.hits(b))
        {
          p.show(true);
          safe=false;
        }
        else
        {
          p.show(false);
          safe=true;
        }
        
        if(p.x < -p.w)
        {
          barriers.remove(i);
        }
    
    
  }
  
  if(safe)
    {
      score++;
    }
    else
    {
      score=0;
      text("RESTART",width/2-300,50);
    }
    
    fill(16,53,201);
    textSize(32);
    score=constrain(score,0,score);
    text("Score",width/2-100,50);
    text(score,width/2,50);
    if(highScore < score)
    {
      highScore = score;
    }
    text(highScore,width/2+310,50);
    text("High Score",width/2+300-170,50);
  
}
