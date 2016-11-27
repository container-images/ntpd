.PHONY: build run default

IMAGE_NAME = ntpd


default: run

build:
	docker build --tag=$(IMAGE_NAME) .

run: build
	# gives too many permissions, avoid using this if possible:
	# docker run --privileged -d $(IMAGE_NAME)
	# better solution, needs docker-1.12:
	docker run --net=host --cap-add SYS_TIME -d $(IMAGE_NAME)

runfg: build
	# gives too many permissions:
	# docker run --privileged $(IMAGE_NAME)
	# better solution, needs docker-1.12:
	docker run --net=host -it --cap-add SYS_TIME $(IMAGE_NAME)

test:
	run_test.sh
