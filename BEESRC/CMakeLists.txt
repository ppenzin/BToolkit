set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

# Disambiguate files by creating separate include directories
set(B_CORE_INCLUDE_DIR ${CMAKE_CURRENT_BINARY_DIR}/include.B-Core)
set(BMOTIF_INCLUDE_DIR ${CMAKE_CURRENT_BINARY_DIR}/include.motif)
set(BPLATFORM_INCLUDE_DIR ${CMAKE_CURRENT_BINARY_DIR}/include.bplatform)

# Copy files during configuration step
configure_file(itfmch.c.B-Core ${B_CORE_INCLUDE_DIR}/itfmch.c COPYONLY)
configure_file(natmch.c.B-Core ${B_CORE_INCLUDE_DIR}/natmch.c COPYONLY)
configure_file(filmch.c.B-Core ${B_CORE_INCLUDE_DIR}/filmch.c COPYONLY)
configure_file(themch.c.B-Core ${B_CORE_INCLUDE_DIR}/themch.c COPYONLY)
configure_file(prfmch.c.B-Core ${B_CORE_INCLUDE_DIR}/prfmch.c COPYONLY)
configure_file(tolmch.c.B-Core ${B_CORE_INCLUDE_DIR}/tolmch.c COPYONLY)
configure_file(symmch.c.B-Core ${B_CORE_INCLUDE_DIR}/symmch.c COPYONLY)
configure_file(strmch.c.B-Core ${B_CORE_INCLUDE_DIR}/strmch.c COPYONLY)
configure_file(lexmch.c.B-Core ${B_CORE_INCLUDE_DIR}/lexmch.c COPYONLY)
configure_file(frmmch.c.B-Core ${B_CORE_INCLUDE_DIR}/frmmch.c COPYONLY)
configure_file(errmch.c.B-Core ${B_CORE_INCLUDE_DIR}/errmch.c COPYONLY)
configure_file(macmch.c.B-Core ${B_CORE_INCLUDE_DIR}/macmch.c COPYONLY)
configure_file(rulmch.c.B-Core ${B_CORE_INCLUDE_DIR}/rulmch.c COPYONLY)
configure_file(resmch.c.B-Core ${B_CORE_INCLUDE_DIR}/resmch.c COPYONLY)
configure_file(hypmch.c.B-Core ${B_CORE_INCLUDE_DIR}/hypmch.c COPYONLY)
configure_file(tacmch.c.B-Core ${B_CORE_INCLUDE_DIR}/tacmch.c COPYONLY)
configure_file(nodmch.c.B-Core ${B_CORE_INCLUDE_DIR}/nodmch.c COPYONLY)
configure_file(golmch.c.B-Core ${B_CORE_INCLUDE_DIR}/golmch.c COPYONLY)
configure_file(seqmch.c.B-Core ${B_CORE_INCLUDE_DIR}/seqmch.c COPYONLY)

add_executable(b
  b.c
)

target_include_directories(b PRIVATE ${B_CORE_INCLUDE_DIR} ${CMAKE_CURRENT_SOURCE_DIR})

# Copy files for BTool build
configure_file(itfmch.c.motif ${BMOTIF_INCLUDE_DIR}/itfmch.c COPYONLY)
configure_file(natmch.c.motif ${BMOTIF_INCLUDE_DIR}/natmch.c COPYONLY)
configure_file(filmch.c.motif ${BMOTIF_INCLUDE_DIR}/filmch.c COPYONLY)
configure_file(themch.c.motif ${BMOTIF_INCLUDE_DIR}/themch.c COPYONLY)
configure_file(prfmch.c.motif ${BMOTIF_INCLUDE_DIR}/prfmch.c COPYONLY)
configure_file(tolmch.c.motif ${BMOTIF_INCLUDE_DIR}/tolmch.c COPYONLY)
configure_file(symmch.c.motif ${BMOTIF_INCLUDE_DIR}/symmch.c COPYONLY)
configure_file(strmch.c.motif ${BMOTIF_INCLUDE_DIR}/strmch.c COPYONLY)
configure_file(lexmch.c.motif ${BMOTIF_INCLUDE_DIR}/lexmch.c COPYONLY)
configure_file(frmmch.c.motif ${BMOTIF_INCLUDE_DIR}/frmmch.c COPYONLY)
configure_file(errmch.c.motif ${BMOTIF_INCLUDE_DIR}/errmch.c COPYONLY)
configure_file(macmch.c.motif ${BMOTIF_INCLUDE_DIR}/macmch.c COPYONLY)
configure_file(rulmch.c.motif ${BMOTIF_INCLUDE_DIR}/rulmch.c COPYONLY)
configure_file(resmch.c.motif ${BMOTIF_INCLUDE_DIR}/resmch.c COPYONLY)
configure_file(hypmch.c.motif ${BMOTIF_INCLUDE_DIR}/hypmch.c COPYONLY)
configure_file(tacmch.c.motif ${BMOTIF_INCLUDE_DIR}/tacmch.c COPYONLY)
configure_file(nodmch.c.motif ${BMOTIF_INCLUDE_DIR}/nodmch.c COPYONLY)
configure_file(golmch.c.motif ${BMOTIF_INCLUDE_DIR}/golmch.c COPYONLY)
configure_file(seqmch.c.motif ${BMOTIF_INCLUDE_DIR}/seqmch.c COPYONLY)

find_package(X11 REQUIRED)
find_package(Motif REQUIRED)
if (NOT X11_Xt_FOUND)
  message(FATAL_ERROR "X Toolkit is required")
endif()

add_executable(BTool
  bmotif.c
)

target_compile_definitions(BTool PUBLIC BTOOL_FLAG BTOOLM_FLAG)
target_include_directories(BTool PUBLIC ${BMOTIF_INCLUDE_DIR} ${CMAKE_CURRENT_SOURCE_DIR} ${MOTIF_INCLUDE_DIR})
target_link_libraries(BTool PUBLIC BToolkitlm_globals ${MOTIF_LIBRARIES} ${X11_LIBRARIES} ${X11_Xt_LIB} ${CUSERID_LINK_FLAG})

# Copy symbol file
configure_file(SYMBOL ${BPLATFORM_BINARY_DIR}/SYMBOL COPYONLY)

# Copy files for bplatform build (note the suffix is actually 'release')
configure_file(itfmch.c.release ${BPLATFORM_INCLUDE_DIR}/itfmch.c COPYONLY)
configure_file(natmch.c.release ${BPLATFORM_INCLUDE_DIR}/natmch.c COPYONLY)
configure_file(filmch.c.release ${BPLATFORM_INCLUDE_DIR}/filmch.c COPYONLY)
configure_file(themch.c.release ${BPLATFORM_INCLUDE_DIR}/themch.c COPYONLY)
configure_file(prfmch.c.release ${BPLATFORM_INCLUDE_DIR}/prfmch.c COPYONLY)
configure_file(tolmch.c.release ${BPLATFORM_INCLUDE_DIR}/tolmch.c COPYONLY)
configure_file(symmch.c.release ${BPLATFORM_INCLUDE_DIR}/symmch.c COPYONLY)
configure_file(strmch.c.release ${BPLATFORM_INCLUDE_DIR}/strmch.c COPYONLY)
configure_file(lexmch.c.release ${BPLATFORM_INCLUDE_DIR}/lexmch.c COPYONLY)
configure_file(frmmch.c.release ${BPLATFORM_INCLUDE_DIR}/frmmch.c COPYONLY)
configure_file(errmch.c.release ${BPLATFORM_INCLUDE_DIR}/errmch.c COPYONLY)
configure_file(macmch.c.release ${BPLATFORM_INCLUDE_DIR}/macmch.c COPYONLY)
configure_file(rulmch.c.release ${BPLATFORM_INCLUDE_DIR}/rulmch.c COPYONLY)
configure_file(resmch.c.release ${BPLATFORM_INCLUDE_DIR}/resmch.c COPYONLY)
configure_file(hypmch.c.release ${BPLATFORM_INCLUDE_DIR}/hypmch.c COPYONLY)
configure_file(tacmch.c.release ${BPLATFORM_INCLUDE_DIR}/tacmch.c COPYONLY)
configure_file(nodmch.c.release ${BPLATFORM_INCLUDE_DIR}/nodmch.c COPYONLY)
configure_file(golmch.c.release ${BPLATFORM_INCLUDE_DIR}/golmch.c COPYONLY)
configure_file(seqmch.c.release ${BPLATFORM_INCLUDE_DIR}/seqmch.c COPYONLY)

add_executable(bplatform
  bplatform.c
)
target_include_directories(bplatform PUBLIC ${BPLATFORM_INCLUDE_DIR} ${CMAKE_CURRENT_SOURCE_DIR})
target_compile_definitions(bplatform PUBLIC bplatform)
set_target_properties(bplatform PROPERTIES
  RUNTIME_OUTPUT_DIRECTORY ${BPLATFORM_BINARY_DIR}
)
