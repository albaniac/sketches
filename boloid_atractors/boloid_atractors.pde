Attractor mouse = new Attractor(0, 0);
int xCount = 200;
int yCount = 100;
color begin = #00F6FF;
color end = #FF00E9;

Node[] nodes;

void setup() {
  size(1200, 800);
  initGrid();
}

void draw() {
  background(255);
  noStroke();
  mouse.x = mouseX;
  mouse.y = mouseY;


  for (int i = 0; i< xCount; i++) {
    //beginShape();
    setStrokeCl(i*width/xCount);
    for (int j = 0; j< yCount; j++) {
      Node node = nodes[i*yCount+j];
      if (mousePressed) {
        mouse.attract(node);
      }
      node.update();
      rect(node.x, node.y, 5, 5);
      //curveVertex(node.x, node.y);
    }
    //endShape();
  }
}

void setStrokeCl(float x) {
  color scl = lerpColor(begin, end, x/width);
  fill(scl);
}



void initGrid() {
  float xStep = width/xCount;
  float yStep = height/yCount;
  float xPosition = 0, yPosition = 0;
  nodes = new Node[xCount*yCount];
  for (int i = 0; i<xCount; i++) {

    for (int j = 0; j<yCount; j++) {
      nodes[i*yCount+j] = new Node(xPosition, yPosition) {
      };
      yPosition = j*yStep;
    }
    xPosition = i*xStep;
  }
}