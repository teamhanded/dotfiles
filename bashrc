# .bashrc
export LC_ALL="en_US.UTF-8"
export BASH_CONF="bashrc"

PATH=$PATH:/usr/local/bin
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#Ubicacion de Go
export GOPATH=$HOME/Proyectos/personal/lang/go

#Fix Ansible for Mac OS X High Sierra
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Paginación de Systemd
# export SYSTEMD_PAGER=

#Macros universales
bind '"\t":menu-complete'
shopt -s histappend
shopt -s checkwinsize

#------------------------------------------------

#Variables

#Historial de Bash
HISTFILESIZE=40000
HISTSIZE=40000
HISTTIMEFORMAT="[%Y-%m-%d %H:%M:%S] "
HISTCONTROL="ignoreboth"

#Path principal
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/go/bin:$GOPATH/bin:$GOROOT/bin
export PATH

#Variables de utilidad
export BROWSER=/usr/bin/firefox
export EDITOR=/usr/bin/nano
export TERM=rxvt-256color

#Prompt universal
export PS1="\[\e[01;32m\]\u\[\e[0m\]\[\e[01;33m\] @ \[\e[0m\]\[\e[01;32m\]\h\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[01;33m\][\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[01;34m\]\w\[\e[0m\]\[\e[1;36m\] \D{%F %T} \[\e[0m\]\[\e[01;33m\]]\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[01;32m\]\\$\[\e[0m\]\[\e[00;37m\] \[\e[0m\]"

#------------------------------------------------

#Docker
alias docker-run='sudo docker run --privileged  -ti -e "contain=docker"  -v /sys/fs/cgroup:/sys/fs/cgroup'

#Alias generales
alias pud='pushd'
alias pod='popd'
alias kp='pkill -P $1 $2'
alias bx='bash -x'
alias passgen='LC_ALL=C tr -dc "A-Za-z0-9_!@#$%^&*()\-+=" < /dev/urandom | fold -w 20 | head -n 4'
alias psf="ps -eo 'pid,args' --forest"
alias dnf-last="rpm -qa --last"
alias t='tmux -l -u -2'
alias c="cd"
alias tf="terraform"
alias tg="terragrunt"
alias ap='ansible-playbook'
#------------------------------------------------

#Booleans

force_color_prompt=yes

#------------------------------------------------

#Funciones

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

#------------------------------------------------
