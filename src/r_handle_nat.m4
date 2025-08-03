onreply_route[handle_nat] {
	xlog("incoming reply\n");

    if (has_body("application/sdp")){
        $var(rtpengine_answer_flags) = "rtcp-mux-demux RTP/AVP replace-session-connection replace-origin ICE=remove media-address=ENV_LISTEN_IP";
        rtpengine_answer("$var(rtpengine_answer_flags)");
    }
}