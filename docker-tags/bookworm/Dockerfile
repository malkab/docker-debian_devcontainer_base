FROM debian:bookworm as build

LABEL author="Juan Pedro Perez"
LABEL email="jp.perez.alcantara@gmail.com"

WORKDIR /

# Copy assets
ADD assets/dot.bashrc /root/.bashrc
ADD assets/dot.bashrc /etc/skel/.bashrc
ADD assets/sudoers /
ADD assets/configure.sh /

# Copy and run setup
RUN chmod 777 /configure.sh
RUN /configure.sh
RUN rm /configure.sh

ENTRYPOINT [ "/bin/bash" ]
