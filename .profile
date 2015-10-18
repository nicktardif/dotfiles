# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

#if [ -e /usr/share/terminfo/x/xterm-256color ]; then
#        export TERM='xterm-256color'
#else
#        export TERM='xterm-color'
#fi

#if [[ -z $TMUX ]]; then
#    if [ -e /usr/share/terminfo/x/xterm+256color ]; then # may be xterm-256 depending on your distro
#        export TERM='xterm-256color'
#    else
#        export TERM='xterm'
#    fi
#else
#    if [ -e /usr/share/terminfo/s/screen-256color ]; then
#        export TERM='screen-256color'
#    else
#        export TERM='screen'
#    fi
#fi

if [ -d "/home/nick/.local/bin" ]; then
  PATH="/home/nick/.local/bin:/home/nick/Paracosm/pipeline/install/bin:/home/nick/Paracosm/pipeline/install/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
fi
if [ -d "/home/nick/.local/lib" ]; then
  LD_LIBRARY_PATH="/home/nick/.local/lib:/home/nick/Paracosm/pipeline/install/lib:/home/nick/Paracosm/pipeline/install/lib:"
fi
