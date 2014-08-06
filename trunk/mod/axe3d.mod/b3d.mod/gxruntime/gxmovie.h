#ifndef GXMOVIE_H
#define GXMOVIE_H

#include "gxcanvas.h"

class gxGraphics;

//#define HAVE_DPLAY

#ifndef HAVE_DPLAY

// no-op version for now

class gxMovie{

public:
	gxMovie( gxGraphics *gfx,void *mm_stream ){}
	~gxMovie(){}

private:
	bool playing;
	RECT src_rect;
	gxGraphics *gfx;
	gxCanvas *canvas;

	/***** GX INTERFACE *****/
public:

	bool draw( gxCanvas *dest,int x,int y,int w,int h ){}

	bool isPlaying()const{ return playing; }
	int getWidth()const{ return src_rect.right; }
	int getHeight()const{ return src_rect.bottom; }
};

#else


#include "mmstream.h"    // multimedia stream interfaces
#include "amstream.h"    // DirectShow multimedia stream interfaces
#include "ddstream.h"    // DirectDraw multimedia stream interfaces

class gxMovie{

public:
	gxMovie( gxGraphics *gfx,IMultiMediaStream *mm_stream );
	~gxMovie();

private:
	bool playing;
	RECT src_rect;
	gxGraphics *gfx;
	gxCanvas *canvas;
	IDirectDrawSurface *dd_surf;
	IMediaStream *vid_stream;
	IDirectDrawMediaStream *dd_stream;
	IDirectDrawStreamSample *dd_sample;
	IMultiMediaStream *mm_stream;

	/***** GX INTERFACE *****/
public:

	bool draw( gxCanvas *dest,int x,int y,int w,int h );

	bool isPlaying()const{ return playing; }
	int getWidth()const{ return src_rect.right; }
	int getHeight()const{ return src_rect.bottom; }
};

#endif

#endif