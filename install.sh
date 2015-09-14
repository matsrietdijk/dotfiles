#!/usr/bin/env bash
# Variables
BACKUP_DIR="${HOME}/.dotfiles_backup"
PRIVATE_GITCONFIG_FILE="${HOME}/.gitconfig_private"
DOTS=(".spacemacs" ".vim" ".vimrc" ".gitconfig" ".gitignore" ".config")
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
# Create private gitconfig
if [ ! -e "$PRIVATE_GITCONFIG_FILE" ]; then
  echo "Creating ${PRIVATE_GITCONFIG_FILE} to save private gitconfig settings"
  touch "$PRIVATE_GITCONFIG_FILE"
  read -p "Please provide your git config global user.name: " git_name
  read -p "And your git config global user.email: " git_email
  cat > $PRIVATE_GITCONFIG_FILE <<- EOF
[user]
    name = ${git_name}
    email = ${git_email}
EOF
fi
# Backup & link dotfiles
for dot in ${DOTS[@]}; do
  # Move old dotfile to backup
  backup "${HOME}/${dot}"
  # Create symlink to dotfile
  ln -s "${PWD}/${dot}" "${HOME}/"
done
# Clone spacemacs
backup "${HOME}/.emacs.d"
git clone --recursive https://github.com/syl20bnr/spacemacs ~/.emacs.d
