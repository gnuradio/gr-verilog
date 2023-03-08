find_package(PkgConfig)

PKG_CHECK_MODULES(PC_GR_VERILOG gnuradio-verilog)

FIND_PATH(
    GR_VERILOG_INCLUDE_DIRS
    NAMES gnuradio/verilog/api.h
    HINTS $ENV{VERILOG_DIR}/include
        ${PC_VERILOG_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    GR_VERILOG_LIBRARIES
    NAMES gnuradio-verilog
    HINTS $ENV{VERILOG_DIR}/lib
        ${PC_VERILOG_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
          )

include("${CMAKE_CURRENT_LIST_DIR}/gnuradio-verilogTarget.cmake")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GR_VERILOG DEFAULT_MSG GR_VERILOG_LIBRARIES GR_VERILOG_INCLUDE_DIRS)
MARK_AS_ADVANCED(GR_VERILOG_LIBRARIES GR_VERILOG_INCLUDE_DIRS)
