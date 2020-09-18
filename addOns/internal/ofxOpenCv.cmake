# -----------------------------------------------------------------
# --- Script to search for all the .cpp files in the chosen folder
# -----------------------------------------------------------------

file(   GLOB_RECURSE
        OFX_OPENCV_CPP
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxOpenCv/*.*pp"
        )

# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories(
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxOpenCv/src"
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxOpenCv/libs/opencv/include"
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxOpenCv/libs/opencv/include/opencv"
        )

# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------

add_library(    ofxOpenCv
                STATIC
                ${OFX_OPENCV_CPP} )

# -----------------------------------------------------------------
# --- Setting a compiled lib
# -----------------------------------------------------------------
#TODO Libs for other OS (Win & Linux)

if( APPLE )
    find_library( CORE_FOUNDATION_LIB_OPENCV  CoreFoundation)
    find_library( ZLIB_OPENCV z )

    set(    ofxOpenCvLib "${OF_DIRECTORY_ABSOLUTE}/addons/ofxOpenCv/libs/opencv/lib/osx/opencv.a" )
    set(    EXTRA_LIBS_OPENCV
            ${CORE_FOUNDATION_LIB_OPENCV}
            ${ZLIB_OPENCV}
            ${ofxOpenCvLib}
            )
elseif( UNIX )
        
#    set(ofxOpenCvLib "${PATH_LIBS}/alembic/lib/linux64/libAlembic.a" 
#                    "${PATH_LIBS}/hdf5/lib/linux64/libhdf5.a"
#                    "${PATH_LIBS}/hdf5/lib/linux64/libhdf5_cpp.a"
#                    "${PATH_LIBS}/hdf5/lib/linux64/libhdf5_hl.a"
#                    "${PATH_LIBS}/hdf5/lib/linux64/libhdf5_hl_cpp.a"
#                    "${PATH_LIBS}/hdf5/lib/linux64/libhdf5_tools.a"
#                    "${PATH_LIBS}/hdf5/lib/linux64/libszip.a" 
#                    )
    find_package( OpenCV REQUIRED )
    include_directories( ${OpenCV_INCLUDE_DIRS} )
#    target_link_libraries( ${NAME_ADDON} INTERFACE ${OpenCV_LIBS} )
#    target_link_libraries( ${NAME_ADDON} opencv harfbuzz )
    # If the package has been found, several variables will
    # be set, you can find the full list with descriptions
    # in the OpenCVConfig.cmake file.
    # Print some message showing some of them
    message(STATUS "OpenCV library status:")
    message(STATUS "    config: ${OpenCV_DIR}")
    message(STATUS "    version: ${OpenCV_VERSION}")
    message(STATUS "    libraries: ${OpenCV_LIBS}")
    message(STATUS "    include path: ${OpenCV_INCLUDE_DIRS}")

    target_link_libraries(ofxOpenCv ${OpenCV_LIBS} )

endif()

target_link_libraries(  ofxOpenCv ${EXTRA_LIBS_OPENCV} )