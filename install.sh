#!/bin/bash

LAST_DIR=$(basename $(pwd))

mkdir -p /home/$USERNAME/.config
ln -s /home/$USERNAME/$LAST_DIR/fish /home/$USERNAME/.config/
