int generation = 9;

String lsystem;
int len = 3;
float theta = PI/3;

ArrayList palette;

LSystem s;
int pos = 0;

void setup()
{
  palette = new ArrayList();
  palette.add(color(99,159,169));
  palette.add(color(251,254,252));
  palette.add(color(90,43,39));
  palette.add(color(218,85,86));
  palette.add(color(138,59,58));
  size(900, 600);
  noLoop();
  
  generate();
}

private void generate(){
  IRule[] rules = new IRule[2];
  rules[0] = new RandomRule('X', "F-[[X]+X]+F[+FX]-X", "F-[[X]+X]-F[-FX]+X");
  rules[1] = new Rule('F', "FF");
  s = new LSystem("XFX", rules);
  for (int i = 0; i< generation; i++)
  {
    println("gen complite"+i);
    s.Generate();
  }
}

void mousePressed() {
  generation +=1;
  redraw();
}

void keyPressed() {
  if (key == 's')
  {
    saveFrame();
  }
  if (key == 'r') {
    generate();
    redraw();
  }
  
}



private void setRandomStroke(){
  color sColor = (color)palette.get(0);
  float rnd = random(0,5);
  if (rnd>=0 && rnd<1) {
    sColor = (color)palette.get(0);
  } else if (rnd>=1 && rnd<2) {
    sColor = (color)palette.get(1);
  } else if (rnd>=2 && rnd<3) {
    sColor = (color)palette.get(2);
  } else if (rnd>=3 && rnd<4) {
    sColor = (color)palette.get(3);
  } else if (rnd>=4 && rnd<5) {
    sColor = (color)palette.get(4);
  }
  stroke(sColor);
  
}

void draw(){
  println("start");
  background(255,255,255);
  translate(-width/4, height);
  
  stroke(0, 101, 169, 50);
  



  lsystem = s.currentGeneration;

println(lsystem.length());
  for (int i=0; i< lsystem.length(); i++)
  {
    //setRandomStroke();
    char c = lsystem.charAt(i);
    if (c == 'F') {
      line(0, 0, len, 0);
      translate(len, 0);
    } else if ( c == 'G') {
      translate(len, 0);
    } else if ( c == '+') {
      rotate(theta);
    } else if ( c == '-') {
      rotate(-theta);
    } else if ( c == '[') {
      pushMatrix();
    } else if ( c == ']') {
      popMatrix();
    }
  }
}