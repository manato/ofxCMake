# ============================================================================
# ---------------------------- Source Files ----------------------------------
list( APPEND OF_SOURCE_FILES
        ${OF_DIRECTORY_ABSOLUTE}/libs/openFrameworks/video/ofGstUtils.cpp
        ${OF_DIRECTORY_ABSOLUTE}/libs/openFrameworks/video/ofGstVideoGrabber.cpp
        ${OF_DIRECTORY_ABSOLUTE}/libs/openFrameworks/video/ofGstVideoPlayer.cpp
        )

# ============================================================================
# --------------------------- Include Folders --------------------------------

# ------------------ Putting the includes into one list ----------------------
#list( APPEND OF_CORE_HEADERS ${OF_DIRECTORY_ABSOLUTE}/libs/kiss/include)


# ============================================================================
# ------------------------------ Libraries -----------------------------------

# ---- shared
set( LIB_FMOD ${OF_DIRECTORY_ABSOLUTE}/libs/fmod/lib/linux64/libfmod.so )

# ---- static
set( OF_CORE_STATIC_LIBS
        ${OF_CORE_LIBS}
        ${OF_DIRECTORY_ABSOLUTE}/libs/tess2/lib/linux64/libtess2.a
        ${OF_DIRECTORY_ABSOLUTE}/libs/kiss/lib/linux64/libkiss.a
        )

# ============================================================================
# ----------------------------- System Frameworks ----------------------------
set(CMAKE_MODULE_PATH
  "${CMAKE_MODULE_PATH}"
  "${CMAKE_CURRENT_LIST_DIR}")

find_package(PkgConfig REQUIRED)
find_package(GStreamer REQUIRED)
find_package(Boost REQUIRED filesystem system)
find_package(Threads REQUIRED)

find_library(opengl_lib OpenGL)

PKG_SEARCH_MODULE( ALSA "REQUIRED" alsa )
PKG_SEARCH_MODULE( CAIRO "REQUIRED" cairo )


include_directories( ${CAIRO_INCLUDE_DIRS} )
include_directories( ${OPENAL_INCLUDE_DIRS} )
include_directories( ${ALSA_INCLUDE_DIRS} )
include_directories( ${GSTREAMER_APP_INCLUDE_DIRS} )
include_directories( ${GSTREAMER_BASE_INCLUDE_DIRS} )
include_directories( ${GSTREAMER_VIDEO_INCLUDE_DIRS} )


set( OF_CORE_FRAMEWORKS
        z
        gstapp-1.0
        gstvideo-1.0
        gstbase-1.0
        gstreamer-1.0
        udev
        fontconfig
        freetype
        sndfile
        openal
        ssl
#        crypto
        pulse-simple
        pulse
        asound
        GLEW
        GLU
        GL
        pangocairo-1.0
        gdk_pixbuf-2.0
        cairo-gobject
        pango-1.0
        cairo
        gtk-3
        gdk-3
        atk-1.0
        gio-2.0
        gobject-2.0
        glib-2.0
#        mpg123
        glut
        X11
        Xrandr
        Xxf86vm
        dl
        Xinerama
        Xcursor
        Xi
        dl
        pthread
        freeimage
        boost_filesystem
        boost_system
        pugixml
        glfw
        curl
        uriparser
        ${LIB_FMOD}       # SHARED
        )
