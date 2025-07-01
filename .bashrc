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

# ectd
export PATH="$PATH:/home/egarciad/projects/kubernetes/etcd/bin"

# go
export GOROOT="/usr/local/go"
export  PATH="$PATH:$GOROOT/bin"
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

# exesudo
# if [ -f ~/.exesudo ]; then
# . .exesudo
# fi

# GPG SIGN commit git commit -S
export GPG_TTY=$(tty)

export https_proxy=http://10.113.55.34:8080
#export https_proxy=http://ggcr6931:Garp345604-@10.193.255.99:8080
export http_proxy=http://10.113.55.34:8080
#export http_proxy=http://ggcr6931:Garp345604-@10.193.255.99:8080
export no_proxy=localhost,.cosmos.es.ftgroup,.si.orange.es,0.0.0.0,ingress.local,ingress.local.eth0,ingress.local.ca.tls,10.193.85.0/24,10.193.82.0/24,172.16.0.0/16,192.168.0.0/16,172.18.0.0/16,10.193.58.0/24,kind-registry,quay-cache,docker-cache,172.17.0.0/16 #,10.193.0.0/16
# export HTTP_PROXY=$http_proxy
# export HTTPS_PROXY=$https_proxy
# export NO_PROXY=$no_proxy



# export OPENFAAS_PREFIX="egmg"

# unset rc

if [[ -z "$XDG_RUNTIME_DIR" ]]; then
  export XDG_RUNTIME_DIR=/run/user/$UID
  if [[ ! -d "$XDG_RUNTIME_DIR" ]]; then
    export XDG_RUNTIME_DIR=/tmp/$USER-runtime
    if [[ ! -d "$XDG_RUNTIME_DIR" ]]; then
      mkdir -m 0700 "$XDG_RUNTIME_DIR"
    fi
  fi
fi

#export KUBECONFIG=~/.kube/config.GRC_PROD;~/.kube/config.localhost
#export KUBECONFIG=~/.kube/config.GRC_PROD
export KUBECONFIG=~/.kube/kubeconfig
#export KUBECONFIG=~/.kube/config.localhost
#alias k=~/projects/kubectl/kubectl
#alias k='kubectl --kubeconfig=/home/egarciad/.kube/config.GRC_PROD'
alias k=kubectl
#alias k='kubectl --kubeconfig=~/.kube/config.localhost'
# Digital Ocean kubectl
# kdo
alias kdo='kubectl --kubeconfig=/home/egarciad/.kube/k8s-1-21-5-do-0-ams3-egmg-project-1-kubeconfig.yaml'
alias h='KUBECONFIG=/home/egarciad/.kube/k8s-1-21-5-do-0-ams3-egmg-project-1-kubeconfig.yaml helm'

# Utilidades para inspeccion de imagenes
alias dfimage="docker run -v /var/run/docker.sock:/var/run/docker.sock --rm alpine/dfimage"
alias dive="docker run -ti --rm  -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive"
# 
#export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.312.b07-2.fc34.x86_64/jre


# ALIAS para kubectl y los diferentes clusters
alias ktest='kubectl --kubeconfig=$HOME/kubeconfigs/kube-test-config'
# kpru cluster clpru1 en lab (nspru vsphere namespace)
alias kpru='kubectl --kubeconfig=$HOME/kubeconfigs/clpru1-kubeconfig'

#### Diferentes contextos
# tmc - en PRE
# tmc-cluster-ns
# kubectl
alias ktmc='kubectl --kubeconfig=$HOME/kubeconfigs/tmc-test-cluster-kubeconfig'
# ktop - Otra consola de kubernetes pero peor que k9s
# ktop
alias ktmctop='kubectl-ktop --kubeconfig=$HOME/kubeconfigs/tmc-test-cluster-kubeconfig'
# k9s
alias k9stmc='k9s --kubeconfig=$HOME/kubeconfigs/tmc-test-cluster-kubeconfig'

# LAB
# CONTEXT: cloud-test  vsphere namespace
# kubectl
alias klab='kubectl --kubeconfig=$HOME/kubeconfigs/cloud-test-pod-cidr-alloc-kubeconfig'
# k9s
alias k9slab='k9s --kubeconfig=$HOME/kubeconfigs/cloud-test-pod-cidr-alloc-kubeconfig'
# ktop - Otra consola de kubernetes pero peor que k9s
alias klabtop='kubectl-ktop --kubeconfig=$HOME/kubeconfigs/cloud-test-cluster-1-kubeconfig'

# PRE
# CONTEXT mxfuw-iam99-admin@mxfuw-iam99 (NOKIA)
# kubectl
alias kpre='kubectl --kubeconfig=$HOME/kubeconfigs/mxfuw-iam99-kubeconfig'
# k9s
alias k9spre='k9s --kubeconfig=$HOME/kubeconfigs/mxfuw-iam99-kubeconfig'

# NIAM
# CONTEXT mxfuw-iam99-admin@mxfuw-iam99 (NOKIA) namespace netguard-admin-ns
# kubectl
alias kniam='kubectl --kubeconfig=$HOME/kubeconfigs/mxfuw-iam99-kubeconfig -n netguard-admin-ns'
# k9s
alias k9sniam='k9s --kubeconfig=$HOME/kubeconfigs/mxfuw-iam99-kubeconfig -n netguard-admin-ns'

# NIAM
# CONTEXT mxulw
# ULISES PRODUCCION
alias kul='kubectl --kubeconfig $HOME/kubeconfigs/mxulw-iam01-kubeconfig'
# k9s
alias k9sul='k9s --kubeconfig $HOME/kubeconfigs/mxulw-iam01-kubeconfig'

# NIAM
# CONTEXT mxfuw
# COSLADA PRODUCCION 
alias kcol='kubectl --kubeconfig $HOME/kubeconfigs/mxfuw-iam01-kubeconfig'
# k9s
alias k9scol='k9s --kubeconfig $HOME/kubeconfigs/mxfuw-iam01-kubeconfig'


# DO
# # 
alias kdo='kubectl --kubeconfig $HOME/.kube/kube-config-control-plane'
# k9s
alias k9sdo='k9s --kubeconfig=$HOME/.kube/kube-config-control-plane'

# TKNG THE KUBERNETES NETWORKING GUIDE
# #
alias ktk='kubectl --context kind-k8s-guide --kubeconfig ~/.kube/kubeconfig'
alias k9stk='k9s --kubeconfig ~/.kube/kubeconfig'

# SYLVA CLUSTER ON PC
# 
alias ks='kubectl --kubeconfig=$HOME/kubeconfigs/sylva-kubeconfig'
alias k9sylva='k9s --kubeconfig ~/kubeconfigs/sylva-kubeconfig'

# Servidor para montar un repositorio de charts de helm
# chartmuseusm
alias cm=chartmuseum

# OTC CAAS PRE
alias kcas='k --kubeconfig ~/kubeconfigs/otc-caas-management-cluster-kubeconfig'
# OTC CAAS PRE WKLOAD
alias kcasw='k --kubeconfig ~/kubeconfigs/otc-caas-workload-cluster-kubeconfig'


# NIF KUBELOGIN
alias knif='kubectl --kubeconfig=$HOME/kubeconfigs/nif.conf'
# alias knif='kubectl --kubeconfig=$HOME/kubeconfigs/nif-tz/workload-cluster-kubeconfig'
#
# OTC-CAAS PRE WORKLOAD CLUSTER
alias kbm='kubectl --kubeconfig ~/kubeconfigs/bm-osp-capi-kubeconfig'

# kpt
alias kpt=~/bin/kpt_linux_amd64

# kubectl autocomplete
source <(kubectl completion bash)
complete -o default -F __start_kubectl k

#flux autocomplete
command -v flux >/dev/null && . <(flux completion bash)

# kubebuilder autocomplete
source <(kubebuilder completion bash)

#operator-sdk completion
source <(operator-sdk completion bash)

#doctl
source <(doctl completion bash)
 
# Function to checkout and pull main, then rebase branch
function gcr {
  git checkout main && git branch -D $1;
  git pull && git checkout $1 && git rebase main
}

# clusterctl autocomplete
source <(clusterctl completion bash)

# sylvactl autocomplete
source <(sylvactl completion bash)

# etcdctl completion
source <(etcdctl completion bash)

# kind completion
. <(kind completion bash)


# kops
#. <(kops completion bash)

# tkn completion
# . <(tkn completion bash)

# kpt completion
#. <(kpt_linux_amd64 completion bash)
#. <(kpt completion bash)

# gh github cli completion
. <(gh completion -s bash)

# clusteradm cli completion
. <(clusteradm completion bash)

# cilium completion
. <(cilium completion bash)

# containerlab completion
. <(containerlab completion bash)
complete -o default -F __start_containerlab cl

# regctl completion
. <(regctl completion bash)

# regsync completion
. <(regsync completion bash)

# velero completion
. <(velero completion bash)


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
# alias code="/mnt/c/My\ Program\ Files/VSCode-win32-x64-1.98.1/Code.exe > /dev/null 2>&1 &"
alias code="/mnt/c/Program\ Files/Microsoft\ VS\ Code/Code.exe > /dev/null 2>&1 &"

alias tf=terraform

eval "$(starship init bash)"

complete -C /usr/local/bin/mc mc

complete -C /usr/bin/terraform terraform
