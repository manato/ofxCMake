# -----------------------------------------------------------------
# --- Script to search for all the .cpp files in the chosen folder
# -----------------------------------------------------------------

file(   GLOB_RECURSE
        OFX_OFXMTAPPFRAMEWORK_CPP
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxMTVideoInput/src/*.cpp"
        )

# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories(    "${OF_DIRECTORY_ABSOLUTE}/addons/ofxMTVideoInput/src" )

# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------

add_library(    ofxMTVideoInput
                STATIC
                ${OFX_OFXMTAPPFRAMEWORK_CPP} )
