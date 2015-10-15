import geomerative.*;
import point2line.*;

int pointCount = 50;
float[] x;
float[] y;
float[] z;

float[] dx;
float[] dy;

float lineLength = 150;

RFont font;

boolean recording = false;

public void setup()
{
  size(800, 600, P3D);
  RG.init(this);

  font = new RFont("Kizo.ttf", 200);
  PFont f = createFont("Kizo.ttf", 200);
  x = new float[pointCount];
  y = new float[pointCount];
  z = new float[pointCount];
  dx = new float[pointCount];
  dy = new float[pointCount];
  textFont(f);
  generatePoints();
}

void mousePressed()
{
  redraw();
}

public void keyPressed()
{
  if (key == 's')
  {
    saveFrame();
  }
  if (key == 'r')
  {
    recording = !recording;
  }
}

private void generatePoints()
{

  for (int i=0; i<pointCount; i++)
  {
    x[i] = random(0, width);
    y[i] = random(200, height);
    z[i] = random(0, 20);
    dx[i] = random(-1,1);
    dy[i]= random(-1,1);
  }
}


public void draw()
{
  background(255);
  fill(0);
  text("HYPERBOLOID", 100, 200);
  RGroup grp;
  grp = font.toGroup("HYPERBOLOID");
  grp = grp.toPolygonGroup();
  RPoint[] pnts = grp.getPoints();
  noFill();
  stroke(0, 0, 0, 50);


  for (int i=0; i<pnts.length; i++)
  {
    pnts[i].x = pnts[i].x+100;
    pnts[i].y = pnts[i].y+200;
  }
  
  for (int i = 0; i < pointCount; i++)
  {
    x[i] += dx[i];
    if (x[i] >width || x[i] < 0)
    {
      dx[i] = dx[i]*-1;
    }
    y[i] += dy[i];
    if (y[i] >height || y[i] < 0)
    {
      dy[i] = dy[i]*-1;
    }
  }


  for (int i = 0; i< pointCount; i++)
  {
    //link to mouse
    if (dist(x[i], y[i], z[i], mouseX, mouseY, 0) < lineLength)
      {
        line(x[i], y[i], z[i], mouseX, mouseY, 0);
      }
    
    //link between points
    for (int j=i; j<pointCount; j++)
    {
      if (dist(x[i], y[i], z[i], x[j], y[j], z[j]) < lineLength)
      {
        line(x[i], y[i], z[i], x[j], y[j], z[j]);
      }
    }
    //link to text
    for (int j=0; j<pnts.length; j+=30)
    {
      if (dist(x[i], y[i], z[i], pnts[j].x, pnts[j].y, 0) < lineLength/2)
      {
        line(x[i], y[i], z[i], pnts[j].x, pnts[j].y, 0);
      }
      
    }
  }

  for (int i=0; i<pnts.length; i+=30)
  {
    if (dist(mouseX, mouseY, pnts[i].x, pnts[i].y) < lineLength)
    {
      line(mouseX, mouseY, 20, pnts[i].x, pnts[i].y, 0);
    }
  }
  
  if (recording)
  {
    saveFrame("recording/frame-######.png");
  }
}