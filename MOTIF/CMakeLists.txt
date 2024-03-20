add_subdirectory(CFG_DEP_BASE/CDE/C)

find_package(X11 REQUIRED)
find_package(Motif REQUIRED)
if (NOT X11_Xt_FOUND)
  message(FATAL_ERROR "X Toolkit is required")
endif()

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${BLIB_BINARY_DIR})

add_executable(BMotif
  B_Motif.c
  BMotif_globals.c
  BMotif_browser.c
  BMotif_fifo.c
  BMotif_init.c
  BMotif_io.c
  BMotif_utils.c
  BMotif_widgets.c
  BMotif_displaystate.c
)

target_compile_definitions(BMotif PUBLIC
  bmotif
  BTOOLKIT_FLAG
  BTOOL_FLAG
  BTOOLM_FLAG
)

target_compile_options(BMotif PUBLIC ${ALLOW_COMMON_FLAG})
target_include_directories(BMotif PUBLIC ${MOTIF_INCLUDE_DIR})
target_link_libraries(BMotif PUBLIC BM ClientSocket BToolkitlm_globals CFG_DEP_BASE BTL_PRF ${MOTIF_LIBRARIES} ${X11_LIBRARIES} ${X11_Xt_LIB} ${CUSERID_LIB})

# Copy resource files
configure_file(BMotif.resources ${CMAKE_BINARY_DIR}/XBMotif COPYONLY)
configure_file(BMotif.resources.mono ${CMAKE_BINARY_DIR}/XBMotif.mono COPYONLY)

