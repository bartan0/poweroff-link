PACKAGE = poweroff-link
VERSION = 1.0.0

CFLAGS += -std=gnu11 -Wall

.ONESHELL:
.PHONY: build deb clean

build: poweroff

deb:
	export PACKAGE=$(PACKAGE)
	export VERSION=$(VERSION)
	install -Dt dist/DEBIAN DEBIAN/postinst
	install -Dt dist/usr/bin poweroff
	envsubst <DEBIAN/control.in >dist/DEBIAN/control
	dpkg-deb --build dist .

clean:
	rm -rfv poweroff *.deb dist
