# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

#options = absolute/user/host
PATHFMT_MODE="user"
RPROMPT='$(path_format)'


plugins=(
  git 
	zsh-autosuggestions
	zsh-interactive-cd
  copypath
  colored-man-pages
  web-search
  pathfmt
)


#load when terminal opens
source $ZSH/oh-my-zsh.sh
source /home/dev/station/tools/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh




export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  #nvm completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" #bash completion

#GTK theme.
export GTK_THEME=Adwaita:dark


#conda
#source ~/station/tools/miniconda3/bin/activate

. "$HOME/.local/bin/env"

