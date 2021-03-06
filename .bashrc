# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
#PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
PS1='\e[33;38;5;$(( RANDOM % 127 ))m${debian_chroot:+($debian_chroot)}\u@\h:\w\$ \n'

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi

# lsd awk
function lsd_awk ()
{
	awk 'BEGIN {
		color=0;
	}
	{
		print "\33[38;5;" ((color=color+5)) "m" $0 "\033[0m";
		if (color > 255) 
			color = 0
		color+=5;
	}
	END {
	}' <<< `$@`
}

# Man colors
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# ls colors
export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
alias ls='lsd_awk ls $1'
alias grep='grep $LS_OPTIONS'
alias diff='diff $LS_OPTIONS'
alias lsblk='lsd_awk lsblk $1'
alias lscpu='lsd_awk lscpu $1'
alias lsinitramfs='lsd_awk lsinitramfs $1'
alias lslocks='lsd_awk lslocks $1'
alias lsmem='lsd_awk lsmem $1'
alias lsns='lsd_awk lsns $1'
alias lspci='lsd_awk lspci $1'
alias lsusb='lsd_awk lsusb $1'
alias lsattr='lsd_awk lsattr $1'
alias lsb_release='lsd_awk lsb_release $1'
alias lsipc='lsd_awk lsipc $1'
alias lslogins='lsd_awk lslogins $1'
alias lsmod='lsd_awk lsmod $1'
alias lsof='lsd_awk lsof $1'
alias lspgpot='lsd_awk lspgpot $1'

# Extract Files
# use: $ extract file.type
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   time tar xjvf $1    ;;
        *.tar.gz)    time tar xzvf $1    ;;
        *.bz2)       time bunzip2 $1     ;;
        *.rar)       time unrar e $1     ;;
        *.gz)        time gunzip $1      ;;
        *.tar)       time tar xvf $1     ;;
        *.tbz2)      time tar xjvf $1    ;;
        *.tgz)       time ar xzvf $1    ;;
        *.zip)       time unzip $1       ;;
        *.Z)         time uncompress $1  ;;
        *.7z)        time 7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
