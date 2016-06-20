build:
	docker build --rm --build-arg user=$(shell id -nu) --build-arg curruid=$(shell id -u) -t dictybase/chado-sqitch-devel .
