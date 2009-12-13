// ***************************************************************************
//
//   Generated automatically by genwrapper.
//   Please DO NOT EDIT this file!
//
// ***************************************************************************

#include <osgIntrospection/ReflectionMacros>
#include <osgIntrospection/TypedMethodInfo>
#include <osgIntrospection/StaticMethodInfo>
#include <osgIntrospection/Attributes>

#include <OpenThreads/Condition>
#include <OpenThreads/Mutex>

// Must undefine IN and OUT macros defined in Windows headers
#ifdef IN
#undef IN
#endif
#ifdef OUT
#undef OUT
#endif

BEGIN_OBJECT_REFLECTOR(OpenThreads::Condition)
	I_DeclaringFile("OpenThreads/Condition");
	I_Constructor0(____Condition,
	               "Constructor. ",
	               "");
	I_Method1(int, wait, IN, OpenThreads::Mutex *, mutex,
	          Properties::VIRTUAL,
	          __int__wait__Mutex_P1,
	          "Wait on a mutex. ",
	          "");
	I_Method2(int, wait, IN, OpenThreads::Mutex *, mutex, IN, unsigned long int, ms,
	          Properties::VIRTUAL,
	          __int__wait__Mutex_P1__unsigned_long_int,
	          "Wait on a mutex for a given amount of time (ms). ",
	          "0 if normal, -1 if errno set, errno code otherwise.  ");
	I_Method0(int, signal,
	          Properties::VIRTUAL,
	          __int__signal,
	          "Signal a SINGLE thread to wake if it's waiting. ",
	          "0 if normal, -1 if errno set, errno code otherwise.  ");
	I_Method0(int, broadcast,
	          Properties::VIRTUAL,
	          __int__broadcast,
	          "Wake all threads waiting on this condition. ",
	          "0 if normal, -1 if errno set, errno code otherwise.  ");
END_REFLECTOR
