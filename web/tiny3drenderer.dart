library t3dr;

import 'dart:html';
import 'dart:math';
import 'package:vector_math/vector_math.dart';
import 'package:game_loop/game_loop_html.dart';

part 'transform.dart';
part 'model3d.dart';
part 'mesh.dart';

part 'objectFiles/WavefrontObjectFile.dart';
part 'objectFiles/ship1.dart';
part 'objectFiles/ship2.dart';
part 'objectFiles/ship3.dart';
part 'objectFiles/ship6.dart';

const String GREEN  = "#A6E22E";
const String PINK   = "#F92672";
const String CYAN   = "#66D9EF";
const String ORANGE = "#FD971F";
const String GREY   = "#272822";

class Camera {
  getMatrix(double z){
    return new Matrix4( 1.0,0.0,0.0,0.0,
                        0.0,1.0,0.0,0.0,
                        0.0,0.0,1.0,1.0 / z,
                        0.0,0.0,0.0,0.0);
  }
}

void main() {

  CanvasElement canvas = querySelector("#canvas");
  CanvasRenderingContext2D gc = canvas.getContext('2d');

  // ini
  var cameraOrthogonal = new Matrix4( 1.0,0.0,0.0,0.0,
                                      0.0,1.0,0.0,0.0,
                                      0.0,0.0,0.0,0.0,
                                      0.0,0.0,0.0,1.0);

  var cameraPerspective = new Matrix4(1.0,0.0,0.0,0.0,
                                      0.0,1.0,0.0,0.0,
                                      0.0,0.0,1.0,1.0/4.0,
                                      0.0,0.0,0.0,0.0);




  var drawables = new List<Model3D>();


  Model3D imported1 = new Model3D(
      new Transform()
        ..setPos(new Vector3(3000.0, 0.0, 10000.0))
        ..setScale(new Vector3(3.0, -3.0, 3.0))
        ..setRotation(new Vector3(1.0, 0.0 , .0))
    , ship1.getMesh()
    , CYAN
  );

  Model3D imported2 = new Model3D(
      new Transform()
        ..setPos(new Vector3(1500.0, 0.0, 10000.0))
        ..setScale(new Vector3(3.0, -3.0, 3.0))
        ..setRotation(new Vector3(1.0, 0.0 , .0))
    , ship2.getMesh()
    , PINK
  );

  Model3D imported3 = new Model3D(
      new Transform()
        ..setPos(new Vector3(-1500.0, 0.0, 10000.0))
        ..setScale(new Vector3(3.0, -3.0, 3.0))
        ..setRotation(new Vector3(1.0, 0.0 , .0))
    , ship3.getMesh()
    , GREEN
  );

  Model3D imported6 = new Model3D(
      new Transform()
        ..setPos(new Vector3(-3500.0, 0.0, 10000.0))
        ..setScale(new Vector3(3.0, -3.0, 3.0))
        ..setRotation(new Vector3(1.0, 0.0 , .0))
    , ship6.getMesh()
    , ORANGE
  );

  Model3D objectB = new Model3D(
      new Transform()
      ..setPos(new Vector3(250.0, 0.0, 4000.0))
      ..setScale(new Vector3(150.0, 150.0, 150.0))
      ..setRotation(new Vector3(0.0, 0.0 , 0.0))
    , new Mesh()
      ..addVertex(new Vector3(0.0, 0.0, 0.0))
      ..addVertex(new Vector3(-1.0, 0.0, 0.0))
      ..addVertex(new Vector3(0.0, -1.0, 0.0))
      ..addVertex(new Vector3(0.0, 0.0, -1.0))
      ..triangles.add(new Triangle([0, 1, 2]))
      ..triangles.add(new Triangle([0, 2, 3]))
      ..triangles.add(new Triangle([0, 1, 3]))
      ..triangles.add(new Triangle([1, 2, 3]))
      , CYAN
  );

  Model3D objectA = new Model3D(
      new Transform()
        ..setPos(new Vector3(0.0, 20.0, 300.0))
        ..setScale(new Vector3(100.0, 100.0, 100.0))
        ..setRotation(new Vector3(0.0, 0.0 , 0.0))
    , new Mesh()
        ..addVertex(new Vector3(0.0, 0.0, 0.0))
        ..addVertex(new Vector3(1.0, 0.0, 0.0))
        ..addVertex(new Vector3(0.0, 1.0, 0.0))
        ..addVertex(new Vector3(0.0, 0.0, 1.0))
        ..triangles.add(new Triangle([0, 1, 2]))
        ..triangles.add(new Triangle([0, 2, 3]))
        ..triangles.add(new Triangle([0, 1, 3]))
        ..triangles.add(new Triangle([1, 2, 3]))
      , GREEN
  );


//  drawables.add(objectA);
//  drawables.add(objectB);
  drawables.add(imported1);
  drawables.add(imported2);
  drawables.add(imported3);
  drawables.add(imported6);

  var cam  = new Camera();
  var dist = 1000.0;
  var camX = canvas.width  / 2;
  var camY = canvas.height / 2;

  getX(Vector4 v) {
    return camX + dist * v.x  / v.z;
  }

  getY(Vector4 v) {
    return camY + dist * v.y  / v.z;
  }

  gc.font="15px Consolas";
  // Construct a game loop.
  GameLoopHtml gameLoop = new GameLoopHtml(canvas);
  gameLoop.onUpdate = ((gameLoop) {
//    Vector3 old = objectA.transform.getRotation;
//    old.setValues(old.x, old.y += 3.14*gameLoop.dt, old.z);
//    objectA.transform.setRotation(old);

    Vector3 old1 = imported1.transform.getRotation;
    old1.setValues(old1.x , old1.y += 3.14*2/10*gameLoop.dt , old1.z);

    Vector3 old2 = imported2.transform.getRotation;
    old2.setValues(old2.x , old2.y -= 3.14*2/10*gameLoop.dt , old2.z);

    Vector3 old3 = imported3.transform.getRotation;
    old3.setValues(old3.x , old3.y += 3.14*2/10*gameLoop.dt , old3.z);

    Vector3 old6 = imported6.transform.getRotation;
    old6.setValues(old6.x , old6.y -= 3.14*2/10*gameLoop.dt , old6.z);

    imported1.transform.setRotation(old1);
    imported2.transform.setRotation(old2);
    imported3.transform.setRotation(old3);
    imported6.transform.setRotation(old6);
//    Vector3 old3 = imported1.transform.getPos;
//    old3.setValues(old3.x , old3.y += 100 * gameLoop.dt , old3.z);

//    imported1.transform.setPos(old3);
    // Update game logic here.
//    dist+=.1;
//    print('${gameLoop.frame}: ${gameLoop.gameTime} [dt = ${gameLoop.dt}].');
  });


  gameLoop.onRender = ((gameLoop) {
    gc.fillStyle = GREY;
    gc.fillRect(0, 0, canvas.width, canvas.height);

    gc.fillStyle = GREEN;

    gc.fillText('Time: ${gameLoop.gameTime}sec',10,20);
    gc.fillText('FrameCount: ${gameLoop.frame} ',10,40);
    gc.fillText('dt: ${gameLoop.dt}',10,60);
    gc.fillText('fps average: ${gameLoop.frame/gameLoop.gameTime}',10,80);

    // draw
    drawables.forEach((Model3D d) {

      gc.strokeStyle = d.color;
      Matrix4 tmp = d.transform.getTransform;

      d.mesh.triangles.forEach((Triangle t){

        var vertecies = d.mesh.vertecies;

        Vector4 first  = tmp * vertecies[t.indicies[0]];
        Vector4 second = tmp * vertecies[t.indicies[1]];
        Vector4 third  = tmp * vertecies[t.indicies[2]];

        gc.beginPath();
        gc.moveTo(getX(first), getY(first));
        gc.lineTo(getX(second), getY(second));
        gc.lineTo(getX(third), getY(third));
        gc.lineTo(getX(first), getY(first));
        gc.stroke();
        gc.closePath();
      });

      d.mesh.quads.forEach((Quad t){
        var vertecies = d.mesh.vertecies;

        Vector4 first  = tmp * vertecies[t.indicies[0]];
        Vector4 second = tmp * vertecies[t.indicies[1]];
        Vector4 third  = tmp * vertecies[t.indicies[2]];
        Vector4 fourth = tmp * vertecies[t.indicies[3]];

        gc.beginPath();
          gc.moveTo(getX(first), getY(first));
          gc.lineTo(getX(second), getY(second));
          gc.lineTo(getX(third), getY(third));
          gc.lineTo(getX(fourth), getY(fourth));
          gc.lineTo(getX(first), getY(first));
          gc.stroke();
        gc.closePath();
      });
    });
  });
  gameLoop.start();
}