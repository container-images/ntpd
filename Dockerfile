FROM fedora:latest

MAINTAINER Karsten Hopp, Red Hat <karsten@redhat.com>

RUN dnf install -y ntp && \
 rm -rvf /var/cache/{dnf,yum}/*

CMD ["/usr/sbin/ntpd", "-d", "-g"]

EXPOSE 123
