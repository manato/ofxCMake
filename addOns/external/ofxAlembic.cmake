# =================================================================
#
# Template for addOns
#
# Easiest way: replace all the NAME into the name of your addOn
# It has to have the same name, as the directory it is in
# [e.g. ofxOneEuroFilter is in of/addons/ofxOneEuroFilter/]
#
# =================================================================

set( NAME_ADDON     ofxAlembic )       # <--- Set the name here

#==================================================================


# -----------------------------------------------------------------
# ---------------------------- PATHS ------------------------------
# -----------------------------------------------------------------
set( PATH_SRC    ${OF_DIRECTORY_ABSOLUTE}/addons/${NAME_ADDON}/src )
set( PATH_LIBS      ${OF_DIRECTORY_ABSOLUTE}/addons/${NAME_ADDON}/libs )

# -----------------------------------------------------------------
# ---------------------------- SOURCE -----------------------------
# -----------------------------------------------------------------

file( GLOB_RECURSE   OFX_ADDON_CPP          "${PATH_SRC}/*.cpp" "${PATH_SRC}/*.cpp" )
file( GLOB_RECURSE   OFX_ADDON_LIBS_CPP     "${PATH_LIBS}/*.cpp" )
add_library(  ${NAME_ADDON}   STATIC   ${OFX_ADDON_CPP} ${OFX_ADDON_LIBS_CPP} )

# -----------------------------------------------------------------
# ---------------------------- HEADERS ----------------------------
# -----------------------------------------------------------------

OF_find_header_directories( HEADERS_SOURCE ${PATH_SRC} )
OF_find_header_directories( HEADERS_LIBS ${PATH_LIBS} )

include_directories( ${HEADERS_SOURCE} )
include_directories( ${HEADERS_LIBS} )
include_directories( "${PATH_LIBS}/include" )
include_directories( ${PATH_LIBS}/alembic/include )
include_directories( ${PATH_LIBS}/hdf5/include )
include_directories( ${PATH_LIBS}/alembic/include/OpenEXR )

if(UNIX AND NOT APPLE)
	set(libalembic "${PATH_LIBS}/alembic/lib/linux64/libAlembic.a" 
					"${PATH_LIBS}/hdf5/lib/linux64/libhdf5.a"
					"${PATH_LIBS}/hdf5/lib/linux64/libhdf5_cpp.a"
					"${PATH_LIBS}/hdf5/lib/linux64/libhdf5_hl.a"
					"${PATH_LIBS}/hdf5/lib/linux64/libhdf5_hl_cpp.a"
					"${PATH_LIBS}/hdf5/lib/linux64/libhdf5_tools.a"
					"${PATH_LIBS}/hdf5/lib/linux64/libszip.a" 
					)
	target_link_libraries( ofxAlembic ${libalembic} ${CMAKE_DL_LIBS} Imath IlmThread Iex Half z )
endif()

 
