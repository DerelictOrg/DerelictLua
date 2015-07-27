DerelictLua
============

A dynamic binding to version 5.2 of the [Lua][1] scripting language for the D Programming Language.

For information on how to build DerelictLua and link it with your programs, please see the post [Using Derelict][2] at The One With D.

For information on how to load the Lua librarys via DerelictLua, see the page [DerelictUtil for Users][3] at the DerelictUtil Wiki. In the meantime, here's some sample code.

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
[2]: http://dblog.aldacron.net/derelict-help/using-derelict/
[3]: https://github.com/DerelictOrg/DerelictUtil/wiki/DerelictUtil-for-Users
