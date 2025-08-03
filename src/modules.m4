mpath="/usr/local/lib64/opensips/modules/"

loadmodule "signaling.so"
loadmodule "sl.so"

loadmodule "tm.so"
modparam("tm", "fr_timeout", 5)
modparam("tm", "fr_inv_timeout", 30)
modparam("tm", "restart_fr_on_each_reply", 0)
modparam("tm", "onreply_avp_mode", 1)

loadmodule "rr.so"
modparam("rr", "append_fromtag", 0)

loadmodule "maxfwd.so"
loadmodule "sipmsgops.so"

loadmodule "mi_fifo.so"
modparam("mi_fifo", "fifo_name", "/run/opensips/opensips_fifo")
modparam("mi_fifo", "fifo_mode", 0666)

loadmodule "usrloc.so"
modparam("usrloc", "nat_bflag", "NAT")
modparam("usrloc", "working_mode_preset", "single-instance-no-db")

loadmodule "registrar.so"
modparam("registrar", "tcp_persistent_flag", "TCP_PERSISTENT")
#modparam("registrar", "max_contacts", 10)
modparam("registrar", "received_avp", "$avp(rcv)")
modparam("registrar", "received_param", "rcv")
modparam("registrar", "default_expires", 60)
modparam("registrar", "min_expires", 30)
modparam("registrar", "max_expires", 90)
modparam("registrar", "tcp_persistent_flag", "TCP_PERSIST_DURATION")


loadmodule "nathelper.so"
modparam("nathelper", "natping_interval", 0)
modparam("nathelper", "received_avp", "$avp(rcv)")

loadmodule "proto_udp.so"
loadmodule "proto_tcp.so"
loadmodule "proto_ws.so"

loadmodule "rtpengine.so"
modparam("rtpengine", "rtpengine_sock", "ENV_RTP_SOCKET")
