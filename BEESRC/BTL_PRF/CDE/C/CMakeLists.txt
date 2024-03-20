add_library(BTL_PRF OBJECT
  btl_prf_ffnc_ctx.c
  btl_prf_ffnc_obj.c
  prf_seq_stp_ffnc_ctx.c
  prf_seq_stp_ffnc_obj.c
  btl_proof_seq_ctx.c
  btl_proof_seq_obj.c
  btl_proof_str_ctx.c
  btl_proof_str_obj.c
  btl_proof_file_dump.c
  btl_proof.c
  btl_proofCtx.c
)
target_compile_definitions(BTL_PRF PUBLIC bmotif)
target_compile_options(BTL_PRF PUBLIC ${ALLOW_COMMON_FLAG})
