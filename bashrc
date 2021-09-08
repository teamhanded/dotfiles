#.bashrc
export LC_ALL="en_US.UTF-8"
export LC_CTYPE=en_US.UTF-8
export BASH_CONF="bashrc"

PATH=$PATH:/usr/local/bin
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

enable-sudo-touchid() {
    sudo sed -i -e '1s;^;auth       sufficient     pam_tid.so\n;' /etc/pam.d/sudo
}

#GOPATH
export GOPATH=$HOME/Proyectos/personal/lang/go

#Arregla ejecucion de Ansible en Mac OS X High Sierra
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

#Arregla error sobre shell default (zsh) al iniciar terminal en Mac OS X
export BASH_SILENCE_DEPRECATION_WARNING=1

#Paginación de Systemd
#export SYSTEMD_PAGER=

#Habilita fzf en el prompt
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#Auto-completar de AWS
complete -C '/usr/local/bin/aws_completer' aws

#Forzar prompt de color siempre
force_color_prompt=yes

#Macros universales
bind '"\t":menu-complete'
shopt -s histappend
shopt -s checkwinsize

#------------------------------------------------

#Variables

#Historial de Bash
HISTFILESIZE=999999
HISTSIZE=999999
HISTTIMEFORMAT="[%Y-%m-%d %H:%M:%S] "
HISTCONTROL="ignoreboth"

#Path principal
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/go/bin:$GOPATH/bin:$GOROOT/bin
export PATH

#Variables de utilidad
export BROWSER=/usr/bin/firefox
export EDITOR=/usr/bin/nano
export TERM=rxvt-256color

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

#Símbolos unicode aleatorios
rune=(☉ ⋇ ∴ ∵ ⊽  ꑛ ꐟ ꁹ ꂑ)
random_rune() {
	selected_rune=${rune[$RANDOM % ${#rune[@]}]};
	echo $selected_rune;
}

#Prompt universal, no lo cambio porque me encanta
if [[ $(whoami) == "manuel.fernandez" ]]; then
	export PS1="${RESET}\[\e[01;32m\]manu\[$(tput sgr0)\]\[\033[38;5;15m\] @ \[$(tput sgr0)\]\[\033[38;5;208m\]ingenuity\[$(tput sgr0)\]\[\033[38;5;15m\] \[\033[38;5;12m\][\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;6m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;12m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[\e[91m\]\$(parse_git_branch)\[\e[00m\] { \[$(tput sgr0)\]\[\033[38;5;28m\]\t\[$(tput sgr0)\]\[\033[38;5;15m\] } \\$ "
else
	export PS1="${RESET}\[\e[01;32m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] @ \[$(tput sgr0)\]\[\033[38;5;208m\]ingenuity\[$(tput sgr0)\]\[\033[38;5;15m\] : \[$(tput sgr0)\]\[\033[38;5;12m\][\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;6m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;12m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] { \[$(tput sgr0)\]\[\033[38;5;28m\]\t\[$(tput sgr0)\]\[\033[38;5;15m\] } \\$ \[$(tput sgr0)\]"
fi

#------------------------------------------------

#Alias generales
alias bx='bash -x'
alias c="cd"
alias kp='pkill -P $1 $2'
alias man="batman"
alias passgen='LC_ALL=C tr -dc "A-Za-z0-9_!@#$%^&*()\-+=" < /dev/urandom | fold -w $(shuf -i 32-128) | head -n 4'
alias pod='popd'
alias prod='aws-mfa --profile default'
alias psf="ps -eo 'pid,args' --forest"
alias pud='pushd'
alias t='tmux -l -u -2'
alias tf="terraform"
alias tg="terragrunt"
alias nv="nvim"
#------------------------------------------------

#Booleans


#------------------------------------------------

###### Funciones ######

#Paginas man coloreadas
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

#Arregla errores de tipeo :joy:
function f() {
                TF_PYTHONIOENCODING=$PYTHONIOENCODING;
                export TF_SHELL=bash;
                export TF_ALIAS=fuck;
                export TF_SHELL_ALIASES=$(alias);
                export TF_HISTORY=$(fc -ln -10);
                export PYTHONIOENCODING=utf-8;
                TF_CMD=$(
                    thefuck THEFUCK_ARGUMENT_PLACEHOLDER "$@"
                ) && eval "$TF_CMD";
                unset TF_HISTORY;
                export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
                history -s $TF_CMD;
            }

#------------------------------------------------

source /Users/aux-admin/.config/broot/launcher/bash/br
