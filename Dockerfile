FROM archlinux/base

LABEL maintainer="0x6773 | Govind Sahai <gsiitbhu@gmail.com>"

RUN pacman -Syu --noconfirm \
     && pacman -S --noconfirm --needed git zsh grep inetutils python awk vim openssh file gcc most base-devel \
     && rm -rf /var/cache 

RUN sed -i '/NOPASSWD/s/\#//' /etc/sudoers
RUN useradd -ms /bin/zsh duser -d /root -G root,wheel

WORKDIR /root
RUN chown -R duser /root

USER duser

WORKDIR /root
RUN git clone https://aur.archlinux.org/pod2man.git
WORKDIR /root/pod2man
RUN makepkg -i --noconfirm

WORKDIR /root
RUN git clone https://aur.archlinux.org/auracle-git.git 
WORKDIR /root/auracle-git
RUN makepkg -i --noconfirm

WORKDIR /root
RUN git clone https://aur.archlinux.org/pacaur.git
WORKDIR /root/pacaur
RUN makepkg -i --noconfirm

RUN sudo rm -rf /root/pacaur root/auracle-git /root/pod2man /usr/share/man/* /tmp/* /var/tmp/*

WORKDIR /root
CMD [ "/bin/zsh" ]
