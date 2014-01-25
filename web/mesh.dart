part of t3dr;

class Mesh {
  List<Vector4>  vertecies = new List<Vector4>();
  List<Triangle> triangles = new List<Triangle>();
  List<Quad> quads = new List<Quad>();

  addVertex(Vector3 tmp){
    vertecies.add(new Vector4(tmp.x, tmp.y, tmp.z, 1.0));
  }

  addTriangle(int a, int b, int c){
    triangles.add(new Triangle([a, b, c]));
  }

  addQuad(int a, int b, int c, int d){
    quads.add(new Quad([a, b, c, d]));
  }
}

class Triangle {
  List<int> indicies;
  Triangle(this.indicies);
}

class Quad {
  List<int> indicies;
  Quad(this.indicies);
}