FROM mcr.microsoft.com/devcontainers/base:bookworm

LABEL author="Juan Pedro Perez"
LABEL email="jp.perez.alcantara@gmail.com"
LABEL release_notes="Imagen base DevContainer para Debian Bookworm."

WORKDIR /

USER root

COPY assets/fzf /usr/local/bin/

RUN apt-get update

# Locale
ENV LOCALE=es_ES.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN ln -fs /usr/share/zoneinfo/Europe/Madrid /etc/localtime

RUN apt-get install -y \
      debconf-utils \
      libreadline8 \
      locales \
      tzdata && ldconfig

RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
      sed -i -e 's/# es_ES.UTF-8 UTF-8/es_ES.UTF-8 UTF-8/' /etc/locale.gen && \
      sed -i -e 's/# en_US.ISO-8859-15 ISO-8859-15/en_US.ISO-8859-15 ISO-8859-15/' /etc/locale.gen && \
      sed -i -e 's/# en_GB ISO-8859-1/en_GB ISO-8859-1/' /etc/locale.gen && \
      sed -i -e 's/# en_GB.ISO-8859-15 ISO-8859-15/en_GB.ISO-8859-15 ISO-8859-15/' /etc/locale.gen && \
      sed -i -e 's/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/' /etc/locale.gen && \
      sed -i -e 's/# es_ES ISO-8859-1/es_ES ISO-8859-1/' /etc/locale.gen && \
      sed -i -e 's/# es_ES.UTF-8 UTF-8/es_ES.UTF-8 UTF-8/' /etc/locale.gen && \
      sed -i -e 's/# es_ES@euro ISO-8859-15/es_ES@euro ISO-8859-15/' /etc/locale.gen && \
      sed -i -e 's/# de_DE ISO-8859-1/de_DE ISO-8859-1/' /etc/locale.gen && \
      sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen && \
      sed -i -e 's/# de_DE@euro ISO-8859-15/de_DE@euro ISO-8859-15/' /etc/locale.gen && \
      sed -i -e 's/# fr_FR ISO-8859-1/fr_FR ISO-8859-1/' /etc/locale.gen && \
      sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen && \
      sed -i -e 's/# fr_FR@euro ISO-8859-15/fr_FR@euro ISO-8859-15/' /etc/locale.gen && \
      sed -i -e 's/# it_IT ISO-8859-1/it_IT ISO-8859-1/' /etc/locale.gen && \
      sed -i -e 's/# it_IT.UTF-8 UTF-8/it_IT.UTF-8 UTF-8/' /etc/locale.gen && \
      sed -i -e 's/# it_IT@euro ISO-8859-15/it_IT@euro ISO-8859-15/' /etc/locale.gen

RUN locale-gen && update-locale LANG=$LOCALE

# Instalaciones de paquete
RUN apt-get install -y -f \
  apt-file \
  apt-utils \
  bat \
  curl \
  fd-find \
  less \
  make \
  mlocate \
  p7zip-full \
  vim \
  wget \
  x11-apps

RUN apt-get -y upgrade && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    ldconfig

RUN ln -s /usr/bin/batcat /usr/bin/bat

COPY assets/dot.bashrc /home/vscode/.bashrc
COPY assets/dot.vimrc /home/vscode/.vimrc

RUN chown vscode:vscode /home/vscode/.bashrc && \
    chown vscode:vscode /home/vscode/.vimrc

USER vscode