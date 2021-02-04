NO_OF_THREADS := $(shell nproc)

Dockerfile: scripts/update-cpython.sh
	docker build --build-arg njobs=$(NO_OF_THREADS) -t tensorflow-arm-tk .
