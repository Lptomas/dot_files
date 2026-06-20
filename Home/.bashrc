
#!/bin/bash

# .bashrc
# para fazer RELOAD : 
#       source ~/.bashrc   # ou ~/.zshrc


# Para carregar um ficheiro: 
#       [ -f ~/.aliases.sh ] && source ~/.aliases.sh


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


export TERMINAL="alacritty"
export BROWSER="firefox"
#atenção: Void linux é T e nao t
export FILEMANAGER="Thunar"



# Relaod bashrc or .zshrc
# permite fazer update aos alias
alias rb='source ~/.bashrc && echo " - Bash Reloaded...done"'
#alias rz='source ~/.zshrc'

alias ls='ls --color=auto'


alias sm='xrandr --output eDP  --primary --mode 1920x1200  --pos 0x1060  --rotate normal --output HDMI-A-0   --mode 1680x1050_59.00   --pos 120x0    --rotate normal --output DisplayPort-0 --off && echo " - set screens...done"'



# Gestão de pacotes XBPS (Void Linux)
alias xu="sudo xbps-install -Su && xcheckrestart"   # atualiza o sistema e verifica processos a reiniciar
alias xi="sudo xbps-install -S"                      # instala pacote(s)    
alias xq="sudo xbps-query -Rs"                       # pesquisa pacotes nos repositórios
alias xrm="sudo xbps-remove -R"                      # remove pacote e dependências órfãs
alias xl="xbps-query -l | awk '{print $2}' | sed 's/-[0-9].*//'"                        # lista pacotes instalados
alias xrO="sudo xbps-remove -O"                      # limpa cache de pacotes
alias xro="sudo xbps-remove -o"                      # remove dependências órfãs
alias xvkpl="sudo vkpurge list"                      # lista kernels antigos removíveis
alias xvkpr="sudo vkpurge rm"                        # remove kernel(s) antigo(s)
 



# System update
alias update='sudo xbps-install -Su'

# Install a package
alias install='sudo xbps-install'

# Remove a package and its orphaned dependencies
alias remove='sudo xbps-remove -Rcon'

# Search for a package
alias search='xbps-query -Rs'

# List installed packages
alias list='xbps-query -l'
# Reconfigure a package
alias reconf='sudo xbps-reconfigure -f'



#espaços sao importatntes
# Enable a runit service
svenable() { sudo ln -sfv /etc/sv/$1 /var/service/; }
# Disable a runit service
svdisable() { sudo rm -v /var/service/$1; }

svstart()   { sudo sv start $1; }
svstop()    { sudo sv stop $1; }
#svstatus()  { sudo sv status $1; }


#verifica tudo o que está instalado com o nome do pacote
xview() { sudo xbps-query -l | grep -i $1; } 



# Check service status
alias svstatus='sudo sv status /var/service/*'





#make DWM
alias mkdwm='cd ~/.config/dwm/ && rm -f config.h && sudo make clean install '

# Espaço em disco - readable output 
alias df='df -h'


alias hw="hwinfo --short"


#Restar after update


PS1='[\u@\h \W]\$ '

# Created by `pipx` on 2026-02-04 21:32:04
export PATH="$PATH:/home/et/.local/bin"
export PATH=$HOME/.npm-global/bin:$PATH
