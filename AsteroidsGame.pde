//your variable declarations here
SpaceShip bob;
Rocket rocket;
ArrayList <Asteroids> asteroidBelt;
ArrayList <Bullet> bullets;
int score = 0;
int health = 5000;
Health pack;
boolean gameOver = false;
boolean win = false;

public void setup() 
{
  size(850, 850);
  bob = new SpaceShip();
  rocket = new Rocket();
  pack = new Health();
 asteroidBelt = new ArrayList <Asteroids>(); 

 for (int i = 0; i < 20; i ++)
 {
  asteroidBelt.add(i, new Asteroids());
 }



 bullets = new ArrayList <Bullet>();
}
 
public void draw() 
{

  if(gameOver == true && win == false)
  {
    fill(0);
    rect(-5, -5, 1000, 1000);
    fill(255);
    textAlign(CENTER);
    textSize(80);
    text("Game Over", 425, 425);
    text("Score: " + score, 425, 500);
  }
  else if (win == true)
  {
    fill(0);
    rect(0, 0, 1000, 1000);
    fill(255);
    textAlign(CENTER);
    textSize(90);
    text("You win!", 425, 425);
    textSize(75);
    text("Score: " + score, 425, 525);
  }
  else {
  background(0);
  rocket.move();
  {
  }

  bob.move();
  bob.show(); 

  for(int nI = 0; nI < asteroidBelt.size(); nI++)
  {
    asteroidBelt.get(nI).show();
    asteroidBelt.get(nI).move(); 
  }


  //ship colliding with asteroids
  for(int nI = asteroidBelt.size()-1; nI >= 0; nI--)
  {
    if(dist(bob.getX(), bob.getY(), asteroidBelt.get(nI).getX(), asteroidBelt.get(nI).getY()) < 20)
    {
      health = health - 100;
      asteroidBelt.remove(nI);
    } 
  }
  
  int healthColor;

  //bullet colliding with asteroids
  for(int aI = asteroidBelt.size()-1; aI >= 0; aI--)
  {
    for (int bI = bullets.size() - 1; bI >= 0; bI --)
    {
      if(dist(bullets.get(bI).getX(), bullets.get(bI).getY(), asteroidBelt.get(aI).getX(), asteroidBelt.get(aI).getY()) < 15)
      {
        score = score + 10;
        bullets.remove(bI);
        if(asteroidBelt.get(aI).getColor() == color(220))
        {
          asteroidBelt.get(aI).setColor(150);
        }
        else if(asteroidBelt.get(aI).getColor() == color(150))
        {
           asteroidBelt.get(aI).setColor(80);
        }
        else
        {
          asteroidBelt.remove(aI);
        }
        break;
      }  
    }
  }

  for(int nI = 0; nI < bullets.size(); nI++)
  {
    bullets.get(nI).show();
    bullets.get(nI).move(); 
  }


  fill(255);
  textSize(24);
  int shipColor;
  text("Score: " + score, 10, 30);
 
  if(health <= 0)
  {
    gameOver = true;
  }

  if(asteroidBelt.size() == 0)
  {
    win = true;
  } 
  
  }

if(dIsPressed == true)
{
  bob.rotate(10);
  rocket.rotate(10);  
}
if(aIsPressed == true)
{
  bob.rotate(-10);
  rocket.rotate(-10);
}
if(wIsPressed == true)
{    
  rocket.accelerate(0.1);    
  bob.accelerate(0.1);  
}

}
boolean dIsPressed;
boolean aIsPressed;
boolean wIsPressed;
public void keyPressed()
{

  if(gameOver == false)
  {
    if (key == 'a')
    {
      aIsPressed = true;
    }

    if (key == 'd')
    {
      dIsPressed = true;
    }

    if(key == 'w')
    {
      wIsPressed = true;
    }
    
    if(key == 'h')
    {
      int randPointDirection = (int)(Math.random()*360);
      int randSetX = (int)(Math.random()*801);
      int randSetY = (int)(Math.random()*801);     
      bob.setDirectionX(0);
      bob.setDirectionY(0);    
      bob.setPointDirection(randPointDirection);
      bob.setX(randSetX);
      bob.setY(randSetY);
      rocket.setDirectionX(0);
      rocket.setDirectionY(0);    
      rocket.setPointDirection(randPointDirection);
      rocket.setX(randSetX);
      rocket.setY(randSetY);
    }

    if (key == 's')
    {
      bob.accelerate(-0.5);
      rocket.accelerate(-0.5);
    }

   if (key == ' ')
    {
      for(int i = 0; i < 1; i++)
      {
        bullets.add(i, new Bullet(bob));
      }
    }

  }
}

public void keyReleased()
{
  if (key == 'd')
  {
    dIsPressed = false;
  } 

  if (key == 'a')
  {
    aIsPressed = false;
  }

  if (key == 'w')
  {
    wIsPressed = false;
  }
}

class SpaceShip extends Floater  
{
    public SpaceShip()
    {
      corners = 9;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0]= -8;
      yCorners[0] = -10;
      xCorners[1]= -10;
      yCorners[1] = -10;
      xCorners[2]= -10;
      yCorners[2] = -8;
      xCorners[3]= -8;
      yCorners[3] = -8;
      xCorners[4]= -8;
      yCorners[4] = 8;
      xCorners[5]= -10;
      yCorners[5] = 8;
      xCorners[6]= -10;
      yCorners[6] = 10;
      xCorners[7]= -6;
      yCorners[7] = 10;
      xCorners[8]= 16;
      yCorners[8] = 0;

      myCenterX = 425;
      myCenterY = 425;

      myDirectionX = 0;
      myDirectionY = 0;

      myColor = color(255,0,0);

      myPointDirection = 0;
    }


  public void setX(int x) {myCenterX = x;}    
  public int getX() {return (int)myCenterX;} 
  public void setY(int y) {myCenterY = y;}    
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}
}

public class Rocket extends Floater
{
  public Rocket()
  {
    corners = 3;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0]= -13;
    yCorners[0] = -7;
    xCorners[1]= -13;
    yCorners[1] = 7;      
    xCorners[2]= -20;
    yCorners[2] = 0;

    myCenterX = 425;
    myCenterY = 425;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
    myColor = color(255, 0, 0);        
  }

  public void setX(int x) {myCenterX = x;}    
  public int getX() {return (int)myCenterX;}   
  public void setY(int y) {myCenterY = y;}    
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}
}

public class Star
{
  private int myX, myY;
  public Star()
  {
    myX = (int)(Math.random()*851);
    myY = (int)(Math.random()*851);
  }

  public void show()
  {
    fill((int)((Math.random()*256)+100), (int)((Math.random()*256)+100), (int)((Math.random()*256)+100));
    noStroke();
    ellipse(myX, myY, 2, 2);
  }
}

public class Asteroids extends Floater
{
  private int rotSpeed;
  public Asteroids()
  {
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -11;
    yCorners[0] = -8;
    xCorners[1] = (int)(Math.random()*9)+6;
    yCorners[1] = -10;
    xCorners[2] = (int)(Math.random()*11)+9;
    yCorners[2] = 0;
    xCorners[3] = (int)(Math.random()*8)+5;
    yCorners[3] = (int)(Math.random()*10)+9;
    xCorners[4] = -11;
    yCorners[4] = (int)(Math.random()*9)+7;
    xCorners[5] = -13;
    yCorners[5] = 0;

    myCenterX = (int)(Math.random()*800);
    myCenterY = (int)(Math.random()*800);

    myDirectionX = (Math.random()*3)-1;
    myDirectionY = (Math.random()*3)-1;

    myColor = color(0,250,0);

    myPointDirection = (int)(Math.random()*360);

    rotSpeed = (int)((Math.random()*2)-3);
  }
  public void setColor(int x) {myColor = color(x);}
  public int getColor() {return myColor;}

  public void setX(int x) {myCenterX = x;}    
  public int getX() {return (int)myCenterX;}   
  public void setY(int y) {myCenterY = y;}    
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}

  public void move()
  {
    rotate(rotSpeed);
    super.move();
  }
}

public class Health extends Floater
{
  private int rotSpeed;
  public Health()
  {
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 10;
    yCorners[0] = -10;

    xCorners[1] = -10;
    yCorners[1] = -10;

    xCorners[2] = -10;
    yCorners[2] = 10;

    xCorners[3] = 10;
    yCorners[3] = 10;

    myCenterX = (int)(Math.random()*840)+10;
    myCenterY = (int)(Math.random()*840)+10;

    myDirectionX = 0.5;
    myDirectionY = 0.5;

    myColor = color(10, 255, 10);

    rotSpeed = 1;
    myPointDirection = (int)(Math.random()*360);
  }


  public void setX(int x) {myCenterX = x;}    
  public int getX() {return (int)myCenterX;}   
  public void setY(int y) {myCenterY = y;}    
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}
  public void setColor(int x) {myColor = color(x);}
  public int getColor() {return myColor;}

  public void move()
  {
    rotate(rotSpeed);
    super.move();
  }
}

public class Bullet extends Floater
{
  public Bullet(SpaceShip theShip)
  {
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myPointDirection = theShip.getPointDirection();
    double dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5*Math.cos(dRadians) + theShip.myDirectionX;
    myDirectionY = 5*Math.sin(dRadians) + theShip.myDirectionY;
  }

  public void show()
  {
    noStroke();
    fill(255);
    ellipse((float)myCenterX, (float)myCenterY, 4, 4);
  
  }

  public void move()
  {
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;   
  }

  public void setX(int x) {myCenterX = x;}    
  public int getX() {return (int)myCenterX;}   
  public void setY(int y) {myCenterY = y;}    
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

