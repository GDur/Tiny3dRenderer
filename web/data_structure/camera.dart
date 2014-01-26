part of t3dr;

class Camera {
  var dist = 1000.0;
  var x , y;

  Camera(this.x, this.y);

  getMatrix(double z){
    return new Matrix4( 1.0,0.0,0.0,0.0,
                        0.0,1.0,0.0,0.0,
                        0.0,0.0,1.0,1.0 / z,
                        0.0,0.0,0.0,0.0);
  }

  getX(Vector4 v) {
    return x + dist * v.x  / v.z;
  }

  getY(Vector4 v) {
    return y + dist * v.y  / v.z;
  }
}