.PHONY: build run default

IMAGE_NAME = ntpd


default: run

build:
	docker build --tag=$(IMAGE_NAME) .

run: build
	# gives too many permissions, avoid using this if possible:
	# docker run --privileged -v /etc/ntpd-server.conf:/etc/ntp.conf:ro -d $(IMAGE_NAME)
	# better solution, needs docker-1.12:
	docker run --net=host --cap-add SYS_TIME -v /etc/ntpd-server.conf:/etc/ntp.conf:ro -d $(IMAGE_NAME)

runfg: build
	# gives too many permissions:
	# docker run --privileged -v /etc/ntpd-server.conf:/etc/ntp.conf:ro $(IMAGE_NAME)
	# better solution, needs docker-1.12:
	docker run --net=host -it --cap-add SYS_TIME -v /etc/ntpd-server.conf:/etc/ntp.conf:ro $(IMAGE_NAME)

test:
	run_test.sh
