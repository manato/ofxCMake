# =================================================================
#
# Template for addOns
#
# Easiest way: replace all the NAME into the name of your addOn
# It has to have the same name, as the directory it is in
# [e.g. ofxOneEuroFilter is in of/addons/ofxOneEuroFilter/]
#
# =================================================================

set( NAME_ADDON     ofxFBX )       # <--- Set the name here

#==================================================================


# -----------------------------------------------------------------
# ---------------------------- PATHS ------------------------------
# -----------------------------------------------------------------
set( PATH_SRC    ${OF_DIRECTORY_ABSOLUTE}/addons/${NAME_ADDON}/src )
set( PATH_LIBS      ${OF_DIRECTORY_ABSOLUTE}/addons/${NAME_ADDON}/libs/libfbxsdk/ )

# -----------------------------------------------------------------
# ---------------------------- SOURCE -----------------------------
# -----------------------------------------------------------------

# ! important that it is .c** to include cxx files. !

file( GLOB_RECURSE   OFX_ADDON_CPP          "${PATH_SRC}/*.c**" )
file( GLOB_RECURSE   OFX_ADDON_LIBS_CPP     "${PATH_LIBS}/*.c**" )
add_library(  ${NAME_ADDON}   STATIC   ${OFX_ADDON_CPP} ${OFX_ADDON_LIBS_CPP} )

# -----------------------------------------------------------------
# ---------------------------- HEADERS ----------------------------
# -----------------------------------------------------------------

OF_find_header_directories( HEADERS_SOURCE ${PATH_SRC} )
OF_find_header_directories( HEADERS_LIBS ${PATH_LIBS} )


include_directories( ${HEADERS_SOURCE} )
include_directories( $${PATH_SRC}/FBXSource )
include_directories( ${HEADERS_LIBS} )
include_directories( "${PATH_LIBS}/libfbxsdk/include" )


if(UNIX AND NOT APPLE)
	set(libfbx "${PATH_LIBS}/lib/linux64/libfbxsdk.a" )
	target_link_libraries( ofxFBX ${libfbx} ${CMAKE_DL_LIBS} pugixml z xml2)
endif()

