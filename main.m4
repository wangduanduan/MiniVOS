m4_changequote(<<,>>)m4_dnl
<<#>> MiniVOS, a minimal SIP server, Power By OpenSIPS.
<<#>> vresion: minivos_version
<<#>> build at: minivos_build_time
m4_include(src/define_helper.m4)m4_dnl
m4_include(<<src/define_const.m4>>)m4_dnl
m4_include(<<src/define_status.m4>>)m4_dnl

m4_include(<<src/global_params.m4>>)
m4_include(<<src/modules.m4>>)

m4_include(<<src/r_pre_check.m4>>)
m4_include(<<src/r_seq_request.m4>>)
m4_include(<<src/r_init_request.m4>>)
m4_include(<<src/r_relay.m4>>)
m4_include(<<src/r_branch_ops.m4>>)
m4_include(<<src/r_handle_nat.m4>>)
m4_include(<<src/r_miss_call.m4>>)
