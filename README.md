# ntpd
Network Time Protocol Server Container


## How to build the container

```docker build --tag=ntpd .```

## How to use the container

The ntpd server uses a config file (/etc/ntpd-server.conf:) on the host, this file needs to be created first.
Example contents of /etc/ntpd-server.conf, see 'man ntp.conf' for more options:
```
server 127.127.8.0 mode 2 # local radio clock
server 127.127.1.0 # local clock
fudge 127.127.1.0 stratum 12 # local fallback clock
```



Command for running ntpd docker container:
```
  # in privileged mode, try to avoid this:
  # docker run --privileged -v /etc/ntpd-server.conf:/etc/ntp.conf:ro -d ntpd
  # better solution with capabilities, needs docker-1.12:
  docker run --net=host --cap-add SYS_TIME -v /etc/ntpd-server.conf:/etc/ntp.conf:ro -d $(IMAGE_NAME)

```

## How to test the ntpd server


Commands for testing ntpd docker container:

```ntpq -c "host localhost -pn```

replace localhost with container IP if required

