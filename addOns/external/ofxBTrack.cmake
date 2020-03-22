# -----------------------------------------------------------------
# --- Script to search for all the .cpp files in the chosen folder
# -----------------------------------------------------------------

file( GLOB_RECURSE OFX_BTRACK_CPP
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxBTrack/src/*.cpp"
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxBTrack/libs/BTrack/*.cpp"
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxBTrack/libs/kiss_fft130/*.c"
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxBTrack/libs/libsamplerate/*.c"
        )

# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories(
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxBTrack/src"
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxBTrack/libs/BTrack"
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxBTrack/libs/kiss_fft130"
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxBTrack/libs/libsamplerate"
        )

# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------

add_library(    ofxBTrack
                STATIC
                ${OFX_BTRACK_CPP}
                )
