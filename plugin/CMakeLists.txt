# Reese Basser as a VST3 and CLAP plugin: ReeseBasser.jsfx, unchanged, run
# by ysfx inside a small JUCE wrapper (source/). Build with plugin/build.sh,
# which fetches ysfx first; the workflow in .github/workflows does the same
# on a Mac.
cmake_minimum_required(VERSION 3.22)
set(CMAKE_OSX_DEPLOYMENT_TARGET "11.0" CACHE STRING "")
if(APPLE)
    set(CMAKE_OSX_ARCHITECTURES "arm64;x86_64" CACHE STRING "")
endif()
project(ReeseBasserPlugin VERSION 1.0.0 LANGUAGES C CXX ASM)

# ---- what this plugin is -----------------------------------------------------
set(PLUG_NAME "Reese Basser")
set(PLUG_JSFX "${CMAKE_CURRENT_SOURCE_DIR}/../ReeseBasser.jsfx")
set(PLUG_CODE "RsBs")                       # four letters, unique to the maker
set(PLUG_ID "com.kallums.reese-basser")
set(PLUG_IS_SYNTH TRUE)
set(PLUG_VST3_CATEGORIES Instrument Synth)
set(PLUG_CLAP_FEATURES instrument synthesizer stereo)
set(PLUG_TAIL_SECONDS 10)                   # the amp release runs to 10 s
set(PLUG_MIN_W 480)                         # the window scrolls below its 960 x 684 canvas
set(PLUG_MIN_H 342)
set(PLUG_BACKGROUND 0xff1c1f24)
# ------------------------------------------------------------------------------

set(YSFX_DIR "${CMAKE_CURRENT_SOURCE_DIR}/deps/ysfx" CACHE PATH "ysfx checkout (build.sh fetches it)")
set(JUCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/deps/JUCE" CACHE PATH "JUCE checkout (build.sh fetches it)")
include("${CMAKE_CURRENT_SOURCE_DIR}/wrapper.cmake")
