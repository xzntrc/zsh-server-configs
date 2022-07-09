export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="gallifrey"
plugins=(git)
source $ZSH/oh-my-zsh.sh

clear

local terminal=$(tty 2>/dev/null)

if [[ $terminal == "/dev/tty1" ]]
then
     if ping -c 1 gnu.org >/dev/null 2&>1; then
          local internal=$(ip -json route get 192.168.1.1 | jq -r '.[].prefsrc')
          local external=$(curl -4 icanhazip.com 2>/dev/null)
          local user=$(whoami)

	     printf "Internet connection status: \033[32;1mOK\033[0m\n"
          printf "\n"
          printf "Internal IP Address: \033[32;1m$internal\033[0m\n"
          printf "External IP Address: \033[32;1m$external\033[0m\n"
          printf "\n"
          printf "Connect using: \033[1mssh $user@$internal\033[0m\n"
          printf "              \033[1m ssh $user@$external\033[0m\n\n\n"
     else
          printf "Internet connection status: \033[31;1mBAD\033[0m\n"
          printf "Ensure network connection is present and try again.\n"
     fi
fi
