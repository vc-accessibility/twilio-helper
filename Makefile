IMAGE_NAME := $(USER)/twilio-helper
OCI_FNAME := Dockerfile
SELINUX := :z

help:
		@echo "make build - Build and locally tag a new image."
		@echo "make build-force - Use a no-cache build"
		@echo "make run-int - Run the new image interactively"
		@echo "to run use: podman run -it --env-file secrets.env --rm $(IMAGE_NAME) <param>"

build:
		@podman build --file=$(OCI_FNAME) . -t $(IMAGE_NAME)

build-force:
		@podman build --file=$(OCI_FNAME) --no-cache . -t $(IMAGE_NAME)

run-int:
		@podman run -it --env-file secrets.env  --entrypoint /bin/bash $(IMAGE_NAME)
