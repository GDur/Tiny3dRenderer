part of t3dr;

class WaveFrontObjFileParser {

  String data;
  WaveFrontObjFileParser(this.data);
// eol := "\n"
//
// obj := line*
// line := (comment | emptyLine | mtlib | g | v | vt | s| f | vn | usemtl) + eol
// d := (0 | 1 ...)
// space := " "
// float := "-"? + d* + "." + d*
// v := float + space + float + space + float
// comment = "#" + string
  skipLine(String s, int index) {
    for(int i = index; i < s.length; i++) {
      if(s[i] == "\n"){
        return ++i;
      }
    }
  }
  readVertex(String s, int index) {
    //read v
    //read float
    //skip space
    //read float
    //skip space
    //read float
    for(int i = index; i < s.length; i++) {
      i = readDouble(s[i], i);
      switch(s[i]) {
        case ' ':

      }
    }
  }

  Mesh getMesh() {
    Mesh tmpMesh = new Mesh();
    //read obj
    for(int i = 0; i < data.length; i++) {
        //read line
      switch(data[i]) {
        case '#':
          //read comment
          i = skipLine(data, i);
        break;
        case 'm':
          //read mtlib
          i = skipLine(data, i);
        break;
        case 'g':
          //read g
          i = skipLine(data, i);
          break;
        case 'v':
          switch(data[++i]) {
            case ' ':
              i = readVertex(data, ++i);
          continue;
        }
      }
    }
  }
}