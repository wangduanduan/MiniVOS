include env.default.mk

-include env.local.mk
-include /usr/local/etc/minivos/minivos.mk
-include $$HOME/.config/minivos/minivos.mk

include m4_define_macros.mk
include config.mk

dev:
	m4 -P $(m4_define_macros) main.m4 > dist/opensips.cfg

test:
	echo $(m4_define_flagg)