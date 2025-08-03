m4_divert(-1)

m4_define(<<X_FOREACH>>, <<m4_pushdef(<<$1>>)_foreach($@)m4_popdef(<<$1>>)>>)
m4_define(<<_arg1>>, <<$1>>)
m4_define(<<_foreach>>, <<m4_ifelse(<<$2>>, <<()>>, <<>>,
  <<m4_define(<<$1>>, _arg1$2)$3<<>>$0(<<$1>>, (m4_shift$2), <<$3>>)>>)>>)

m4_define(<<ASSERT_NOT_EMPTY>>,<<
    m4_ifelse($1,,<<
        m4_errprint(<<$1 is empty >>)
        m4_m4exit(1)
    >>,)
>>)

m4_define(<<X_INFO>>,<<xlog("L_INFO", "X_LOG_PREFIX $*")>>)
m4_define(<<X_ERR>>,<<xlog("L_ERR", "X_LOG_PREFIX $*")>>)
m4_define(<<X_WARN>>,<<xlog("L_WARN", "X_LOG_PREFIX $*")>>)
m4_define(<<X_NOTICE>>,<<xlog("L_NOTICE", "X_LOG_PREFIX $*")>>)

m4_divert(0)m4_dnl
