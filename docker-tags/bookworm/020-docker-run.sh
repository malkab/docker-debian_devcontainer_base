#!/bin/bash

# --------------------
#
# Runs the image for testing.
#
# --------------------
docker run -ti --rm \
    --name debian_devcontainer_base \
    --hostname debian_devcontainer_base \
    -v $(pwd):$(pwd) \
    --workdir $(pwd) \
    --user 1000:1000 \
    malkab/debian-devcontainer-base:bookworm
