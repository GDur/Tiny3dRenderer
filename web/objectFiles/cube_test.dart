part of t3dr;

WavefrontObjectFile cube_test = new WavefrontObjectFile('''
# Blender v2.69 (sub 0) OBJ File: ''
# www.blender.org
mtllib untitled.mtl
o Cube
v 0.822303 -0.653755 -1.024460
v 0.822303 -0.653755 0.975540
v -1.177697 -0.653755 0.975540
v -1.177697 -0.653755 -1.024460
v 0.822303 1.346245 -1.024459
v 0.822302 1.346245 0.975541
v -1.177698 1.346245 0.975540
v -1.177697 1.346245 -1.024460
usemtl Material
s off
f 1 2 3 4
f 5 8 7 6
f 1 5 6 2
f 2 6 7 3
f 3 7 8 4
f 5 1 4 8
''');
