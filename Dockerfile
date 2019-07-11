FROM archlinux/base

LABEL maintainer="0x6773 | Govind Sahai <gsiitbhu@gmail.com>"

RUN pacman -Syu --noconfirm \
    && pacman -S --noconfirm --needed git zsh grep inetutils python awk vim openssh file gcc most base-devel rust \
    && rm -rf /var/cache \
    && useradd -ms /bin/zsh duser -d /root -G root \
    && passwd --delete duser \
    && chmod 777 /etc/sudoers \
    && echo "duser ALL=(ALL:ALL) ALL" >> /etc/sudoers \
    && echo "duser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && chmod 400 /etc/sudoers

USER duser
WORKDIR /root
CMD [ "/bin/zsh" ]
