
#include <stdio.h>
#include <EGL/egl.h>
#include <GLES/gl.h>
#include "bcm_host.h"
#include <assert.h>
#include <brl.mod/blitz.mod/blitz.h>

extern void bbSystemPoll();

enum{
	MODE_SHARED=0,
	MODE_WIDGET=1,
	MODE_WINDOW=2,
	MODE_DISPLAY=3
};

enum{
	FLAGS_BACKBUFFER=	0x2,
	FLAGS_ALPHABUFFER=	0x4,
	FLAGS_DEPTHBUFFER=	0x8,
	FLAGS_STENCILBUFFER=0x10,
	FLAGS_ACCUMBUFFER=	0x20,
	FLAGS_FULLSCREEN=0x80000000
};

typedef struct BBEGLContext BBEGLContext;

struct  BBEGLContext
{
	int width;
	int height;
	int depth;
	int hertz;
	int flags;

	EGLContext context;
	EGLSurface surface;
};
// eglgraphics.bmx interface

int bbEGLGraphicsGraphicsModes( int *imodes,int maxcount );
BBEGLContext *bbEGLGraphicsAttachGraphics( void * window,int flags );
BBEGLContext *bbEGLGraphicsCreateGraphics( int width,int height,int depth,int hz,int flags );
void bbEGLGraphicsGetSettings( BBEGLContext *context,int *width,int *height,int *depth,int *hz,int *flags );
void bbEGLGraphicsClose( BBEGLContext *context );
void bbEGLGraphicsSetGraphics( BBEGLContext *context );
void bbEGLGraphicsFlip( int sync );
void bbEGLExit();

int _hosting=0;

EGLint major;
EGLint minor;

EGLDisplay display;

EGLConfig config;

int _initDevice(){

	atexit( bbEGLExit );

	bcm_host_init();
	
	_hosting=1;

	display=eglGetDisplay(EGL_DEFAULT_DISPLAY);
	printf("initializing display %d\n",display);

	EGLBoolean result=eglInitialize(display,&major,&minor);

	assert(result==EGL_TRUE);
	printf("egl success version %d.%d\n");

	static const EGLint configAttribs[]={
		EGL_CONFORMANT,EGL_OPENGL_ES2_BIT,
		EGL_RED_SIZE,8,
		EGL_GREEN_SIZE,8,
		EGL_BLUE_SIZE,8,
		EGL_SURFACE_TYPE,EGL_WINDOW_BIT,
		EGL_NONE};

	EGLint num_config=0;
	eglChooseConfig(display,configAttribs,&config,1,&num_config);
	printf("got %d configs\n",num_config);
}

BBEGLContext DeviceContext;

BBEGLContext *createDisplayContext(){
	EGLContext context;
	EGLSurface surface;

	static const EGLint contextAttribs[]={
		EGL_CONTEXT_CLIENT_VERSION,2,
		EGL_NONE};

	context=eglCreateContext(display,config,EGL_NO_CONTEXT,contextAttribs);
	assert(eglGetError()==EGL_SUCCESS);

	unsigned int width,height;

	graphics_get_display_size(0,&width,&height);
	printf("display size is %dx%d\n",width,height);

	VC_RECT_T dst={0};
	dst.width=width;
	dst.height=height;
	VC_RECT_T src={0};
	src.width=width<<16;
	src.height=height<<16;

	static EGL_DISPMANX_WINDOW_T nativewindow;

	DISPMANX_ELEMENT_HANDLE_T dispman_element;
	DISPMANX_DISPLAY_HANDLE_T dispman_display;
	DISPMANX_UPDATE_HANDLE_T dispman_update;

	dispman_display = vc_dispmanx_display_open( 0 /* LCD */);
	dispman_update = vc_dispmanx_update_start( 0 );

	dispman_element = vc_dispmanx_element_add ( dispman_update,
                                             dispman_display, 0/*layer*/, &dst, 0/*src*/,
                                             &src, DISPMANX_PROTECTION_NONE, 0 /*alpha*/,
                                             0/*clamp*/, DISPMANX_NO_ROTATE/*transform*/);

	nativewindow.element = dispman_element;
 	nativewindow.width = width;
	nativewindow.height = height;

	vc_dispmanx_update_submit_sync( dispman_update );

	surface=eglCreateWindowSurface(display,config,&nativewindow,NULL);

	eglMakeCurrent(display,surface,surface,context);

	DeviceContext.width=width;
	DeviceContext.height=height;
	DeviceContext.depth=32;
	DeviceContext.hertz=60;
	DeviceContext.context=context;
	DeviceContext.surface=surface;

	return &DeviceContext;
}

int bbEGLGraphicsGraphicsModes( int *imodes,int maxcount ){

	if(_hosting==0) _initDevice();

	unsigned int width,height;

	graphics_get_display_size(0,&width,&height);

	*imodes++=(int)width;
	*imodes++=(int)height;
	*imodes++=24;
	*imodes++=60;

	return 1;
}

BBEGLContext *bbEGLGraphicsAttachGraphics( void * window,int flags ){
	return 0;
}

void bbEGLGraphicsGetSettings( BBEGLContext *context,int *width,int *height,int *depth,int *hertz,int *flags ){
//	_validateSize( context );
	*width=context->width;
	*height=context->height;
	*depth=context->depth;
	*hertz=context->hertz;
	*flags=context->flags;
}

void bbEGLGraphicsShareContexts(){
}

BBEGLContext *bbEGLGraphicsCreateGraphics( int width,int height,int depth,int hz,int flags ){
	printf("CreateGraphics!\n");
	if(_hosting==0) _initDevice();
	return createDisplayContext();
}

void bbEGLGraphicsSetGraphics( BBEGLContext *context )
{
}

void bbEGLGraphicsFlip( int sync )
{
//	printf("eglFlip\n");	
	eglSwapBuffers(display,DeviceContext.surface);
}

void bbEGLGraphicsClose( BBEGLContext *context )
{
}

void bbEGLExit()
{
	eglTerminate(display);
}
