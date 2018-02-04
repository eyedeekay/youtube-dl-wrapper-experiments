
install:
	install -m755 bin/yget /usr/bin
	install -m755 bin/ydl_supervise_pid /usr/bin
	install -m755 bin/ydl_echo_pid /usr/bin


clean:
	yget -k; \
		killall youtube-dl; \
		rm -f err log *.part *.pid; \
		killall ydl_supervise_pid
