
route{
    X_INFO(new request $socket_in(proto) $hdr(Contact));

    route(r_pre_check);

	if (has_totag()) {
        route(r_seq_request);
	}

	if (is_method("CANCEL")) {
		if (t_check_trans())
			t_relay();
		exit;
	}

	# absorb retransmissions, but do not create transaction
	t_check_trans();

	if ( !(is_method("REGISTER")) ) {
		
		if (is_myself("$fd")) {
					
		} else {
			# if caller is not local, then called number must be local
			
			if (!is_myself("$rd")) {
				send_reply(E_FORBIDDEN_CODE,"E_FORBIDDEN_DESC");
				X_ERR(X_BAN_IP);
				exit;
			}
		}

	}

	# preloaded route checking
	if (loose_route()) {
		X_INFO(preload route);

		if (!is_method("ACK"))
			send_reply(E_FORBIDDEN_CODE,"E_FORBIDDEN_DESC");
		exit;
	}

	# record routing
	if (!is_method("REGISTER|MESSAGE"))
		record_route();

	if (is_method("REGISTER")) {
		# store the registration and generate a SIP reply
        fix_nated_register();

		if (!save("location"))
			xlog("failed to register AoR $tu\n");

		exit;
	}

	if ($rU==NULL) {
		# request with no Username in RURI
		send_reply(484,"Address Incomplete");
		exit;
	}

	# do lookup with method filtering
	if (!lookup("location","method-filtering")) {
		t_reply(404, "Not Found");
		exit;
	}

	route(relay);
}