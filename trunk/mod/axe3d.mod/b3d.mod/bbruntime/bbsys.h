
#ifndef BBSYS_H
#define BBSYS_H

#include "basic.h"
#include "../gxruntime/gxruntime.h"

extern bool debug;
extern gxRuntime *gx_runtime;

#ifdef HAS_EXCEPTIONS

struct bbEx{
	const char *err;
	bbEx( const char *e ):err(e){
		if( e ) gx_runtime->debugError( e );
	}
};

#define RTEX( _X_ ) throw bbEx( _X_ );

#else

#define RTEX( _X_ ) printf("%s\n",_X_); exit(1);

#endif

#endif