#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
USER_HOME="$HOME"

echo "Installing dotfiles..."

backup() {
  if [ -e "$1" ] || [ -L "$1" ]; then
    echo "Backup: $1 -> $1.bak"
    mv "$1" "$1.bak"
  fi
}

link() {
  SRC="$1"
  DEST="$2"

  backup "$DEST"
  ln -s "$SRC" "$DEST"
}

# ------------------------
# CONFIGS
# ------------------------

mkdir -p "$USER_HOME/.config"

link "$DOTFILES_DIR/hypr" "$USER_HOME/.config/hypr"
link "$DOTFILES_DIR/kitty" "$USER_HOME/.config/kitty"
link "$DOTFILES_DIR/waybar" "$USER_HOME/.config/waybar"
link "$DOTFILES_DIR/rofi" "$USER_HOME/.config/rofi"

# ------------------------
# WALLPAPERS (DIRECT FOLDER)
# ------------------------

WALL_DIR="$USER_HOME/wallpapers"

echo "Setting up wallpaper folder..."

mkdir -p "$WALL_DIR"

# opsiyonel: dotfiles içindeki wallpaperları kopyala
if [ -d "$DOTFILES_DIR/wallpapers" ]; then
  cp -r "$DOTFILES_DIR/wallpapers/." "$WALL_DIR/"
fi

echo "Wallpaper folder ready at $WALL_DIR"
