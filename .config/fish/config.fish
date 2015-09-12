source ~/.config/fish/vars.fish

if set -q __mats_prompt_simple
  function fish_prompt;       fish_prompt_simple; end
  function fish_right_prompt; fish_right_prompt_simple; end
else
  function fish_prompt;       fish_prompt_powerline; end
  function fish_right_prompt; fish_right_prompt_powerline; end
end

if [ (uname) = 'Darwin' ]
  function safari;  open -a Safari $argv; end
  function spotify; open -a Spotify $argv; end
  function slack;   open -a Slack $argv; end
  function toggl;   open -a TogglDesktop $argv; end
  function trello;  safari https://trello.com $argv; end
  function emacs;   open -a Emacs $argv; end
  function hop;     trello; spotify; slack; toggl; emacs $argv; end
end

function -;       cd -; end
function ...;     cd ../..; end
function ....;    cd ../../..; end
function .....;   cd ../../../..; end
function ......;  cd ../../../../..; end
function .......; cd ../../../../../..; end
function .2;      cd ../..; end
function .3;      cd ../../..; end
function .4;      cd ../../../..; end
function .5;      cd ../../../../..; end
function .6;      cd ../../../../../..; end

if type hub > /dev/null
  function git; hub $argv; end
end
function g; git $argv; end

function psg; ps aux | grep -i $argv; end
function hs;  history | grep -i $argv; end

function extip;    curl ip.appspot.com; end
function localips; ifconfig | awk '/inet.*broadcast/ { print $2; }'; end

function fs; stat -f '%z bytes'; end

function fa; find . -iname $argv; end
function ff; find . -type f -iname $argv; end
function fd; find . -type d -iname $argv; end

function be; bundle exec $argv; end
function jbe; jruby -S bundle exec $argv; end

set -x EDITOR vim
set -x LANGUAGE en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -g default_user mats
test -d /usr/local/sbin ; and set -x PATH /usr/local/sbin $PATH

test -d (brew --prefix homebrew/php/php56)/bin ; and set -x PATH (brew --prefix homebrew/php/php56)/bin $PATH
test -d (brew --prefix homebrew/php/php53)/bin ; and set -x PATH (brew --prefix homebrew/php/php53)/bin $PATH

if type rbenv > /dev/null
  rbenv init - | source
end
