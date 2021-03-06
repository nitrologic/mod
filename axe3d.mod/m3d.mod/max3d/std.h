/*
Max3D
Copyright (c) 2008, Mark Sibly
All rights reserved.

Redistribution and use in source and binary forms, with or without
conditions are met:

* Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

* Neither the name of Max3D's copyright owner nor the names of its contributors
may be used to endorse or promote products derived from this software without
specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

#ifndef STD_H
#define STD_H

#define USE_RECT_TEX

//STL
#include <set>
#include <map>
#include <list>
#include <vector>
#include <string>
#include <sstream>
#include <fstream>
#include <iostream>
#include <queue>
#include <typeinfo>

#include <string.h>
#include <stdlib.h>

using namespace std;

void _LOG_( const string &t,const char *file,int line );
void _ERROR_( const string &t,const char *file,int line );
void _WARNING_( const string &t,const char *file,int line );

#define Log( X ) _LOG_(X,__FILE__,__LINE__)
#define Error( X ) _ERROR_(X,__FILE__,__LINE__)
#define Warning( X ) _WARNING_(X,__FILE__,__LINE__)
#define Assert( X ) if( !(X) ) Error( "Assert failed" );
#define Print( X ) cout<<(X)<<endl

//MATH3D
#include "math3d.h"

string LoadString( const string &file );

string operator+( const string &t,int n );
inline string operator+( int n,const string &t ){ return operator+( t,n ); }

string operator+( const string &t,float n );
inline string operator+( float n,const string &t ){ return operator+( t,n ); }

void Tokenize(const string& str,vector<string>& tokens,const string& delimiters = " ");

string toupper( string t );
string tolower( string t );

#undef LoadString

#endif
