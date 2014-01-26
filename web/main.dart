part of t3dr;



void main() {

  CanvasElement canvas = querySelector("#canvas");
  CanvasRenderingContext2D gc = canvas.getContext('2d');

  var drawables = new List<Model3D>();


  Model3D imported1 = new Model3D(
      new Transform()
        ..setPos(new Vector3(3000.0, 0.0, 10000.0))
        ..setScale(new Vector3(3.0, -3.0, 3.0))
        ..setRotation(new Vector3(0.3, 0.0 , .0))
    , ship1.getMesh()
    , CYAN
  );

  Model3D imported2 = new Model3D(
      new Transform()
        ..setPos(new Vector3(1000.0, 0.0, 10000.0))
        ..setScale(new Vector3(3.0, -3.0, 3.0))
        ..setRotation(new Vector3(0.3, 0.0 , .0))
    , ship2.getMesh()
    , PINK
  );

  Model3D imported3 = new Model3D(
      new Transform()
        ..setPos(new Vector3(-1300.0, 0.0, 10000.0))
        ..setScale(new Vector3(2.0, -2.0, 2.0))
        ..setRotation(new Vector3(0.3, 0.0 , .0))
    , ship3.getMesh()
    , GREEN
  );

  Model3D imported6 = new Model3D(
      new Transform()
        ..setPos(new Vector3(-3200.0, 0.0, 10000.0))
        ..setScale(new Vector3(3.5, -3.5, 3.5))
        ..setRotation(new Vector3(0.3, 0.0 , .0))
    , ship6.getMesh()
    , ORANGE
  );

  drawables.add(imported1);
  drawables.add(imported2);
  drawables.add(imported3);
  drawables.add(imported6);

  var cam  = new Camera(canvas.width  / 2, canvas.height  / 2);

  gc.font="15px Consolas";

  GameLoopHtml gameLoop = new GameLoopHtml(canvas);
  gameLoop.onUpdate = ((gameLoop) {

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
        gc.moveTo(cam.getX(first), cam.getY(first));
        gc.lineTo(cam.getX(second), cam.getY(second));
        gc.lineTo(cam.getX(third), cam.getY(third));
        gc.lineTo(cam.getX(first), cam.getY(first));
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
          gc.moveTo(cam.getX(first), cam.getY(first));
          gc.lineTo(cam.getX(second), cam.getY(second));
          gc.lineTo(cam.getX(third), cam.getY(third));
          gc.lineTo(cam.getX(fourth), cam.getY(fourth));
          gc.lineTo(cam.getX(first), cam.getY(first));
          gc.stroke();
        gc.closePath();
      });
    });
  });
  gameLoop.start();
}