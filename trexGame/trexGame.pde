Player b; //The object that jumps the barriers
PImage pl; //Image for the player object

int score=0; // keeps track of current game score
int highScore=0; //Keeps track of High Score
boolean safe=true; // Keeps track of whether the player hit an obstruction
boolean start=false; //Keeps track of whether the game is going on

PVector gravity = new PVector(0, 0.1); //Pushes the player down on the ground (when it jumps)
ArrayList<Barrier> barriers = new ArrayList<Barrier>(); //List of Obstructions
int wid = 1100; //The width of our screen

void setup()
{
  size(1100,400); //Initialise a canvas
  b = new Player(); //initialise a player
  pl = loadImage("snowball.png"); //Load the image in the variable
  
}

void draw()
{
  
  if(start) 
    {
      //Add barriers at random distances such that 
      //minimum distance is 60 frames to make the 
      //game playable only if th game is in progress.
      if(random(1)<0.5&&frameCount % 60 == 0)
        {
          barriers.add(new Barrier()); 
        }
    }
    
    
   if(keyPressed)
    {
      start = true; //Start the game on pressing the key
      if(b.pos.y == height-170) //Jump only if the player is already on the ground
        {
          PVector up = new PVector(0,-100); //Defining an appropriate upward force
          b.applyForce(up); //Applying the upward force just defined
        }
      
    }
  
   background(255,255,102); //Set background to the yellow colour
   b.update(); //Update the player's position and speed
   b.show(); //Display the player

    //traverse and display the obstructions
    for(int i=barriers.size()-1; i>=0; i--)
    {
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
        
        //Remove the barriers that went out of frame
        if(p.x < -p.w)
          {
            barriers.remove(i);
          }
    }
  
  if(safe&&start) //Increment the score if game is going on smoothly
    {
      score++;
    }
  else
    {
      //Restart the game
      score=0;
      text("CLICK TO START",width/2-500,50);
      start=false; 
    }
    
    fill(16,53,201); //fill the text with colour for score
    textSize(32); //Set size for the score
    
    //Display score
    text("Score",width/2-100,50);
    text(score,width/2,50);
    
    //Set and display high score
    if(highScore < score)
    {
      highScore = score;
    }
    
    text(highScore,width/2+310,50);
    text("High Score",width/2+300-170,50);
  
}
