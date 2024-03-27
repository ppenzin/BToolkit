# Copy standard library
#
# TODO this is likely better to be split into separate dirctories where every
# directory is copied verbatim instead of this custom process
#
# TODO script has more special cases (are those needed)?:
# - Optional "BOOSTER" set of files
# - What happens if BSERVER is not enabled?

set(ANL_DIR ${CMAKE_CURRENT_SOURCE_DIR}/ANL)
set(C_DIR ${CMAKE_CURRENT_SOURCE_DIR}/CDE/C)
set(CFG_DIR ${CMAKE_CURRENT_SOURCE_DIR}/CFG)
set(TYP_DIR ${CMAKE_CURRENT_SOURCE_DIR}/TYP)

set(STD_LIB_NAMES
  Bit_TYPE
  Bit_TYPE_Ops
  BitsNContext
  Bool_TYPE
  Bool_TYPE_Ops
  Char_TYPE
  Char_TYPE_Ops
  Int_TYPE
  Int_TYPE_Ops
  Rename_Bit_String
  Rename_File_io
  Rename_Narr
  Rename_Nfnc
  Rename_Nseq
  Rename_Nvar
  Rename_SocketClient
  Rename_SocketServer
  Rename_SharedSocketServer
  Rename_Timer
  Rename_Varr
  Rename_Vffnc
  Rename_Vfnc
  Rename_Vseq
  Rename_Vvar
  Rename_ffnc_ctx
  Rename_ffnc_obj
  Rename_file_dump
  Rename_fnc_ctx
  Rename_fnc_obj
  Rename_fstr_ctx
  Rename_fstr_obj
  Rename_seq_ctx
  Rename_seq_obj
  Rename_set
  Rename_set_ctx
  Rename_set_obj
  Rename_str_ctx
  Rename_str_obj
  Rename_token_io
  Scalar_TYPE
  Scalar_TYPE_Ops
  String_TYPE
  String_TYPE_Ops
  basic_io
  file_dump
  system
)

set(BSERVER_LIB_NAMES
  IntegrityCheck
)

if (WITH_BSERVER)
  list(APPEND STD_LIB_NAMES ${BSERVER_LIB_NAMES})
endif()

# Copy standard library to binary directory
add_custom_target(copy-std-lib ALL)

# TODO scipt also copies HTML help files, not sure that is necessary until install stage

set(LIB_BINARY_DIR ${CMAKE_BINARY_DIR}/BLIB/LIB)
set(LIB_ANL_DIR ${LIB_BINARY_DIR}/ANL)
set(LIB_C_DIR ${LIB_BINARY_DIR}/CDE/C)
set(LIB_CFG_DIR ${LIB_BINARY_DIR}/CFG)
set(LIB_TYP_DIR ${LIB_BINARY_DIR}/TYP)

foreach(S IN LISTS STD_LIB_NAMES)
  add_custom_target(copy-std-lib-${S} DEPENDS
    ${LIB_ANL_DIR}/${S}.mch.anl
    ${LIB_C_DIR}/${S}.c
    ${LIB_C_DIR}/${S}.g
    ${LIB_C_DIR}/${S}.h
    ${LIB_CFG_DIR}/${S}.mch
    ${LIB_TYP_DIR}/${S}.mri.typ
  )
  add_custom_command(OUTPUT ${LIB_ANL_DIR}/${S}.mch.anl
    COMMAND ${CMAKE_COMMAND} -E copy ${ANL_DIR}/${S}.mch.anl ${LIB_ANL_DIR}/${S}.mch.anl
    DEPENDS ${ANL_DIR}/${S}.mch.anl
  )
  add_custom_command(OUTPUT ${LIB_C_DIR}/${S}.c
    COMMAND ${CMAKE_COMMAND} -E copy ${C_DIR}/${S}.c ${LIB_C_DIR}/${S}.c
    DEPENDS ${C_DIR}/${S}.c
  )
  add_custom_command(OUTPUT ${LIB_C_DIR}/${S}.g
    COMMAND ${CMAKE_COMMAND} -E copy ${C_DIR}/${S}.g ${LIB_C_DIR}/${S}.g
    DEPENDS ${C_DIR}/${S}.g
  )
  add_custom_command(OUTPUT ${LIB_C_DIR}/${S}.h
    COMMAND ${CMAKE_COMMAND} -E copy ${C_DIR}/${S}.h ${LIB_C_DIR}/${S}.h
    DEPENDS ${C_DIR}/${S}.h
  )
  # .ldf files are only copied if they exist (see comment above about directories)
  add_custom_command(TARGET copy-std-lib-${S} POST_BUILD
    COMMAND ${CMAKE_COMMAND}
      "-DSOURCE=${C_DIR}/${S}.ldf"
      "-DDESTINATION=${LIB_C_DIR}"
      -P ${CMAKE_SOURCE_DIR}/cmake/copy-if-exists.cmake
  )
  add_custom_command(OUTPUT ${LIB_CFG_DIR}/${S}.mch
    COMMAND ${CMAKE_COMMAND} -E copy ${CFG_DIR}/${S}.mch ${LIB_CFG_DIR}/${S}.mch
    DEPENDS ${CFG_DIR}/${S}.mch
  )
  add_custom_command(OUTPUT ${LIB_TYP_DIR}/${S}.mri.typ
    COMMAND ${CMAKE_COMMAND} -E copy ${TYP_DIR}/${S}.mri.typ ${LIB_TYP_DIR}/${S}.mri.typ
    DEPENDS ${TYP_DIR}/${S}.mri.typ
  )
  add_dependencies(copy-std-lib copy-std-lib-${S})
endforeach()

