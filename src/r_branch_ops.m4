branch_route[per_branch_ops] {
	xlog("new branch at $ru");

    if (has_body("application/sdp")){
        $var(rtpengine_offer_flags)= "rtcp-mux-offer RTP/SAVPF SDES-off ICE=force media-address=ENV_PUBLIC_IP";
        #rtpengine_offer("$var(rtpengine_offer_flags)");
    }
    
}
