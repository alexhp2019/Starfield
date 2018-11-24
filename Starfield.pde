/*
Tico's Starfield
By: Alexander
November 2018
Grade 12 Computer Science
Very basic starfield that simulates travel through space. 
Also includes a larger version of the star (JumboParticle) and an oddball
*/

Particle[] star;
void setup()
{
  size(500,500);
  background(0);
  star = new Particle[1000];
  for (int i = 0; i < star.length; i++)
  {
    star[i] = new NormalParticle();
  }
  star[0] = new OddballParticle();
  star[1] = new JumboParticle();
}
void draw()
{
  background(0);
  for (int i = 0; i < star.length; i++)
  {
    star[i].show();
    star[i].move();
  }
}
class NormalParticle implements Particle
{
  double myX, myY, speed, angle;
  color myColor;
  NormalParticle()
  {
    speed = (Math.random()*8);
    angle = (Math.random()*3)*(Math.PI);
    myX = 250;
    myY = 250;
    myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  }
  public void move()
  {
    myX = myX + (Math.cos(angle))*(speed);
    myY = myY + (Math.sin(angle))*(speed);
    if (myX > 1000 || myY > 1000 || myX < -500 || myY < -500)
    {
      myX = myY = 250;
    }
  }
  public void show()
  {
    fill(255,125);
    noStroke();
    ellipse((int)myX,(int)myY,5,5);
  }
}
interface Particle
{
  public void show();
  public void move();
}
class OddballParticle implements Particle
{
  int myX, myY;
  color myColor;
  OddballParticle()
  {
    myX = myY = 300;
    myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  }
  public void move()
  {
    myX = myX + (int)(Math.random()*5)-2;
    myY = myY + (int)(Math.random()*5)-2;
  }
  public void show()
  {
        fill(myColor);
        noStroke();
        rect((int)myX,(int)myY,50,50);
  }
}
class JumboParticle extends NormalParticle
{
  public void show()
  {
    fill(255,125);
    noStroke();
    ellipse((int)myX,(int)myY,60,60);
  }
}
