FROM fedora:latest

MAINTAINER Karsten Hopp, Red Hat <karsten@redhat.com>

RUN dnf install -y ntp && \
 echo "server 127.127.8.0 mode 2 # local radio clock" >> /etc/ntp.conf && \
 echo "server 127.127.1.0# local clock" >> /etc/ntp.conf && \
 echo "fudge 127.127.1.0 stratum 12 # local fallback clock" >> /etc/ntp.conf && \
 rm -rvf /var/cache/{dnf,yum}/*

CMD ["/usr/sbin/ntpd", "-d", "-g"]

EXPOSE 123
