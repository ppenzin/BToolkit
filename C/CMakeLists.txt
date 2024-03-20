set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${BLIB_BINARY_DIR})

add_executable(BProcessInfo
  BProcessInfo.c
)

add_executable(BToolkit
  BToolkit.c
)

add_executable(BUnlock
  BUnlock.c
)

add_executable(BSession
  BSession.c
)

add_executable(CheckRenameLib
  CheckRenameLib.c
)

add_executable(CreHtml
  CreHtml.c
)

add_executable(CreHtmlc
  CreHtmlc.c
)

add_executable(Greplace
  Greplace.c
)

add_executable(LatexProofFilter
  LatexProofFilter.c
)

add_executable(CheckAnnot
  Proof.c
)

add_executable(WaitX
  WaitX.c
)

add_executable(Unix2Dos
  Unix2Dos.c
)

add_executable(Dos2Unix
  Dos2Unix.c
)

add_library(BToolkitlm_globals OBJECT
  BToolkitlm_globals.c
)
target_compile_definitions(BToolkitlm_globals PUBLIC
  BTOOL_FLAG
  BTOOLM_FLAG
)

if (BUILD_CUSERID)
  add_library(cuserid OBJECT
    cuserid.c
  )
endif()

find_package(Motif REQUIRED)

add_library(ClientSocket OBJECT
  ClientSocket.c
)
target_compile_definitions(ClientSocket PUBLIC
  bmotif
  BTOOLKIT_FLAG
  BTOOL_FLAG
  BTOOLM_FLAG
)
target_include_directories(ClientSocket PUBLIC ${MOTIF_INCLUDE_DIR})
target_compile_options(ClientSocket PUBLIC ${ALLOW_COMMON_FLAG})
