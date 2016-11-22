.PHONY: build run default

IMAGE_NAME = ntpd


default: run

build:
	docker build --tag=$(IMAGE_NAME):0.1 .

run: build
	docker run --privileged -d $(IMAGE_NAME):0.1

test:
	run_test.sh
