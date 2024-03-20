add_library(CFG_DEP_BASE OBJECT
  Abs2Conc_ffnc_obj.c
  Bit_TYPE.c
  Bool_TYPE.c
  CfgDepBase.c
  CfgDepBaseCtx.c
  CfgDepBase_Vffnc.c
  CfgDepBase_file_dump.c
  CfgDepBase_seq_obj.c
  CfgDepBase_set_obj.c
  CfgDepBase_str_obj.c
  CfgDepCtx.c
  Construct_ffnc_obj.c
  GENState_ffnc_obj.c
  MRIState_ffnc_obj.c
  Seqstr_ffnc_obj.c
  String_ffnc_obj.c
  Scalar_TYPE.c
  String_TYPE.c
  basic_io.c
  file_dump.c
)
target_compile_definitions(CFG_DEP_BASE PUBLIC bmotif)

