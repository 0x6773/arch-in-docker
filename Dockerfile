FROM archlinux/base

LABEL maintainer="0x6773 | Govind Sahai <gsiitbhu@gmail.com>"

RUN pacman -Syu --noconfirm \
     && pacman -S --noconfirm --needed git zsh grep inetutils python awk vim openssh file gcc most base-devel go \
     && rm -rf /var/cache 

RUN sed -i '/NOPASSWD/s/\#//' /etc/sudoers
RUN useradd -ms /bin/zsh duser -d /root -G root,wheel

WORKDIR /root
RUN chown -R duser /root

USER duser

WORKDIR /root
RUN git clone https://aur.archlinux.org/yay.git 
WORKDIR /root/yay
RUN makepkg -i --noconfirm

RUN sudo rm -rf /root/yay /usr/share/man/* /tmp/* /var/tmp/*

WORKDIR /root
CMD [ "/bin/zsh" ]
