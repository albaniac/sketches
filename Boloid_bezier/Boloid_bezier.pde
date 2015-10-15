import de.looksgood.ani.*;
import point2line.*;

public class bezierData
{
  public int x1;
  public int y1;
  public int x2;
  public int y2;
  public int pointX;
  public int pointY;
}

PImage gradient;
PImage text;

color start = #A182BB;
color stop = #82CCB5;
color bkgCl;
color strokeCl;
float iter = 0;

int bezierX = 0;
int bezierY = 0;
int x1 = -430;
int y1 = 0;
int x2 = 430;
int y2 = 0;

float angle = 0;

//ellipse params
float ellipseAngle;
float a=300;
float b = 250;
bezierData[] lines = new bezierData[30];

Ani leftPointAni;
Ani rightPointAni;
Ani angleAni;
Ani colorAni;

void setupAngleAni()
{
  angleAni = new Ani(this, 20, "ellipseAngle", 3*PI/4);
  angleAni.setPlayMode(Ani.YOYO);
  angleAni.repeat(100);
  angleAni.setEasing(Ani.LINEAR);
}

void setupLeftPointAni()
{
  y1 = -200;
  leftPointAni = new Ani(this, 15, "y1", 200);
  leftPointAni.setPlayMode(Ani.YOYO);
  leftPointAni.repeat(100);
  leftPointAni.setEasing(Ani.LINEAR);
}

void setupRightPointAni()
{
  y2 = 200;
  leftPointAni = new Ani(this, 14, "y2", -200);
  leftPointAni.setPlayMode(Ani.YOYO);
  leftPointAni.repeat(100);
  leftPointAni.setEasing(Ani.LINEAR);
}

void setup()
{
  size(900, 600);
  
  gradient = loadImage("Gradient.png");
  text = loadImage("Text.png");
  frameRate(30);
  
  ellipseAngle = 0;
  
  Ani.init(this);
  
  //setupAngleAni();
  setupRightPointAni();
  setupLeftPointAni();
  
  Ani.autostart();
  
  strokeCl = stop;
  bkgCl = start;
}



void draw() {
  //bkgCl = lerpColor(start, stop, iter);
  //fill(bkgCl);
  //rect(0,0,width, height);
  image(gradient,0,0,width, height);
  
  //strokeCl = lerpColor(stop, start, iter);
  stroke(255,255,255,20);
  
pushMatrix();
  translate(450, 300);
scale(2);
  float curentAngle = angle;
  for (int i=0; i< 50; i++)
  {

    bezierX = (int)getEllipseX(curentAngle);
    bezierY = (int) getEllipseY(curentAngle);
    //rotate
    float bezierX_rot = bezierX*cos(ellipseAngle)+bezierY*sin(ellipseAngle);
    float bezierY_rot = -bezierX*sin(ellipseAngle)+bezierY*cos(ellipseAngle);
    noFill();
    bezier(x1, y1, bezierX_rot, bezierY_rot, bezierX_rot, bezierY_rot, x2, y2);
    curentAngle+= radians(10);
  }
popMatrix();
translate(450, 300);
  image(text,-274,-140,548, 359);
  angle += radians(10);
}

float getEllipseX(float angle)
{
  return a*cos(angle);
}

float getEllipseY(float angle)
{
  return b*sin(angle);
}