Framework raspi.EGLMax2D
Import brl.StandardIO

Print "EGL test suite version 0.1"

Global modecount=GraphicsModes().length

Print "Modes="+modecount

Local defaultMode:TGraphicsMode

For Local mode:TGraphicsMode=EachIn GraphicsModes()
	If Not defaultMode defaultMode=mode
	Print ""+mode.width+","+mode.height+"@"+mode.hertz+"hz"
Next

Print "Default Display Test"

Graphics defaultMode.width,defaultMode.height

Print "Press Escape to Exit"

Local t=0

While Not KeyHit(KEY_ESCAPE)
	t=t+1
	Local r=50+100*Sin(t*0.02)
	Local g=50+100*Sin(t*0.2)
	Local b=50+100*Sin(t*0.01)
	SetClsColor r,g,b
	Cls
	Flip
	Delay 200
Wend

