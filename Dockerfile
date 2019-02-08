FROM ubuntu:18.04

# Make it so we can install APT packages
RUN apt-get update

# This makes it so tzdata doesn't ask interactive questions
ENV DEBIAN_FRONTEND=noninteractive

# Install NTP Reference Implementation, minimum depdendencies
RUN apt-get -y install -y --no-install-recommends ntp

# Clean cache/tmp file
RUN apt-get clean -q
RUN rm -Rf /var/lib/apt/lists/*

# Expose NTP server port
EXPOSE 123/udp

# Run NTPd
#   -n = run in foreground
#   -g = allow first adjustment to be big
#   -u ntp:ntp = run as non-privileged user/group
ENTRYPOINT [ "/usr/sbin/ntpd" ]
