FROM archlinux/base:latest

LABEL maintainer="0x6773 | Govind Sahai <gsiitbhu@gmail.com>"

RUN pacman -Syu --noconfirm \
    && pacman -S --noconfirm --needed git zsh grep inetutils python awk vim openssh file gcc most \
    && rm -rf /var/cache


WORKDIR /root
