DerelictLua
============

A dynamic binding to version 5.3 of the [Lua][1] scripting language for the D Programming Language.

Please see the sections on [Compiling and Linking][2] and [The Derelict Loader][3], in the Derelict documentation, for information on how to build DerelictLua and load Lua at run time. In the meantime, here's some sample code.

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

[1]: http://www.lua.org/
[2]: http://derelictorg.github.io/building/overview/
[3]: http://derelictorg.github.io/loading/loader/
