FROM fedora:25

MAINTAINER Karsten Hopp, Red Hat <karsten@redhat.com>
LABEL name="ntpd container" \
      vendor="Fedora Project" \
      Release="1" \
      version="1.0" \
      architecture="x86_64" \
      authoritative-source-url="registry.fedoraproject.org" \
      org.fedoraproject.component="ntpd-container" \
      io.k8s.description="A container with the NTP time server" \
      io.k8s.display-name="NTP server (ntpd)" 

RUN dnf install -y ntp && \
 rm -rvf /var/cache/{dnf,yum}/*

CMD ["/usr/sbin/ntpd", "-d", "-g"]

EXPOSE 123
