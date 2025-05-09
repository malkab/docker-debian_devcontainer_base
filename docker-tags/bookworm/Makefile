# ¡ATENCIÓN! Esto hay que cambiarlo también en el FROM del Dockerfile.
# Nombre de la imagen base, nombre:tag
BASE_IMAGE_NAME=mcr.microsoft.com/devcontainers/base:bookworm
# Nombre de la imagen, nombre:tag
IMAGE_NAME=debian_devcontainer:bookworm
IMAGE_USER=vscode
IMAGE_SAVE_NAME=debian_bookworm_devcontainer

# Para el push a registros privados, especialmente el Gitea.
PUSH_OWNER=whateveruser
PUSH_REGISTRY=a.gitea.com
PUSH_REGISTRY_URL=https://$(PUSH_REGISTRY)

# Atajos.
GIT_COMMIT=$(shell git rev-parse --short=6 HEAD)

# Ejecuta la imagen base para depurar.
base_image_run:
	@docker run -ti --rm \
		-v $(shell pwd):$(shell pwd) \
		--workdir $(shell pwd) \
		--entrypoint /bin/bash \
		$(BASE_IMAGE_NAME)

# Build.
build:
	@docker build --force-rm -t $(IMAGE_NAME) .

# Ejecuta la imagen construída.
run:
	@docker run -ti --rm \
		--user $(IMAGE_USER):$(IMAGE_USER) \
		-v $(shell pwd):$(shell pwd) \
		--workdir $(shell pwd) \
		--entrypoint /bin/bash \
		$(IMAGE_NAME)

# Subida.
push:
	-@echo "Subiendo imagen $(IMAGE_NAME) a $(PUSH_REGISTRY_URL), no olvidar hacer primero login"

	-@docker tag \
		$(IMAGE_NAME) \
		$(PUSH_REGISTRY)/$(PUSH_OWNER)/$(IMAGE_NAME)

	-@docker push \
		$(PUSH_REGISTRY)/$(PUSH_OWNER)/$(IMAGE_NAME)

# Respaldo a tar.gz de la imagen.
save:
	@docker image save $(IMAGE_NAME) $(IMAGE_NAME) | gzip > \
		$(IMAGE_SAVE_NAME)_$(GIT_COMMIT).tar.gz

# Eliminar activos.
clean:
	-@docker image rm $(IMAGE_NAME)

	-@docker image rm $(PUSH_REGISTRY)/$(PUSH_OWNER)/$(IMAGE_NAME)
