part of t3dr;

class Transform {
  Vector4 _pos = new Vector4(0.0, 0.0, 0.0, 1.0);
  Vector4 _scale = new Vector4(1.0, 1.0, 1.0, 1.0);
  Vector4 _rotation = new Vector4(0.0, 0.0, 0.0, 1.0);

  int dimension = 4;
  Matrix4 _transform;

  Transform() {
    update();
  }

  Matrix4 get getTransform => _transform;
  Vector3 get getPos => _pos.xyz;
  Vector4 get getScale => _scale;
  Vector3 get getRotation => _rotation.xyz;

//  Vector3  getRotation => _rotation.xyz;


  dynamic operator*(dynamic arg) {
    if (arg is Vector3) {
      var tmp = new Vector4(arg.x, arg.y, arg.z, 1.0);
      return _transform.clone() * tmp;
    }
    throw new ArgumentError(arg);
  }

  setPos(Vector3 tmp){
    _pos.xyz = tmp.xyz;
    update();
  }

  setScale(Vector3 tmp){
    _scale.xyz = tmp.xyz;
    update();
  }

  setRotation(Vector3 tmp){
    _rotation.xyz = tmp.xyz;
    update();
  }

  void update() {
//    print("start");
    Matrix4 t = getTranslationMatrix(_pos);
//    print(t);
    Matrix4 rx = getRotationXMatrix(_rotation.x);
    Matrix4 ry = getRotationYMatrix(_rotation.y);
    Matrix4 rz = getRotationZMatrix(_rotation.z);
    Matrix4 r = rx * ry * rz;
//    print(r);
    Matrix4 s = getScaleMatrix(_scale);
//    print(s);
    _transform = t * r * s;
//    print(_transform);
  }

  Matrix4 getRotationXMatrix(double radians) {
    double c = cos(radians);
    double s = sin(radians);
    return new Matrix4( 1.0,.0,.0,0.0,
                        0.0, c, s,0.0,
                        0.0,-s, c,0.0,
                        0.0,.0,.0,1.0);
  }

  Matrix4 getRotationYMatrix(double radians) {
    double c = cos(radians);
    double s = sin(radians);
    return new Matrix4( c  ,0.0, -s,0.0,
                        0.0,1.0,0.0,0.0,
                        s  ,0.0,  c,0.0,
                        0.0,0.0,0.0,1.0);
  }
  Matrix4 getRotationZMatrix(double radians) {
    double c = cos(radians);
    double s = sin(radians);
    return new Matrix4(   c,  s,0.0,0.0,
                         -s,  c,0.0,0.0,
                        0.0,0.0,1.0,0.0,
                        0.0,0.0,0.0,1.0);
  }

  Matrix4 getTranslationMatrix(Vector4 t) {
    return new Matrix4( 1.0,0.0,0.0,0.0,
                        0.0,1.0,0.0,0.0,
                        0.0,0.0,1.0,0.0,
                        t.x,t.y,t.z,1.0);
  }

  Matrix4 getScaleMatrix(Vector4 s) {
    return new Matrix4( s.x,0.0,0.0,0.0,
                        0.0,s.y,0.0,0.0,
                        0.0,0.0,s.z,0.0,
                        0.0,0.0,0.0,1.0);
  }
}