#theming ------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="catppuccin"
CATPPUCCIN_FLAVOR="macchiato" 

#plugins ----------------------------- 
#options = absolute/user/host
PATHFMT_MODE="user"
RPROMPT='$(path_format)'

plugins=(
  git 
	zsh-autosuggestions
	zsh-interactive-cd
  copypath
  web-search
  pathfmt
  zsh-bat
  vi-mode
)


#startup - script -----------------------s
source $ZSH/oh-my-zsh.sh
source ~/station/tools/zsh-fzf/zsh-interactive-cd.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#nvm
export NVM_DIR="$HOME/.nvm"
[ -f "/usr/share/nvm/init-nvm.sh" ] && source "/usr/share/nvm/init-nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" #bash completion
nvm use lts/hydrogen  #node-18
neofetch

#conda
source ~/station/tools/miniconda/bin/activate
. "$HOME/.local/bin/env"


#google-cloud-sdk
# PATH for the Google Cloud SDK.
if [ -f '/home/dev/station/tools/google-cloud-sdk/path.zsh.inc' ]; then . '/home/dev/station/tools/google-cloud-sdk/path.zsh.inc'; fi
# shell command completion for gcloud.
if [ -f '/home/dev/station/tools/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/dev/station/tools/google-cloud-sdk/completion.zsh.inc'; fi


