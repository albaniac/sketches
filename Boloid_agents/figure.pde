class figure
{
  public float centerX;
  public float centerY;
  public float[] x;
  public float[] y;
  public int formResolution;
  public float radius;
  public float alteration;


  public void makeDifferences(int iterationCount)
  {
    for (int j=0; j<iterationCount; j++)
    {
      for (int i = 0; i<formResolution; i++)
      {
        x[i] = x[i] + random(-alteration, alteration);
        y[i] = y[i]+ random(-alteration, alteration);
      }
    }
  }

  public void drawShape() {
    beginShape();
    curveVertex(x[formResolution-1]+centerX, y[formResolution-1]+centerY);
    for (int i=0; i<formResolution; i++) {
      curveVertex(x[i]+centerX, y[i]+centerY);
    }
    curveVertex(x[0]+centerX, y[0]+centerY);
    curveVertex(x[1]+centerX, y[1]+centerY);
    endShape();
  }

  public figure( int formResolution
               , float alteration
               , float radius
                , float centerX
                , float centerY) {
    this.centerX = centerX;
    this.centerY = centerY;
    this.alteration = alteration;
    x = new float[formResolution];
    y = new float[formResolution];
    this.formResolution = formResolution;
    float angle = radians(360/float(this.formResolution));
    for (int i =0; i<this.formResolution; i++)
    {
      x[i] = cos(angle*i)*radius;
      y[i] = sin(angle*i)*radius;
    }
  }

  public figure(int formResolution) {
    this.formResolution = formResolution;
    x = new float[formResolution];
    y = new float[formResolution];
  }

  public figure(figure previous, float newX, float newY, float alteration) {
    this.formResolution = previous.formResolution;
    centerX = newX;
    centerY = newY;
    x = new float[formResolution];
    y = new float[formResolution];
    for (int i = 0; i<formResolution; i++)
    {
      x[i] = previous.x[i] + random(-alteration, alteration);
      y[i] = previous.y[i]+ random(-alteration, alteration);
    }
  }
}