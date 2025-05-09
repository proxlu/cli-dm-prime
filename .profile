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

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# clidm tty1
if [ -z "$DISPLAY" ]; then
    if [ `tty` = /dev/tty1 ]; then
	clear
	echo
	echo 'A Sessão Gráfica iniciará automáticamente em 5 segundos...'
	echo '[Ctrl+C] Ficar na Linha de Comando'
	echo
	read -t 5
	exec startxfce4
    fi

# clidm tty2
    if [ `tty` = /dev/tty2 ]; then
	clear
	echo
	echo 'Aceleração 3D pausada para Poupar Energia, deseja iniciar?'
	echo '[Enter]  Iniciar Aceleração 3D'
	echo '[Alt+F1] Voltar e Poupar Energia'
	echo '[Ctrl+C] Ficar na Linha de Comando'
	echo
	read
	LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libfreetype.so exec nvidia-xrun xfce4-terminal --maximize --fullscreen --hide-menubar --hide-borders --hide-toolbar --hide-scrollbar
    fi
fi
