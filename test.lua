local function require_c(name)
    local fullpath = assert(package.searchpath(name, package.cpath))
    local initfunc = assert(package.loadlib(fullpath, "luaopen_"..name))
    return initfunc()
end
require_c "test"
