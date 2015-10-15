import point2line.*;

class Node extends Vect2 {

  public Vect2 velocity = new Vect2(0, 0);
  public Vect2 outerForce = new Vect2(0, 0);

  float minX=5, minY=5, maxX=width-5, maxY=height-5;

  float damping = 0.1;

  public Node(float x, float y) {
    this.x = x;
    this.y = y;
  }

  public void update() {
    x+=velocity.x;
    y+=velocity.y;

    if (x < minX) {
      x = minX - (x-minX);
      velocity.x = -velocity.x;
    }

    if (x>maxX) {
      x = maxX - (x - maxX);
      velocity.x=-velocity.x;
    }

    if (y < minY) {
      y = minY - (y - minY);
      velocity.y = -velocity.y;
    }

    if (y>maxY) {
      y = maxY - (y-maxY);
      velocity.y = -velocity.y;
    }

    velocity.x *= (1-damping);
    velocity.y *= (1-damping);
  }
}


public class MechanicObject extends Vect2 {
  public Vect2 velocity;
  public Vect2 aceleration;
  public ArrayList<Vect2> forces;
  public float m;

  public MechanicObject(float mass) {
    velocity = new Vect2(0, 0);
    aceleration = new Vect2(0, 0);
    m = mass;
  }

  public void update() {
    Vect2 resultant = new Vect2(0, 0);
    for (int i =0; i<forces.size(); i++) {
      resultant.add(forces.get(i));
    }
    aceleration = resultant.devided(m);
  }
}