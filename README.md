# Mats' .files

## Install

Running `./install.sh` will create a back up directory for everything that will be replaced by my .files and then create a bunch of symbolic links to enable my setup. Old .files can be found in `~/.dotfiles_backup`.

## What does it do?

The install script starts by moving old dotfiles to `~/.dotfiles_backup` (including symlinks). After backing up your old configurations the script prompts for you git `user.name` and `user.email` and stores those in `~/.gitconfig_private`. Then all .files in this repository are symlinked to your `~/`. Because I use Spacemacs the `.emacs.d` directory is also moved to `~/.dotfiles_backup` and will then be replaced by the [Spacemacs version](https://github.com/syl20bnr/spacemacs).
