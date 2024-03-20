find_package(FLEX REQUIRED)
# TODO scripts try to increase input buffer sizes, but currently those
# variables are not found in the output

# There is a number of identically built utilities
set(FLEX_UTILS
  AFilter
  DFilter
  Deannot
  Doc_Latexer
  EFilter
  IFilter
  Latex_Index
  NLFilter
  Post_Latexer_0
  Pre_GML_0
  Pre_GML_1
  Pre_GML_2
  Pre_GML_3
  Pre_GML_4
  Pre_GML_5
  SFilter
  TransCFilter
  Html1
  Html2
  Html3
  Html4
  Html5
)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${BLIB_BINARY_DIR})

# Repeat the same build steps
foreach(U IN LISTS FLEX_UTILS)
  FLEX_TARGET(${U}C ${U}.lex ${CMAKE_CURRENT_BINARY_DIR}/${U}.c
    COMPILE_FLAGS -n
  )

  add_executable(${U}
    ${FLEX_${U}C_OUTPUTS}
  )
  target_link_libraries(${U} PUBLIC ${FLEX_LIBRARIES})
endforeach()

