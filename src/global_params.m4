#debug_mode=yes
log_level=ENV_LOG_LEVEL
xlog_level=ENV_XLOG_LEVEL
stderror_enabled=yes
syslog_enabled=yes
syslog_facility=LOG_LOCAL0
syslog_name="openvos-init minivos_version"


m4_ifelse(ENV_DOMAIN_MAIN,,,
alias=udp:ENV_DOMAIN_MAIN
alias=tcp:ENV_DOMAIN_MAIN
alias=ws:ENV_DOMAIN_MAIN
)m4_dnl

disable_stateless_fwd=yes

event_pkg_threshold=90
event_shm_threshold=90
exec_dns_threshold = 60000
exec_msg_threshold = 60000


tcp_keepalive = 1
tcp_keepcount = 5
tcp_no_new_conn_bflag = TCP_NO_CONNECT


udp_workers=4

user_agent_header="User-Agent: OpenVOS my_version"
server_header="Server: OpenVOS my_version"
server_signature=no

socket=udp:ENV_LISTEN_IP:ENV_UDP_PORT as ENV_PUBLIC_IP:ENV_UDP_PORT
socket=tcp:ENV_LISTEN_IP:ENV_TCP_PORT as ENV_PUBLIC_IP:ENV_TCP_PORT
socket=ws:ENV_LISTEN_IP:ENV_WS_PORT as ENV_PUBLIC_IP:ENV_WS_PORT

# ,ENV_PUBLIC_IP,
