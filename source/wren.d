module wren;

public import wren_bindings;

version (unittest):

extern (C) void writeFn(WrenVM* vm, const char* text) {
  import std.stdio : writef;
  writef("%s", text);
}

unittest {
  WrenConfiguration config;
  wrenInitConfiguration(&config);
  config.writeFn = &writeFn;
  WrenVM* vm = wrenNewVM(&config);
  wrenFreeVM(vm);
}
