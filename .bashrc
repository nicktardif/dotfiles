# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# Allow bash to recognize extended patterns
shopt -s extglob

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ "$COLORTERM" = "gnome-terminal" ] || [ "$COLORTERM" = "xfce4-terminal" ]
then
    export TERM=xterm-256color
elif [ "$COLORTERM" = "rxvt-xpm" ]
then
    export TERM=rxvt-256color
fi

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias gittree='git log --oneline --graph --decorate --all'
    alias gitree='gittree'
fi

# Markdown file colors, to work with https://github.com/axiros/terminal_markdown_viewer
export MDV_THEME=784.8759

# some more aliases
alias ls='ls -GF --color=auto'
alias tmux='tmux -2'
alias superclear='echo -e \\033c'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi

# Remap up and down arrows to search through history
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Disable Ctrl-S from freezing the terminal
stty -ixon

toilet -t -f mono9 --gay 'nick'

function branchr() {
  for k in `git branch -r | perl -pe "s/^..(.*?)( ->.*)?$/\1/"`;
    do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k -- | head -n 1`\\t$k;
  done | sort -r
}

# --- Paracosm stuff --- #
[[ -d ~/Tools/paracosm_scripts.sh ]] && source ~/Tools/paracosm_scripts.sh

#export PIPELINE_ROOT=$HOME/Paracosm/pipeline/install
#[[ -d $PIPELINE_ROOT && -d $PIPELINE_ROOT/lib ]] && LD_LIBRARY_PATH=$PIPELINE_ROOT/lib:$LD_LIBRARY_PATH
#[[ -d $PIPELINE_ROOT && -d $PIPELINE_ROOT/bin ]] && PATH=$PIPELINE_ROOT/bin:$PATH 

#[[ -d /usr/lib/ccache ]] && PATH=/usr/lib/ccache:$PATH

# Set up ccache on each bash login
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/.local/lib" ]; then
  LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
fi

export LD_LIBRARY_PATH
export PATH
