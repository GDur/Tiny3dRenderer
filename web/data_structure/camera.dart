part of t3dr;

class Camera {
  double dist = 10.0;
  double x, y, z = 0;

  Camera(this.x, this.y);

  getX(Vector4 v) {
    var d = dist + this.z;
    if (d > 1) {
      return v.x / d + this.x;
    }
    return 0;
  }

  getY(Vector4 v) {
    var d = dist + this.z;
    if (d > 1) {
      return v.y / d + this.y;
    }
    return 0;
  }
}
