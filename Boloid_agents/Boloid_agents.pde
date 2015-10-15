import de.looksgood.ani.*;
import processing.video.*;

PImage gradient;
PImage text;

int formResolution = 30;
int alteration = 30;
int radius = 80;

figure[] figures;

int fCount = 450;

color c1 = #FDDA00;
color c2 = #F04C5A;

boolean isRecording = false;

void keyReleased()
{
  if (key == 'r')
  {
     if (isRecording)
     {
       isRecording = false;
     }
     else
     {
       isRecording = true;
     }
  }  
  if (key=='c')
  {
    fill(255);
    rect(0, 0, width, height);
  }
  if (key=='s')
  {
    saveFrame();
  }
}


void setup()
{
  size(900, 600);
  background(255);
  
  noLoop();
  
  gradient = loadImage("Gradient.png");
  text = loadImage("Text 2.png");
fCount = 0;
  figures = new figure[fCount];

  Ani.init(this);
}

void mouseReleased()
{
  fCount = 10;
  float radius = 300;
  float radiusStep = 25;
  figures = new figure[fCount];

  for (int i=0; i<fCount; i++)
  {
    figure f = new figure(formResolution,radius*0.05,radius, mouseX, mouseY);
    f.makeDifferences(4);
    figures[i] = f;
    radius = radius - radiusStep;
  }
  redraw();
}

void draw()
{
  colorMode(HSB, 360, 100,100, 100);
  noStroke();
  noFill();
    int b = 30;
  for (int i = 0; i<fCount; i++)
  {
    float h = map(figures[i].centerX, 0, width, 0, 40);
    fill(h,100,b, 10);
    figures[i].drawShape();
    b+=10;
  }
}