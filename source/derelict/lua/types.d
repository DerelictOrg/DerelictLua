/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.lua.types;

private import std.c.stdio : FILE;

//lua.h
// The minimum version of Lua with which this binding is compatible.
enum LUA_VERSION_MAJOR ="5";
enum LUA_VERSION_MINOR ="3";
enum LUA_VERSION_NUM = 503;
enum LUA_VERSION_RELEASE = "0";

enum LUA_VERSION = "Lua " ~ LUA_VERSION_MAJOR ~ "." ~ LUA_VERSION_MINOR;
enum LUA_RELEASE = LUA_VERSION ~ "." ~ LUA_VERSION_RELEASE;
enum LUA_COPYRIGHT = LUA_RELEASE ~ "  Copyright (C) 1994-2015 Lua.org, PUC-Rio";
enum LUA_AUTHORS = "R. Ierusalimschy, L. H. de Figueiredo, W. Celes";

enum LUA_SIGNATURE = "\033Lua";
enum LUA_MULTRET = -1;

enum LUA_REGISTRYINDEX = LUAI_FIRSTPSEUDOIDX;

int lua_upvalueindex( int i ) {
    return LUA_REGISTRYINDEX - i;
}

enum {
    LUA_OK = 0,
    LUA_YIELD = 1,
    LUA_ERRRUN = 2,
    LUA_ERRSYNTAX = 3,
    LUA_ERRMEM = 4,
    LUA_ERRGCMM = 5,
    LUA_ERRERR = 6,
}

struct lua_State;

extern( C ) nothrow {
    alias lua_CFunction = int function( lua_State* L );
    alias lua_KFunction = int function( lua_State* L, int status, lua_KContext ctx );
    alias lua_Reader = const( char )* function( lua_State* L, void* ud, size_t* sz );
    alias lua_Writer = int function( lua_State* L, const( void )* p, size_t sz, void* ud );
    alias lua_Alloc = void* function( void* ud, void* ptr, size_t osize, size_t nsize );
}

enum {
    LUA_TNONE = -1,
    LUA_TNIL = 0,
    LUA_TBOOLEAN = 1,
    LUA_TLIGHTUSERDATA = 2,
    LUA_TNUMBER = 3,
    LUA_TSTRING = 4,
    LUA_TTABLE = 5,
    LUA_TFUNCTION = 6,
    LUA_TUSERDATA = 7,
    LUA_TTHREAD = 8,
    LUA_NUMTAGS = 9,

    LUA_MINSTACK = 20,

    LUA_RIDX_MAINTHREAD = 1,
    LUA_RIDX_GLOBALS = 2,
    LUA_RIDX_LAST = LUA_RIDX_GLOBALS,
}

alias lua_Number = double;
alias lua_Integer = long;
alias lua_Unsigned = ulong;
alias lua_KContext = ptrdiff_t;

enum {
    LUA_OPADD = 0,
    LUA_OPSUB = 1,
    LUA_OPMUL = 2,
    LUA_OPMOD = 3,
    LUA_OPPOW = 4,
    LUA_OPDIV = 5,
    LUA_OPIDIV= 6,
    LUA_OPBAND= 7,
    LUA_OPBOR = 8,
    LUA_OPBXOR= 9,
    LUA_OPSHL = 10,
    LUA_OPSHR = 11,
    LUA_OPUNM = 12,
    LUA_OPBNOT= 13,

    LUA_OPEQ = 0,
    LUA_OPLT = 1,
    LUA_OPLE = 2,

    LUA_GCSTOP = 0,
    LUA_GCRESTART = 1,
    LUA_GCCOLLECT = 2,
    LUA_GCCOUNT = 3,
    LUA_GCCOUNTB = 4,
    LUA_GCSTEP = 5,
    LUA_GCSETPAUSE = 6,
    LUA_GCSETSTEPMUL = 7,
    LUA_GCISRUNNING = 9,

    LUA_HOOKCALL = 0,
    LUA_HOOKRET = 1,
    LUA_HOOKLINE = 2,
    LUA_HOOKCOUNT = 3,
    LUA_HOOKTAILCALL = 4,

    LUA_MASKCALL = 1 << LUA_HOOKCALL,
    LUA_MASKRET = 1 << LUA_HOOKRET,
    LUA_MASKLINE = 1 << LUA_HOOKLINE,
    LUA_MASKCOUNT = 1 << LUA_HOOKCOUNT,
}

struct lua_Debug {
    int event;
    const(char*) name;
    const(char*) namewhat;
    const(char*) what;
    const(char*) source;
    int currentline;
    int linedefined;
    int lastlinedefined;
    ubyte nups;
    ubyte nparams;
    byte isvararg;
    byte istailcall;
    char[LUA_IDSIZE] short_src;
    // private
    void* i_ci;
}

enum LUA_ERRFILE = LUA_ERRERR + 1;

extern( C ) nothrow alias lua_Hook  = void function( lua_State*, lua_Debug* );

//lauxlib.h
struct luaL_Reg {
    const( char )* name;
    lua_CFunction func;
}

enum int LUA_NOREF = -2;
enum int LUA_REFNIL = -1;

struct luaL_Buffer {
    char* b;
    size_t size;
    size_t n;
    lua_State* L;
    char[ (0x80 * (void*).sizeof * lua_Integer.sizeof) ] initb;
}

struct luaL_Stream {
    FILE *f;
    lua_CFunction closef;
}

//lualib.h
enum : string {
    LUA_COLIBNAME = "coroutine",
    LUA_TABLIBNAME = "table",
    LUA_IOLIBNAME = "io",
    LUA_OSLIBNAME = "os",
    LUA_STRLIBNAME = "string",
    LUA_UTF8LIBNAME = "utf8",
    LUA_BITLIBNAME = "bit32",
    LUA_MATHLIBNAME = "math",
    LUA_DBLIBNAME = "debug",
    LUA_LOADLIBNAME = "package",
}

//luaconf.h
alias LUA_INT32 = int;
alias LUAI_UMEM = size_t;
alias LUAI_MEM = ptrdiff_t;
alias LUA_NUMBER = double;
alias LUAI_UACNUMBER = double;
alias LUA_INTEGER = long;
alias LUA_UNSIGNED = ulong;
alias LUA_KCONTEXT = ptrdiff_t;

enum LUA_NUMBER_SCAN = "%lf";
enum LUA_NUMBER_FMT = "%.14g";
enum LUAI_MAXSTACK = 1000000;
enum LUAI_FIRSTPSEUDOIDX = -LUAI_MAXSTACK - 1000;
enum LUA_IDSIZE = 60;
enum LUAI_MAXSHORTLEN = 40;
