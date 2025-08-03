include env.default.mk

-include env.local.mk
-include /usr/local/etc/minivos/minivos.mk
-include $$HOME/.config/minivos/minivos.mk

include m4_define_macros.mk
include config.mk

oci=podman
app=minivos

dev: cfg
	-$(oci) rm -f $(app)
	$(oci) run -d --name $(app) \
	--network=host \
	-v $$PWD/dist:/usr/local/etc/opensips \
	-v $$PWD/log:/var/log \
	$(opensips_image) -m 1024 -M 64

cfg:
	m4 -P $(m4_define_macros) main.m4 > dist/opensips.cfg

logs:
	tail -f log/opensips.log
	
log0:
	podman logs $(app)

fp:
	git add -A;
	git commit -am "wip";
	git push;
