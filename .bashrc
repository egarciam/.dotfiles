# .bashrc
#
#
HISTSIZE=5000
HISTFILESIZE=10000

#set -x

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PATH="$PATH:/usr/local/bin"

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$PATH:$HOME/.local/bin:$HOME/bin"
fi
export PATH

# istioctl
export PATH="$PATH:/home/egarciad/istio-1.20.2/bin"

# linuxbrew
export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"

# etcd
export PATH="$PATH:/home/egarciad/projects/kubernetes/etcd/bin"

# go
export GOROOT="/usr/local/go"
export PATH="$PATH:$GOROOT/bin"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi


# GPG SIGN commit git commit -S
export GPG_TTY=$(tty)

if [[ -z "$XDG_RUNTIME_DIR" ]]; then
  export XDG_RUNTIME_DIR=/run/user/$UID
  if [[ ! -d "$XDG_RUNTIME_DIR" ]]; then
    export XDG_RUNTIME_DIR=/tmp/$USER-runtime
    if [[ ! -d "$XDG_RUNTIME_DIR" ]]; then
      mkdir -m 0700 "$XDG_RUNTIME_DIR"
    fi
  fi
fi

export KUBECONFIG=~/.kube/kubeconfig

# Source aliases file
if [ -f ~/.dotfiles/.bash_aliases ]; then
    . ~/.dotfiles/.bash_aliases
fi

# 
#export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.312.b07-2.fc34.x86_64/jre

# Source machine-specific configuration
if [ -f ~/.dotfiles/.machine_config ]; then
    . ~/.dotfiles/.machine_config
fi

# Autocomplete setup for various tools
_setup_autocompletions() {
    local commands=(
        "kubectl:kubectl completion bash"
        "flux:flux completion bash"
        "kubebuilder:kubebuilder completion bash"
        "operator-sdk:operator-sdk completion bash"
        "doctl:doctl completion bash"
        "clusterctl:clusterctl completion bash"
        "sylvactl:sylvactl completion bash"
        "etcdctl:etcdctl completion bash"
        "kind:kind completion bash"
        "gh:gh completion -s bash"
        "clusteradm:clusteradm completion bash"
        "cilium:cilium completion bash"
        "containerlab:containerlab completion bash"
        "regctl:regctl completion bash"
        "regsync:regsync completion bash"
        "velero:velero completion bash"
        "mc:mc"
        "terraform:terraform"
    )
    
    for cmd_completion in "${commands[@]}"; do
        local cmd="${cmd_completion%%:*}"
        local completion="${cmd_completion#*:}"
        
        if command -v "$cmd" >/dev/null 2>&1; then
            if [[ "$completion" == *" "* ]]; then
                # For commands that need source <(command)
                source <($completion) 2>/dev/null
            else
                # For commands that need complete -C
                complete -C "$(command -v $cmd)" "$cmd" 2>/dev/null
            fi
        fi
    done
    
    # Special cases for custom aliases
    command -v kubectl >/dev/null && complete -o default -F __start_kubectl k
    command -v containerlab >/dev/null && complete -o default -F __start_containerlab cl
}

# Run autocomplete setup
_setup_autocompletions
 
# Function to checkout and pull main, then rebase branch
function gcr {
  git checkout main && git branch -D $1;
  git pull && git checkout $1 && git rebase main
}


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/usr/local/sdkman"
[[ -s "/usr/local/sdkman/bin/sdkman-init.sh" ]] && source "/usr/local/sdkman/bin/sdkman-init.sh"

[[ -s "/home/egarciad/.gvm/scripts/gvm" ]] && source "/home/egarciad/.gvm/scripts/gvm"
export PATH="$PATH:${KREW_ROOT:-$HOME/.krew}/bin:/usr/bin/"
 

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# ssh agent
# check if it's running
if [ $(ps ax | grep [s]sh-agent | wc -l ) -gt 0 ]; then
  echo "ssh-agent already running!"
else 
  echo 'Cargando ssh-agent'
  eval $(ssh-agent -s)
  echo 'Leyendo claves'
  ssh-add
fi

eval "$(starship init bash)"



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/yayito/google-cloud-sdk/path.bash.inc' ]; then . '/home/yayito/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/yayito/google-cloud-sdk/completion.bash.inc' ]; then . '/home/yayito/google-cloud-sdk/completion.bash.inc'; fi

# add Pulumi to the PATH
export PATH=$PATH:/home/egarciad/.pulumi/bin
