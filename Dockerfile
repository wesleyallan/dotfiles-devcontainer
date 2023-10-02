FROM archlinux

RUN pacman -Sy --noconfirm && pacman -S wget git vim which --noconfirm

# Exemplo de Linguagem
RUN pacman -S python --noconfirm

RUN useradd -m -u 1000 -U dev

RUN pacman -S fish exa starship --noconfirm
RUN chsh -s /usr/bin/fish dev
RUN git clone https://github.com/wesleyallan/dotfiles-devcontainer.git /home/dev/dotfiles && \
    chmod +x /home/dev/dotfiles/install.sh

RUN USERNAME=dev LAST_DIR=dotfiles FULL=true /home/dev/dotfiles/install.sh

RUN chown -R dev:dev /home/dev/.config && \
    chown -R dev:dev /home/dev/dotfiles

USER dev

WORKDIR /home/dev/app

CMD ["tail", "-f", "/dev/null"]
