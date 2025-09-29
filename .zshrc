# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export SSH_AUTH_SOCK=/run/user/$(id -u)/ssh-agent.socket


#taskfile completions
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit
compinit
eval "$(task --completion zsh)"


ZSH_THEME="powerlevel10k/powerlevel10k"



#antitode - optimized plugins load
source ~/.zsh_plugins/antidote/antidote.zsh
antidote bundle <~/.zsh_plugins.txt >~/.zsh_plugins.zsh
antidote load



#nvm
knvm() {
  unset -f knvm
  export NVM_DIR="$HOME/.nvm"
  [ -f "/usr/share/nvm/init-nvm.sh" ] && source "/usr/share/nvm/init-nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" #bash completion
  echo "nvm loaded"
}

#conda + go binaries
kconda() {
  unset -f kconda
  source ~/station/tools/miniconda/bin/activate
  echo "conda activated"
}


#ssh key for github
ghssh() {
  ssh-add ~/.ssh/github-key
}

#initalize k3s config
export KUBECONFIG=$HOME/.config/k3s/config
kconda


#google-cloud-sdk
#updates PATH for the Google Cloud SDK.
if [ -f '/home/dev/station/tools/google-cloud-sdk/path.zsh.inc' ]; then . '/home/dev/station/tools/google-cloud-sdk/path.zsh.inc'; fi
#enables shell command completion for gcloud.
if [ -f '/home/dev/station/tools/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/dev/station/tools/google-cloud-sdk/completion.zsh.inc'; fi



#EXPORTS ==============
#golang
export PATH="$HOME/go/bin:$PATH"
#qt apps config
export QT_QPA_PLATFORMTHEME=qt5ct
#thunderbird
export PATH="/usr/bin/thunderbird:$PATH"
#ruby packages
export PATH="$HOME/.local/share/gem/ruby/3.4.0/bin:$PATH"
#custom scripts
export PATH="$HOME/work/scripts:$PATH"
#local execs
export PATH="$HOME/.local/bin:$PATH"
#blast toolkit
export PATH="$HOME/station/tools/blast/blast-src/bin:$PATH"
#sra toolkit
export PATH=$PATH:/opt/sratoolkit/bin

#ALIASES ================
alias k8s="kubectl"
alias kctx="kubectx"
alias dk="docker"
alias ldk="lazydocker"
alias lgt="lazygit"
alias mk8s="minikube"
alias tf="terraform"
alias py="python"
alias ff="fastfetch --logo arch3"
alias pingtt="ping -v -c 5 google.com"
alias ghcli="gh"




# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
