local lm = require "luamake"

lm:runlua {
    script = "test/gen.lua",
    output = "test/api.h",
}

lm:phony {
    input = "test/api.h",
    output = "test/main.cpp",
}

lm:lua_dll "test" {
    cxx = "c++17",
    includes = ".",
    sources = "test/main.cpp"
}

lm:runlua {
    deps = "test",
    script = "test.lua",
}
