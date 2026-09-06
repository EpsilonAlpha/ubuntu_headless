# Use the current Ubuntu base image.
FROM ubuntu:latest

# Install locale support and generate the German UTF-8 locale.
RUN apt-get update && \
    apt-get install -y --no-install-recommends locales && \
    sed -i 's/^# \(de_DE.UTF-8 UTF-8\)/\1/' /etc/locale.gen && \
    locale-gen
ENV LANG=de_DE.UTF-8
ENV LC_ALL=de_DE.UTF-8

# Install terminal utilities.
RUN apt-get install -y --no-install-recommends screen tree tmux bmon vim fping dnsutils

# Remove package lists to reduce the final image size.
RUN rm -rf /var/lib/apt/lists/*
