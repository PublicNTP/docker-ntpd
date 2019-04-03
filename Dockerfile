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

# Copy config file in
COPY etc/ntp.conf /etc/

# Expose NTP server port
EXPOSE 123/udp

# Run NTPd
# 
# Flags for foreground are handled inside the run script
ENTRYPOINT [ "/usr/sbin/ntpd" ]
