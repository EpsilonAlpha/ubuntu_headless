# start from Ubuntu Image latest
FROM ubuntu:24.04

# refresh the things
RUN apt-get update 
# language defined as "german"
RUN apt-get install -y --no-install-recommends locales && \
	localedef -i de_DE -c -f UTF-8 -A /usr/share/locale/locale.alias de_DE.UTF-8
ENV LANG de_DE.utf8

# terminalstuff
RUN apt-get install -y --no-install-recommends screen tree tmux bmon vim fping dnsutils

# clean up after all installs
RUN rm -rf /var/lib/apt/lists/*
