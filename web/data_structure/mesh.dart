part of t3dr;

class Mesh {
  List<Vector4> vertecies = new List<Vector4>();
  List<Triangle> triangles = new List<Triangle>();
  List<Quad> quads = new List<Quad>();

  addVertex(Vector3 tmp) {
    vertecies.add(new Vector4(tmp.x, tmp.y, tmp.z, 1.0));
  }

  addTriangle(int a, int b, int c) {
    triangles.add(new Triangle([a, b, c]));
  }

  addQuad(int a, int b, int c, int d) {
    quads.add(new Quad([a, b, c, d]));
  }
}

// class Vector4 {
//   double x, y, z,w;
//   Vector4(this.x, this.y, this.z, this.w);
// }

// class Vector3{
//   double x, y, z;
//   Vector3(this.x, this.y, this.z);
// }

class Triangle {
  List<int> indicies;
  Triangle(this.indicies);
}

class Quad {
  List<int> indicies;
  Quad(this.indicies);
}
