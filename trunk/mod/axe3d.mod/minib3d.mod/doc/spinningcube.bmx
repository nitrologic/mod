' spinning cube

Import sidesign.minib3d

Graphics3D 800,600

cube=CreateCube()

ScaleEntity cube,1,1,1

cube2=CreateCube(cube)
ScaleEntity cube2,1,2,1
MoveEntity cube2,0,0,3

cam=CreateCamera()
MoveEntity cam,0,0,-10

'moveentity cube,0,0,25

light=CreateLight()
MoveEntity light,-25,25,-50

While Not KeyHit(KEY_ESCAPE)
	TurnEntity cube,.1,.2,.3
	TurnEntity cube2,0,1,0
	UpdateWorld
	RenderWorld
	Flip
Wend
