#!/usr/bin/env bash
# Variables
BACKUP_DIR="${HOME}/.dotfiles_backup"
# Functions
function backup() {
  if [ -e "$1" ]; then
    if [ -L "$1" ]; then
      source_path=`readlink ${1}`
      ln -s "$source_path" "${BACKUP_DIR}/"
      rm "$1"
    else
      mv "$1" "${BACKUP_DIR}/"
    fi
  fi
}
# Create backup dir
if [ -e "$BACKUP_DIR" ]; then
  echo "${BACKUP_DIR} already exists"
  exit 1
else
  mkdir "$BACKUP_DIR"
fi
# Move old files to backup
backup "${HOME}/.spacemacs"
# Create symlinks to dotfiles
ln -s "${PWD}/.spacemacs" "${HOME}/"
