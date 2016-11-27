# ntpd
Network Time Protocol Server Container


## How to build the container

```docker build --tag=ntpd .```

## How to use the container

Command for running ntpd docker container:
```
  # in privileged mode, try to avoid this:
  # docker run --privileged -d ntpd
  # better solution with capabilities, needs docker-1.12:
  docker run --net=host --cap-add SYS_TIME -d $(IMAGE_NAME)

```

## How to test the ntpd server


Commands for testing ntpd docker container:

```ntpq -c "host localhost -pn```
```replace localhost with container IP if required```

