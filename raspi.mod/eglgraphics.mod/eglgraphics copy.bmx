
Strict

Rem
bbdoc: EGL Graphics
End Rem
Module RasPI.EGLGraphics

ModuleInfo "Version: 0.01"
ModuleInfo "Author: Mark Sibly, Simon Armstrong"
ModuleInfo "License: zlib/libpng"
ModuleInfo "Copyright: Blitz Research Ltd, Simon Armstrong"

Import BRL.Graphics
Import BRL.Pixmap

?Win32
Import "eglgraphics.win32.c"
?MacOS
Import "eglgraphics.macos.m"
?Linux
Import "-L/opt/vc/lib"
Import "-lEGL"
Import "-lGLESv2"
Import "-lbcm_host"
Import "/opt/vc/include/*.h"
Import "/opt/vc/include/interface/vcos/pthreads/*.h"
Import "/opt/vc/include/interface/vmcs_host/linux/*.h"
Import "eglgraphics.linux.c"
?


Import "egl.bmx"

Private

Incbin "gldrawtextfont.bin"

Extern
	Function bbEGLGraphicsShareContexts()
	Function bbEGLGraphicsGraphicsModes( buf:Byte Ptr,size )
	Function bbEGLGraphicsAttachGraphics:Byte Ptr( widget:Byte Ptr,flags )
	Function bbEGLGraphicsCreateGraphics:Byte Ptr( width,height,depth,hertz,flags )
	Function bbEGLGraphicsGetSettings( context:Byte Ptr,width Var,height Var,depth Var,hertz Var,flags Var )
	Function bbEGLGraphicsClose( context:Byte Ptr )	
	Function bbEGLGraphicsSetGraphics( context:Byte Ptr )
	Function bbEGLGraphicsFlip( sync )
End Extern

Public

Type TEGLGraphics Extends TGraphics

	Method Driver:TEGLGraphicsDriver()
		Assert _context
		Return EGLGraphicsDriver()
	End Method
	
	Method GetSettings( width Var,height Var,depth Var,hertz Var,flags Var )
		Assert _context
		Local w,h,d,r,f
		bbEGLGraphicsGetSettings _context,w,h,d,r,f
		width=w
		height=h
		depth=d
		hertz=r
		flags=f
	End Method
	
	Method Close()
		If Not _context Return
		bbEGLGraphicsClose( _context )
		_context=0
	End Method
	
	Field _context:Byte Ptr
	
End Type

Type TEGLGraphicsDriver Extends TGraphicsDriver

	Method GraphicsModes:TGraphicsMode[]()
		Local buf[1024*4]
		Local count=bbEGLGraphicsGraphicsModes( buf,1024 )
		Local modes:TGraphicsMode[count],p:Int Ptr=buf
		For Local i=0 Until count
			Local t:TGraphicsMode=New TGraphicsMode
			t.width=p[0]
			t.height=p[1]
			t.depth=p[2]
			t.hertz=p[3]
			modes[i]=t
			p:+4
		Next
		Return modes
	End Method
	
	Method AttachGraphics:TEGLGraphics( widget:Byte Ptr,flags )
		Local t:TEGLGraphics=New TEGLGraphics
		t._context=bbEGLGraphicsAttachGraphics( widget,flags )
		Return t
	End Method
	
	Method CreateGraphics:TEGLGraphics( width,height,depth,hertz,flags )
		Local t:TEGLGraphics=New TEGLGraphics
		t._context=bbEGLGraphicsCreateGraphics( width,height,depth,hertz,flags )
		Return t
	End Method
	
	Method SetGraphics( g:TGraphics )
		Local context:Byte Ptr
		Local t:TEGLGraphics=TEGLGraphics( g )
		If t context=t._context
		bbEGLGraphicsSetGraphics context
	End Method
	
	Method Flip( sync )
		bbEGLGraphicsFlip sync
	End Method
	
End Type

Rem
bbdoc: Get OpenGL graphics driver
returns: An OpenGL graphics driver
about:
The returned driver can be used with #SetGraphicsDriver
End Rem
Function EGLGraphicsDriver:TEGLGraphicsDriver()
	Global _driver:TEGLGraphicsDriver=New TEGLGraphicsDriver
	Return _driver
End Function

Rem
bbdoc: Create OpenGL graphics
returns: An OpenGL graphics object
about:
This is a convenience function that allows you to easily create an OpenGL graphics context.
End Rem
Function EGLGraphics:TGraphics( width,height,depth=0,hertz=60,flags=GRAPHICS_BACKBUFFER|GRAPHICS_DEPTHBUFFER )
	SetGraphicsDriver EGLGraphicsDriver()
	Return Graphics( width,height,depth,hertz,flags )
End Function
	
'SetGraphicsDriver EGLGraphicsDriver()

'----- Helper Functions -----

Private

Global fontTex
Global fontSeq

Global ortho_mv![16],ortho_pj![16]

Function BeginOrtho()
	Local vp[4]
Rem	
	glPushAttrib GL_ENABLE_BIT|GL_TEXTURE_BIT|GL_TRANSFORM_BIT
	
	glGetIntegerv GL_VIEWPORT,vp
	glGetDoublev GL_MODELVIEW_MATRIX,ortho_mv
	glGetDoublev GL_PROJECTION_MATRIX,ortho_pj
	
	glMatrixMode GL_MODELVIEW
	glLoadIdentity
	glMatrixMode GL_PROJECTION
	glLoadIdentity
	glOrtho 0,vp[2],vp[3],0,-1,1
EndRem
	glDisable GL_CULL_FACE
	glDisable GL_ALPHA_TEST	
	glDisable GL_DEPTH_TEST
End Function

Function EndOrtho()
Rem
	glMatrixMode GL_PROJECTION
	glLoadMatrixd ortho_pj
	glMatrixMode GL_MODELVIEW
	glLoadMatrixd ortho_mv	
	glPopAttrib
EndRem	
End Function

Public

Rem
bbdoc: Helper function to calculate nearest valid texture size
about: This functions rounds @width and @height up to the nearest valid texture size
End Rem
Function EGLAdjustTexSize( width Var,height Var )
	Function Pow2Size( n )
		Local t=1
		While t<n
			t:*2
		Wend
		Return t
	End Function
	width=Pow2Size( width )
	height=Pow2Size( height )
	Repeat
		Local t
		glTexImage2D GL_PROXY_TEXTURE_2D,0,4,width,height,0,GL_RGBA,GL_UNSIGNED_BYTE,Null
		Return ' simon come here
'		glGetTexLevelParameteriv GL_PROXY_TEXTURE_2D,0,GL_TEXTURE_WIDTH,Varptr t
'		If t Return
		If width=1 And height=1 RuntimeError "Unable to calculate tex size"
		If width>1 width:/2
		If height>1 height:/2
	Forever
End Function

Rem
bbdoc: Helper function to create a texture from a pixmap
returns: Integer GL Texture name
about: @pixmap is resized to a valid texture size before conversion.
end rem
Function EGLTexFromPixmap( pixmap:TPixmap,mipmap=True )
	If pixmap.format<>PF_RGBA8888 pixmap=pixmap.Convert( PF_RGBA8888 )
	Local width=pixmap.width,height=pixmap.height
	EGLAdjustTexSize width,height
	If width<>pixmap.width Or height<>pixmap.height pixmap=ResizePixmap( pixmap,width,height )
	
	Local old_name,old_row_len
	glGetIntegerv GL_TEXTURE_BINDING_2D,Varptr old_name
	glGetIntegerv GL_UNPACK_ROW_LENGTH,Varptr old_row_len

	Local name
	glGenTextures 1,Varptr name
	glBindtexture GL_TEXTURE_2D,name
	
	Local mip_level
	Repeat
		glPixelStorei GL_UNPACK_ROW_LENGTH,pixmap.pitch/BytesPerPixel[pixmap.format]
		glTexImage2D GL_TEXTURE_2D,mip_level,GL_RGBA8,width,height,0,GL_RGBA,GL_UNSIGNED_BYTE,pixmap.pixels
		If Not mipmap Exit
		If width=1 And height=1 Exit
		If width>1 width:/2
		If height>1 height:/2
		pixmap=ResizePixmap( pixmap,width,height )
		mip_level:+1
	Forever
	
	glBindTexture GL_TEXTURE_2D,old_name
	glPixelStorei GL_UNPACK_ROW_LENGTH,old_row_len

	Return name
End Function

Rem
bbdoc:Helper function to output a simple rectangle
about:
Draws a rectangle relative to top-left of current viewport.
End Rem
Function EGLDrawRect( x,y,width,height )
	BeginOrtho
Rem
	glBegin GL_QUADS
	glVertex2i x,y
	glVertex2i x+width,y
	glVertex2i x+width,y+height
	glVertex2i x,y+height
	glEnd
EndRem	
	EndOrtho
End Function

Rem
bbdoc: Helper function to output some simple 8x16 font text
about:
Draws text relative to top-left of current viewport.<br>
<br>
The font used is an internal fixed point 8x16 font.<br>
<br>
This function is intended for debugging purposes only - performance is unlikely to be stellar.
End Rem
Function EGLDrawText( text$,x,y )
'	If fontSeq<>graphicsSeq
	If Not fontTex
		Local pixmap:TPixmap=TPixmap.Create( 1024,16,PF_RGBA8888 )
		Local p:Byte Ptr=IncbinPtr( "gldrawtextfont.bin" )
		For Local y=0 Until 16
			For Local x=0 Until 96
				Local b=p[x]
				For Local n=0 Until 8
					If b & (1 Shl n) 
						pixmap.WritePixel x*8+n,y,~0
					Else
						pixmap.WritePixel x*8+n,y,0
					EndIf
				Next
			Next
			p:+96
		Next
		fontTex=EGLTexFromPixmap( pixmap )
		fontSeq=graphicsSeq
	EndIf
	
	BeginOrtho
Rem	
	glEnable GL_TEXTURE_2D
	glBindTexture GL_TEXTURE_2D,fontTex
	
	For Local i=0 Until text.length
		Local c=text[i]-32
		If c>=0 And c<96
			Const adv#=8/1024.0
			Local t#=c*adv;
			glBegin GL_QUADS
			glTexcoord2f t,0
			glVertex2f x,y
			glTexcoord2f t+adv,0
			glVertex2f x+8,y
			glTexcoord2f t+adv,1
			glVertex2f x+8,y+16
			glTexcoord2f t,1
			glVertex2f x,y+16
			glEnd
		EndIf
		x:+8
	Next
EndRem
	EndOrtho
End Function

Rem
bbdoc: Helper function to draw a pixmap to a gl context
about:
Draws the pixmap relative to top-left of current viewport.<br>
<br>
This function is intended for debugging purposes only - performance is unlikely to be stellar.
End Rem
Function EGLDrawPixmap( pixmap:TPixmap,x,y )
	BeginOrtho

	Local t:TPixmap=YFlipPixmap(pixmap)
	If t.format<>PF_RGBA8888 t=ConvertPixmap( t,PF_RGBA8888 )
Rem
	glRasterPos2i 0,0
	glBitmap 0,0,0,0,x,-y-t.height,Null
	glDrawPixels t.width,t.height,GL_RGBA,GL_UNSIGNED_BYTE,t.pixels
EndRem
	EndOrtho
End Function

Rem
bbdoc: Enable OpenGL context sharing
about:
Calling #GLShareContexts will cause all opengl graphics contexts created to
shared displaylists, textures, shaders etc.

This should be called before any opengl contexts are created.
End Rem
Function EGLShareContexts()
	bbEGLGraphicsShareContexts
End Function
