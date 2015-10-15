class Attractor extends Vect2 {
  float radius = 100;

  Attractor(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void attract(Node node) {
    float dx = x - node.x;
    float dy = y - node.y;
    float d = Vect2.distance(this, node);

    if (d>0 && d< radius) {
      float s = d/radius;
      float f = 1 / pow(s, 0.5) - 1;
      f = f / radius;

      node.velocity.x += dx*f;
      node.velocity.y += dy*f;
    }
  }
}