FROM archlinux

RUN pacman -Sy --noconfirm && \
    pacman -S wget git vim which sudo --noconfirm

RUN useradd -m -u 1000 -U dev
RUN echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN pacman -S fish exa starship --noconfirm
RUN chsh -s /usr/bin/fish dev
RUN git clone https://github.com/wesleyallan/dotfiles-devcontainer.git /home/dev/dotfiles && \
    chmod +x /home/dev/dotfiles/install.sh

RUN USERNAME=dev LAST_DIR=dotfiles FULL=true /home/dev/dotfiles/install.sh
RUN ln -s /home/dev/.asdf/completions/asdf.fish /home/dev/.config/fish/completions

RUN chown -R dev:dev /home/dev/.config && \
    chown -R dev:dev /home/dev/dotfiles

USER dev

RUN sudo pacman -S base-devel openssl zlib xz tk --noconfirm
RUN git clone https://github.com/asdf-vm/asdf.git /home/dev/.asdf --branch v0.13.1

WORKDIR /home/dev/app

CMD ["tail", "-f", "/dev/null"]
