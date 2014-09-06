
#include "std.h"
#include "bbsys.h"

gxInput *gx_input;
gxDevice *gx_mouse;
gxDevice *gx_keyboard;
vector<gxDevice*> gx_joysticks;

static int mouse_x,mouse_y,mouse_z;
static const float JLT=-1.0f/3.0f;
static const float JHT=1.0f/3.0f;

bool input_create(){
	if( gx_input=gx_runtime->openInput( 0 ) ){
		if( gx_keyboard=gx_input->getKeyboard() ){
			if( gx_mouse=gx_input->getMouse() ){
				gx_joysticks.clear();
				for( int k=0;k<gx_input->numJoysticks();++k ){
					gx_joysticks.push_back( gx_input->getJoystick(k) );
				}
				mouse_x=mouse_y=mouse_z=0;
				return true;
			}
		}
		gx_runtime->closeInput( gx_input );
		gx_input=0;
	}
	return false;
}

bool input_destroy(){
	gx_joysticks.clear();
	gx_runtime->closeInput( gx_input );
	gx_input=0;
	return true;
}

int bbKeyDown( int n ){
	return gx_keyboard->keyDown( n );
}

int bbKeyHit( int n ){
	return gx_keyboard->keyHit( n );
}

int bbGetKey(){
	return gx_input->toAscii( gx_keyboard->getKey() );
}

int bbWaitKey(){
	for(;;){
		if( !gx_runtime->idle() ) RTEX( 0 );
		if( int key=gx_keyboard->getKey( ) ){
			if( key=gx_input->toAscii( key ) ) return key;
		}
		gx_runtime->delay( 20 );
	}
}

void bbFlushKeys(){
	gx_keyboard->flush();
}

int bbMouseDown( int n ){
	return gx_mouse->keyDown( n );
}

int bbMouseHit( int n ){
	return gx_mouse->keyHit( n );
}

int bbGetMouse(){
	return gx_mouse->getKey();
}

int bbWaitMouse(){
	for(;;){
		if( !gx_runtime->idle() ) RTEX( 0 );
		if( int key=gx_mouse->getKey() ) return key;
		gx_runtime->delay( 20 );
	}
}

int bbMouseWait(){
	return bbWaitMouse();
}

int bbMouseX(){
	return gx_mouse->getAxisState( 0 );
}

int bbMouseY(){
	return gx_mouse->getAxisState( 1 );
}

int bbMouseZ(){
	return gx_mouse->getAxisState( 2 )/120;
}

int bbMouseXSpeed(){
	int dx=bbMouseX()-mouse_x;
	mouse_x+=dx;
	return dx;
}

int bbMouseYSpeed(){
	int dy=bbMouseY()-mouse_y;
	mouse_y+=dy;
	return dy;
}

int bbMouseZSpeed(){
	int dz=bbMouseZ()-mouse_z;
	mouse_z+=dz;
	return dz;
}

void bbFlushMouse(){
	gx_mouse->flush();
}

void bbMoveMouse( int x,int y ){
	gx_input->moveMouse( mouse_x=x,mouse_y=y );
}

int bbJoyType( int port ){
	return gx_input->getJoystickType( port );
}

int bbJoyDown( int n,int port ){
	if( port<0 || port>=gx_joysticks.size() ) return 0;
	return gx_joysticks[port]->keyDown( n );
}

int bbJoyHit( int n,int port ){
	if( port<0 || port>=gx_joysticks.size() ) return 0;
	return gx_joysticks[port]->keyHit( n );
}

int bbGetJoy( int port ){
	if( port<0 || port>=gx_joysticks.size() ) return 0;
	return gx_joysticks[port]->getKey();
}

int bbWaitJoy( int port ){
	if( port<0 || port>=gx_joysticks.size() ) return 0;
	for(;;){
		if( !gx_runtime->idle() ) RTEX( 0 );
		if( int key=gx_joysticks[port]->getKey() ) return key;
		gx_runtime->delay( 20 );
	}
}

float bbJoyX( int port ){
	if( port<0 || port>=gx_joysticks.size() ) return 0;
	return gx_joysticks[port]->getAxisState(0);
}

float bbJoyY( int port ){
	if( port<0 || port>=gx_joysticks.size() ) return 0;
	return gx_joysticks[port]->getAxisState(1);
}

float bbJoyZ( int port ){
	if( port<0 || port>=gx_joysticks.size() ) return 0;
	return gx_joysticks[port]->getAxisState(2);
}

float bbJoyU( int port ){
	if( port<0 || port>=gx_joysticks.size() ) return 0;
	return gx_joysticks[port]->getAxisState(3);
}

float bbJoyV( int port ){
	if( port<0 || port>=gx_joysticks.size() ) return 0;
	return gx_joysticks[port]->getAxisState(4);
}

float bbJoyPitch( int port ){
	if( port<0 || port>=gx_joysticks.size() ) return 0;
	return gx_joysticks[port]->getAxisState(5)*180;
}

float bbJoyYaw( int port ){
	if( port<0 || port>=gx_joysticks.size() ) return 0;
	return gx_joysticks[port]->getAxisState(6)*180;
}

float bbJoyRoll( int port ){
	if( port<0 || port>=gx_joysticks.size() ) return 0;
	return gx_joysticks[port]->getAxisState(7)*180;
}

int  bbJoyHat( int port ){
	if( port<0 || port>=gx_joysticks.size() ) return 0;
	return gx_joysticks[port]->getAxisState(8);
}

int	bbJoyXDir( int port ){
	if( port<0 || port>=gx_joysticks.size() ) return 0;
	float t=gx_joysticks[port]->getAxisState(0);
	return t<JLT ? -1 : ( t>JHT ? 1 : 0 );
}

int bbJoyYDir( int port ){
	if( port<0 || port>=gx_joysticks.size() ) return 0;
	float t=gx_joysticks[port]->getAxisState(1);
	return t<JLT ? -1 : ( t>JHT ? 1 : 0 );
}

int	bbJoyZDir( int port ){
	if( port<0 || port>=gx_joysticks.size() ) return 0;
	float t=gx_joysticks[port]->getAxisState(2);
	return t<JLT ? -1 : ( t>JHT ? 1 : 0 );
}

int	bbJoyUDir( int port ){
	if( port<0 || port>=gx_joysticks.size() ) return 0;
	float t=gx_joysticks[port]->getAxisState(3);
	return t<JLT ? -1 : ( t>JHT ? 1 : 0 );
}

int	bbJoyVDir( int port ){
	if( port<0 || port>=gx_joysticks.size() ) return 0;
	float t=gx_joysticks[port]->getAxisState(4);
	return t<JLT ? -1 : ( t>JHT ? 1 : 0 );
}

void bbFlushJoy(){
	for( int k=0;k<gx_joysticks.size();++k ) gx_joysticks[k]->flush();
}

void  bbEnableDirectInput( int enable ){
	gx_runtime->enableDirectInput( !!enable );
}

int  bbDirectInputEnabled(){
	return gx_runtime->directInputEnabled();
}

void input_link( void (*rtSym)( const char *sym,void *pc ) ){
	rtSym( "%KeyDown%key",(void*)bbKeyDown );
	rtSym( "%KeyHit%key",(void*)bbKeyHit );
	rtSym( "%GetKey",(void*)bbGetKey );
	rtSym( "%WaitKey",(void*)bbWaitKey );
	rtSym( "FlushKeys",(void*)bbFlushKeys );

	rtSym( "%MouseDown%button",(void*)bbMouseDown );
	rtSym( "%MouseHit%button",(void*)bbMouseHit );
	rtSym( "%GetMouse",(void*)bbGetMouse );
	rtSym( "%WaitMouse",(void*)bbWaitMouse );
	rtSym( "%MouseWait",(void*)bbWaitMouse );
	rtSym( "%MouseX",(void*)bbMouseX );
	rtSym( "%MouseY",(void*)bbMouseY );
	rtSym( "%MouseZ",(void*)bbMouseZ );
	rtSym( "%MouseXSpeed",(void*)bbMouseXSpeed );
	rtSym( "%MouseYSpeed",(void*)bbMouseYSpeed );
	rtSym( "%MouseZSpeed",(void*)bbMouseZSpeed );
	rtSym( "FlushMouse",(void*)bbFlushMouse );
	rtSym( "MoveMouse%x%y",(void*)bbMoveMouse );

	rtSym( "%JoyType%port=0",(void*)bbJoyType );
	rtSym( "%JoyDown%button%port=0",(void*)bbJoyDown );
	rtSym( "%JoyHit%button%port=0",(void*)bbJoyHit );
	rtSym( "%GetJoy%port=0",(void*)bbGetJoy );
	rtSym( "%WaitJoy%port=0",(void*)bbWaitJoy );
	rtSym( "%JoyWait%port=0",(void*)bbWaitJoy );
	rtSym( "#JoyX%port=0",(void*)bbJoyX );
	rtSym( "#JoyY%port=0",(void*)bbJoyY );
	rtSym( "#JoyZ%port=0",(void*)bbJoyZ );
	rtSym( "#JoyU%port=0",(void*)bbJoyU );
	rtSym( "#JoyV%port=0",(void*)bbJoyV );
	rtSym( "#JoyPitch%port=0",(void*)bbJoyPitch );
	rtSym( "#JoyYaw%port=0",(void*)bbJoyYaw );
	rtSym( "#JoyRoll%port=0",(void*)bbJoyRoll );
	rtSym( "%JoyHat%port=0",(void*)bbJoyHat );
	rtSym( "%JoyXDir%port=0",(void*)bbJoyXDir );
	rtSym( "%JoyYDir%port=0",(void*)bbJoyYDir );
	rtSym( "%JoyZDir%port=0",(void*)bbJoyZDir );
	rtSym( "%JoyUDir%port=0",(void*)bbJoyUDir );
	rtSym( "%JoyVDir%port=0",(void*)bbJoyVDir );
	rtSym( "FlushJoy",(void*)bbFlushJoy );

	rtSym( "EnableDirectInput%enable",(void*)bbEnableDirectInput );
	rtSym( "%DirectInputEnabled",(void*)bbDirectInputEnabled );
}