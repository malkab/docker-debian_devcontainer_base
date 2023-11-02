#!/bin/bash

# --------------------
#
# Builds the image.
#
# --------------------
echo -----------------------------------------------------------------
echo
echo Output will be dumped into build.log
echo
echo -----------------------------------------------------------------
docker build --force-rm \
    -t malkab/debian-devcontainer-base:bookworm . #\

    #> build.log 2>&1
