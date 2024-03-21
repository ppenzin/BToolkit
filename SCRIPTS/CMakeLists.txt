set(SCRIPT_NAMES
  BLatex
  BRead
  BTDECCO
  Bkit.sty
  Bbrowser
  Beditor
  Bnetscape
  Bprintdvi
  CheckFileDiff
  CheckFileExists
  ClearBerr
  CreSLIBC
  CreateCom
  DispFile
  ExportFile
  FindFile
  KillEditor
  LIB_Addunderscore
  LIB_Check
  LIB_NoRename
  LIB_Rename
  LatexFile
  LinkCFile
  ExeFile
  TransCFile
)
list(TRANSFORM SCRIPT_NAMES PREPEND ${BLIB_BINARY_DIR}/ OUTPUT_VARIABLE SCRIPT_DESTINATIONS)

add_custom_target(copy-scripts ALL DEPENDS ${SCRIPT_DESTINATIONS}) 

foreach(S IN LISTS SCRIPT_NAMES)
  set(IN_PATH ${CMAKE_CURRENT_SOURCE_DIR}/${S})
  set(OUT_PATH ${BLIB_BINARY_DIR}/${S})
  add_custom_command(OUTPUT ${OUT_PATH}
    COMMAND ${CMAKE_COMMAND} -E copy ${IN_PATH} ${OUT_PATH}
    DEPENDS ${IN_PATH}
  )
endforeach()

