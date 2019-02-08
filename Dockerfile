FROM ubuntu:18.04

RUN apt-get update
RUN apt-get -y install ntp

EXPOSE 123/udp

ENTRYPOINT [ "/usr/sbin/ntpd", "-g", "-u", "ntp:ntp" ]
