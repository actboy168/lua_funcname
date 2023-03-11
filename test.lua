local function require_c(name)
    local fullpath = assert(package.searchpath(name, package.cpath))
    local initfunc = assert(package.loadlib(fullpath, "luaopen_"..name))
    return initfunc()
end

local platform = require 'bee.platform'
print("Compiler: ", platform.CompilerVersion)

require_c "test"
