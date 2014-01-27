part of t3dr;

class WavefrontObjectFile{
  String data;
  WavefrontObjectFile(this.data);

  Mesh getMesh() {
    var now = new DateTime.now();
//    http://en.wikipedia.org/wiki/Wavefront_.obj_file

    Mesh tmpMesh = new Mesh();

    List<String> lines = data.split("\n");
    lines.forEach((String line) {

      List<String> segments = line.split(" ");
      switch(segments[0]){
        case "#":
//      # this is a comment
          break;
        case "v":
//      List of Vertices, with (x,y,z[,w]) coordinates, w is optional and defaults to 1.0.
          tmpMesh.addVertex(new Vector3(
              double.parse(segments[1]),
              double.parse(segments[2]),
              double.parse(segments[3]))
          );
          break;
        case "vt":
          // Texture coordinates, in (u ,v [,w]) coordinates,
          // these will vary between 0 and 1, w is optional and default to 0.
          break;
        case "vn":
          // Normals in (x,y,z) form; normals might not be unit.
          break;
        case "vp":
          // Parameter space vertices in ( u [,v] [,w] ) form; free form geometry statement ( see below )
          break;
        case "f":
          // Face Definitions
          // f 13/21/1 14/22/2 15/23/3 16/24/4
          // f v1/vt1/vn1 v2/vt2/vn2 v3/vt3/vn3
          if(segments.length == 5) {
            int a = int.parse(segments[1].split("/")[0]);
            int b = int.parse(segments[2].split("/")[0]);
            int c = int.parse(segments[3].split("/")[0]);
            int d = int.parse(segments[4].split("/")[0]);
            tmpMesh.addQuad(a - 1, b - 1, c - 1, d - 1);
//            tmpMesh.addTriangle(a - 1, c - 1, d - 1);
          } else if(segments.length == 4) {
            int a = int.parse(segments[1].split("/")[0]);
            int b = int.parse(segments[2].split("/")[0]);
            int c = int.parse(segments[3].split("/")[0]);
            tmpMesh.addTriangle(a - 1, b - 1, c - 1);
          }
          break;
      }
    });
    print((new DateTime.now().difference(now)));
    return tmpMesh;
  }
}