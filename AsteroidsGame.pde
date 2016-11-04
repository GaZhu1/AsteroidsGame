//your variable declarations here
SpaceShip bob;
Star [] spaceStars = new Star[250];
Rocket rocket;
Asteroids [] rocks = new Asteroids[20];
public void setup() 
{
  size(800, 800);
  bob = new SpaceShip();
  rocket = new Rocket();
  for (int i = 0; i < spaceStars.length; i ++)
  {
    spaceStars[i] = new Star();
  }

    for (int i = 0; i < rocks.length; i ++)
  {
    rocks[i] = new Asteroids();
  }
}

public void draw() 
{
  background(0);
  rocket.move();
  for (int i = 0; i < spaceStars.length; i ++)
  {
    spaceStars[i].show();
  }
  bob.move();
  bob.show();  
    for (int i = 0; i < rocks.length; i ++)
  {
    rocks[i].show();
    rocks[i].move();
  }

  //checks if ship collides with asteroid
  
//  if(get(bob.getX(), bob.getY()) == color(190, 150, 150))
 // {
 //   System.out.println("hit");  
//  }

}

public void keyPressed()
{
  if (key == 'a')
  {
    bob.rotate(-10);
    rocket.rotate(-10);
  }

  if (key == 'd')
  {
    bob.rotate(10);
    rocket.rotate(10);
  }

  if(key == 'w')
  {
    rocket.show();    
    rocket.accelerate(0.1);    
    bob.accelerate(0.1);
  }
  
  if(key == 'h')
  {
    int randPointDirection = (int)(Math.random()*360);
    int randSetX = (int)(Math.random()*501);
    int randSetY = (int)(Math.random()*501);     
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
}

class SpaceShip extends Floater  
{
    public SpaceShip()
    {
      corners = 9;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0]= -6;
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

      myCenterX = 400;
      myCenterY = 400;

      myDirectionX = 0;
      myDirectionY = 0;

      myColor = color(255);

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

    myCenterX = 400;
    myCenterY = 400;
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
    myX = (int)(Math.random()*800);
    myY = (int)(Math.random()*800);
  }

  public void show()
  {
    fill((int)(Math.random()*256)+100,(int)(Math.random()*256)+100,(int)(Math.random()*256)+100);
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
    xCorners[1] = 7;
    yCorners[1] = -10;
    xCorners[2] = 10;
    yCorners[2] = 0;
    xCorners[3] = 6;
    yCorners[3] = 13;
    xCorners[4] = -11;
    yCorners[4] = 8;
    xCorners[5] = -13;
    yCorners[5] = 0;

    myCenterX = (int)(Math.random()*800);
    myCenterY = (int)(Math.random()*800);

    myDirectionX = (Math.random()*3)-1;
    myDirectionY = (Math.random()*3)-1;

    myColor = color(190, 150, 150);

    myPointDirection = (int)(Math.random()*360);

    rotSpeed = (int)((Math.random()*2)-3);
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

  public void move()
  {
    rotate(rotSpeed);
    super.move();
  }
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

