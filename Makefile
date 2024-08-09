
DOCKER_CMD = podman

NAME = my-httpbin
DOCKER_IMAGE = $(NAME)
DOCKER_IMAGE_VERSION = 20240809.1030
IMAGE_NAME = $(DOCKER_IMAGE):$(DOCKER_IMAGE_VERSION)

REGISTRY_SERVER = docker.io
REGISTRY_LIBRARY = yasuhiroabe
PROD_IMAGE_NAME = $(REGISTRY_SERVER)/$(REGISTRY_LIBRARY)/$(IMAGE_NAME)

.PHONY: all
all:
	@echo "Please read the Makefile to check the available tasks."

.PHONY: docker-build
docker-build:
	$(DOCKER_CMD) build . --pull --tag $(DOCKER_IMAGE):latest

.PHONY: docker-build-prod
docker-build-prod:
	$(DOCKER_CMD) build . --pull --tag $(IMAGE_NAME) --no-cache

.PHONY: docker-tag
docker-tag:
	$(DOCKER_CMD) tag $(IMAGE_NAME) $(PROD_IMAGE_NAME)

.PHONY: docker-push
docker-push:
	$(DOCKER_CMD) push $(PROD_IMAGE_NAME)

.PHONY: docker-run
docker-run:
	$(DOCKER_CMD) run -it --rm \
		-p 8080:8080 \
		--name $(NAME) \
		$(DOCKER_IMAGE):latest

.PHONY: docker-run-httpbin
docker-run-httpbin:
	$(DOCKER_CMD) run -it --rm \
		-p 8080:8080 \
		--env FLASGGER_URL_PREFIX="/httpbin/" \
		--name $(NAME) \
		$(DOCKER_IMAGE):latest

.PHONY: docker-stop
docker-stop:
	$(DOCKER_CMD) stop $(NAME)

.PHONY: clean
clean:
	find . -name '*~' -type f -exec rm {} \; -print

.PHONY: docker-exec
docker-exec:
	$(DOCKER_CMD) exec -it $(NAME) bash

.PHONY: firefox
firefox:
	browse http://localhost:8080/

.PHONY: firefox-httpbin
firefox-httpbin:
	browse http://localhost:8080/httpbin/

