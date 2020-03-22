# -----------------------------------------------------------------
# --- Script to search for all the .cpp files in the chosen folder
# -----------------------------------------------------------------

file( GLOB_RECURSE OFX_LUA_CPP
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxLua/src/*.cpp"
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxLua/src/bindings/desktop/*.cpp"
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxLua/libs/lua/*.c"
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxLua/libs/lua/*.hpp"
        )

# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories(
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxLua/src"
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxLua/src/bindings"
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxLua/libs/lua"
        )

# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------

add_library(    ofxLua
                STATIC
                ${OFX_LUA_CPP}
                )
