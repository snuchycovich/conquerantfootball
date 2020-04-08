DOCKER_NAME := caencun_api
env ?= dev

up:
	sudo docker-compose -f docker/docker-compose.yml up -d --remove-orphans

build:
	sudo docker-compose -f docker/docker-compose.yml build

stop:
	sudo docker-compose -f docker/docker-compose.yml stop

clean:
	make stop
	sudo docker rm $(shell sudo docker ps -a -q)

clean-full:
	sudo docker rmi -f $(shell sudo docker images -q)

logs:
	sudo docker-compose -f docker/docker-compose.yml logs -f

php:
	sudo docker-compose -f docker/docker-compose.yml exec php bash
