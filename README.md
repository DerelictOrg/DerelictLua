DerelictLua
============

A dynamic binding to version 5.2 of the [Lua][1] scripting language for the D Programming Language.

The preferred way of using DerelictLua is with the
[DUB package and build manager][2].

##Using DerelictLua with DUB management##

Put the following dependency into your project's package.json, like so:

```json
{
    ...
    "dependencies": {
        "derelict_extras-lua": "~master"
    }
}
```

##Using DerelictLua with manual management##

See the [Using Derelict][3] page at The One With D.

##Setting up the Lua dynamic library##

Depending on your operating system, you will need one of the following dynamic
libraries accessible to the D linker:

* lua52.dll (Windows)
* liblua5.2.so (POSIX)

On Windows, you can simply download [a pre-built Lua 5.2 binary][4]. On a POSIX
system, Lua 5.2 will likely be available through your package manager. If
pre-built binaries are not available or not preferred,
[the Lua 5.2 source code package][5] is programmed in ANSI C and can be built
by any ANSI compliant C compiler.

After the dynamic library has been downloaded or compiled, just put it in a
directory included in your PATH environmental variable. Alternatively, you can
use the `lflags` build setting in DUB or the `-L` command line argument in most
D compilers.

##Loading Lua library via DerelictLua##

Once the Lua 5.2 dynamic library is accessible to your D linker, you can start
using the Lua 5.2 C API by loading DerelictLua:

```D
import derelict.lua.lua;

void main()
{
    // Load the Lua library.
    DerelictLua.load();

    // Now Lua functions can be called.
    ...
}
```

For more in-depth information on how to load DerelictOrg libraries, see
[DerelictUtil for Users][6].

From here, you can utilize [tutorials and other information resources][7] about
the Lua 5.2 C API.

##See Also##

* [LuaD][8] – A D binding for the Lua 5.1 C API with a convenient wrapper

[1]: http://www.lua.org/
[2]: http://code.dlang.org/about
[3]: http://dblog.aldacron.net/derelict-help/using-derelict/
[4]: http://joedf.users.sourceforge.net/luabuilds/
[5]: http://www.lua.org/ftp/
[6]: https://github.com/DerelictOrg/DerelictUtil/wiki/DerelictUtil-for-Users
[7]: http://www.lua.org/pil/contents.html#24
[8]: https://github.com/JakobOvrum/LuaD
