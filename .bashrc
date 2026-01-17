# all the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

#taskfile completions
eval "$(task --completion bash)"

[ -f /usr/share/doc/fzf/examples/completion.bash ] && source /usr/share/doc/fzf/examples/completion.bash
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash


# / ============= 
#    CUSTOM APIs 
# \ ============= /
syncdirs(){
  docker-compose -f $HOME/scripts/dirsync/docker-compose.yaml up -d
}

ghssh(){
  export SSH_AUTH_SOCK=/run/user/1000/ssh-agent.sock
  ssh-add ~/.ssh/github_key_omarchy
}


# / ============= \
#    PATHS 
# \ ============= /
export PATH="$PATH:$HOME/.local/share/bin"
export PATH="$PATH:/usr/local/bin/go/bin"
export PATH="$PATH:$HOME/station/google-cloud-sdk/bin/"
export PATH="$PATH:$HOME/.bun/bin" #bun-js

# / ============= \
#    STARTUP SCRIPTS 
# \ ============= /
# >>> conda initialize >>>
# >>> ensure hashing is enabled <<<

condainit(){
  export PATH="$PATH:/usr/bin/miniconda3/bin"
  set -o hashall
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/usr/bin/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  else
    if [ -f "/usr/bin/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/bin/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin/miniconda3/bin:$PATH"
    fi
  fi
  unset __conda_setup
}

# <<< conda initialize <<<


#sdk-man
source "$HOME/.sdkman/bin/sdkman-init.sh"
#list sdkman installed packages
sdk-ls(){
  tree -L 2 ~/.sdkman/candidates/
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/sardiness/station/google-cloud-sdk/google-cloud-sdk/path.bash.inc' ]; then . '/home/sardiness/station/google-cloud-sdk/path.bash.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/home/sardiness/station/google-cloud-sdk/completion.bash.inc' ]; then . '/home/sardiness/station/google-cloud-sdk/completion.bash.inc'; fi


#Android SDK
export ANDROID_HOME=/opt/android-sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk/27.2.12479018


# / ============= \
#     ALIASES
# \ ============= /
alias k8s="kubectl"
alias tt="task"
alias ldk="lazydocker"
alias lgt="lazygit"
alias ff="fastfetch"
alias l="ls"
alias kc="kubectx"
alias code="vscodium"
alias ncc="networkctl"


# / ============ \ 
# KUBECONFIG management
# \ ============ /
kc_unset(){
  unset KUBECONFIG
}
kc_setk3s(){
  export KUBECONFIG=/home/sardiness/.kube/config/k3s.yaml
}
kc_setgke(){
  export KUBECONFIG=/home/sardiness/.kube/config/gke.yaml
}
kc_delgke(){
  rm /home/sardiness/.kube/config/gke.yaml
}
kc_makegke(){
  touch /home/sardiness/.kube/config/gke.yaml
}
kc_setk3s


export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
