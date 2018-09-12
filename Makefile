VERSION:=$(shell cat ./VERSION)

all : wheels

DOCKERFILE:="bhallalab/pymoose_wheels_$(USER):$(VERSION)"

wheels : ./Dockerfile ./build_wheels_linux.sh 
	mkdir -p $(HOME)/wheelhouse
	docker build  --no-cache \
	    -t $(DOCKERFILE) \
	    --build-arg PYPI_PASSWORD=$(PYPI_PASSWORD)  . || exit -1
