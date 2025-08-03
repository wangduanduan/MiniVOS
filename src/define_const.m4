m4_divert(-1)
m4_define(<<X_LOG_PREFIX>>,<<$socket_in $ci $rm/$rs $route.name/$cfg_line $ru $fu>$tu $ua :: >>)
m4_define(<<X_BAN_IP>>,<<BAN THIS IP <$si> >>)

m4_define(<<IS_FROM_FS>>,<<0>>)
m4_define(<<IS_FROM_UNKNOWN>>,<<1>>)
m4_divert(0)m4_dnl
