
install:
	install -m755 bin/yget /usr/bin
	mkdir -p /usr/lib/yget
	install -m755 lib/ydl_supervise_pid /usr/lib/yget
	install -m755 lib/ydl_echo_pid /usr/lib/yget
	install -m755 lib/ydl_get_metadata /usr/lib/yget
	install etc/yget.conf /etc/

remove:
	rm -rf /usr/bin/yget /usr/lib/yget

clean:
	yget -k; \
		killall youtube-dl; \
		rm -f err log *.part *.pid; \
		killall ydl_supervise_pid

deb:
	checkinstall --default \
		--install=no \
		--pkgname='yget' \
		--pkgversion='0.1' \
		--pkglicense=gpl3 \
		--maintainer='problemsolver@openmailbox.org' \
		--pakdir=../ \
		--requires='youtube-dl' \
		--nodoc \
		--deldoc=yes \
		--deldesc=yes \
		--backup=no
