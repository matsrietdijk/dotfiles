#!/usr/bin/env bash
# Variables
BACKUP_DIR="${HOME}/.dotfiles_backup"
DOTS=(".spacemacs")
# Functions
function backup() {
  if [ -e "$1" ]; then
    echo "Backing up ${1}"
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
for dot in ${DOTS[@]}; do
  # Move old dotfile to backup
  backup "${HOME}/${dot}"
  # Create symlink to dotfile
  ln -s "${PWD}/${dot}" "${HOME}/"
done
