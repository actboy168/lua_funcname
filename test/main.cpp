#include "lua_funcname.h"
#include <lua.hpp>
#include <assert.h>

#define TEST(NAME) \
    do { \
        if constexpr (lua::function_name_v<NAME> != #NAME) { \
            failed++; \
            printf("failed: " #NAME "\t==> %s\n", lua::function_name_v<NAME>.data()); \
        } \
    } while(0)

#if defined(_WIN32)
extern "C" __declspec(dllexport)
#else
extern "C" __attribute__((visibility("default")))
#endif
int luaopen_test(lua_State* L) {
    int failed = 0;
    #include "test/api.h"
    if (failed == 0) {
        printf("success!\n");
    }
    else {
        printf("failed: %d.\n", failed);
    }
    return 0;
}
