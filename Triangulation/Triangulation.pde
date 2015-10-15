import megamu.mesh.*;
import point2line.*;

float[][] edges;
float[][] points;
int[][] links;
int maxPoints = 70;
Vect2[] borderPolygon;

void setup() {

  size(900, 600);
  points = new float[maxPoints+4][2];
  points[0][0] = 0;
  points[0][1] = 100;
  points[1][0] = width;
  points[1][1] = 70;
  points[2][0] = width;
  points[2][1] = 300;
  points[3][0] = 0;
  points[3][1] = 350;

  borderPolygon = new Vect2[4];
  for (int i=0; i<4; i++) {
    borderPolygon[i] = new Vect2(points[i][0], points[i][1]);
  }
  generatePoints();
  Delaunay del = new Delaunay(points);
  edges = del.getEdges();
  links = del.getLinks();
}

void generatePoints() {
  int cPointCount = 0;
  float xStep = 10;
  float yStep = 10;
  float pX = 0;
  float pY= 0;
  boolean s = true;
  ArrayList list = new ArrayList();
  do {    
    do {
      pY += yStep;
      Vect2 point = new Vect2(pX, pY);
      if (Space2.insidePolygon(point, borderPolygon)) {
        list.add(point);
      }
    } while (pY<height);
    if (s)
    {
      s = false;
      pY = yStep/2;
    } else {
      s = true;
      pY = 0;
    }

    pX += xStep;
  } while (pX<width);
  points = new float[list.size() + 4][2];
  for (int i=0; i< list.size(); i++)
  {
    points[i][0]=((Vect2) list.get(i)).x;
    points[i][1]=((Vect2) list.get(i)).y;
  }
}

void drawEdges() {
  stroke(0, 0, 0, 100);
  //  println("Displaying Delaunay for " + edges.length + " edges");
  for (int i = 0; i < edges.length; i++) {
    float startX = edges[i][0];
    float startY = edges[i][1];
    float endX   = edges[i][2];
    float endY   = edges[i][3];
    //    println(startX + " " + startY + " " + endX + " " + endY);
    line(startX, startY, endX, endY);
  }
}

void drawLinks() {
  stroke(255, 0, 0);
  for (int i=2; i<5; i++) {
    int startIndex = links[i][0];
    int endIndex = links[i][1];

    float startX = points[startIndex][0];
    float startY = points[startIndex][1];
    float endX = points[endIndex][0];
    float endY = points[endIndex][1];
    line( startX, startY, endX, endY );
  }
}

void draw() {
  strokeWeight(1);
  background(255, 255, 255);
  drawEdges();
  drawLinks();
}