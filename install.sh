#!/bin/bash

if [ -z "$USERNAME" ] || [ -z "$LAST_DIR" ]; then
  echo "As variáveis USERNAME e LAST_DIR devem ser definidas antes de executar este script."
  exit 1
fi

mkdir -p /home/$USERNAME/.config
ln -s /home/$USERNAME/$LAST_DIR/fish /home/$USERNAME/.config/

if [ "$FULL" = "true" ]; then
  ln -s /home/$USERNAME/$LAST_DIR/fish/config.fish.full /home/$USERNAME/.config/fish/config.fish
  ln -s /home/$USERNAME/$LAST_DIR/starship.toml /home/$USERNAME/.config/starship.toml
else
  ln -s /home/$USERNAME/$LAST_DIR/fish/config.fish.soft /home/$USERNAME/.config/fish/config.fish
fi
