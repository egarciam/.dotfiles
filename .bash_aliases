#!/bin/bash
# .bash_aliases
# Centralized alias definitions

# Basic kubectl aliases
alias k=kubectl

# Digital Ocean kubectl
alias kdo='kubectl --kubeconfig=/home/egarciad/.kube/k8s-1-21-5-do-0-ams3-egmg-project-1-kubeconfig.yaml'
alias h='KUBECONFIG=/home/egarciad/.kube/k8s-1-21-5-do-0-ams3-egmg-project-1-kubeconfig.yaml helm'

# Docker utilities for image inspection
alias dfimage="docker run -v /var/run/docker.sock:/var/run/docker.sock --rm alpine/dfimage"
alias dive="docker run -ti --rm  -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive"

# Kubernetes cluster aliases
alias ktest='kubectl --kubeconfig=$HOME/kubeconfigs/kube-test-config'
alias kpru='kubectl --kubeconfig=$HOME/kubeconfigs/clpru1-kubeconfig'

# TMC cluster aliases
alias ktmc='kubectl --kubeconfig=$HOME/kubeconfigs/tmc-test-cluster-kubeconfig'
alias ktmctop='kubectl-ktop --kubeconfig=$HOME/kubeconfigs/tmc-test-cluster-kubeconfig'
alias k9stmc='k9s --kubeconfig=$HOME/kubeconfigs/tmc-test-cluster-kubeconfig'

# LAB cluster aliases
alias klab='kubectl --kubeconfig=$HOME/kubeconfigs/cloud-test-pod-cidr-alloc-kubeconfig'
alias k9slab='k9s --kubeconfig=$HOME/kubeconfigs/cloud-test-pod-cidr-alloc-kubeconfig'
alias klabtop='kubectl-ktop --kubeconfig=$HOME/kubeconfigs/cloud-test-cluster-1-kubeconfig'

# PRE cluster aliases
alias kpre='kubectl --kubeconfig=$HOME/kubeconfigs/mxfuw-iam99-kubeconfig'
alias k9spre='k9s --kubeconfig=$HOME/kubeconfigs/mxfuw-iam99-kubeconfig'

# NIAM cluster aliases
alias kniam='kubectl --kubeconfig=$HOME/kubeconfigs/mxfuw-iam99-kubeconfig -n netguard-admin-ns'
alias k9sniam='k9s --kubeconfig=$HOME/kubeconfigs/mxfuw-iam99-kubeconfig -n netguard-admin-ns'

# ULISES PRODUCCION
alias kul='kubectl --kubeconfig $HOME/kubeconfigs/mxulw-iam01-kubeconfig'
alias k9sul='k9s --kubeconfig $HOME/kubeconfigs/mxulw-iam01-kubeconfig'

# COSLADA PRODUCCION
alias kcol='kubectl --kubeconfig $HOME/kubeconfigs/mxfuw-iam01-kubeconfig'
alias k9scol='k9s --kubeconfig $HOME/kubeconfigs/mxfuw-iam01-kubeconfig'

# Digital Ocean cluster
alias kdo='kubectl --kubeconfig $HOME/.kube/kube-config-control-plane'
alias k9sdo='k9s --kubeconfig=$HOME/.kube/kube-config-control-plane'

# TKNG THE KUBERNETES NETWORKING GUIDE
alias ktk='kubectl --context kind-k8s-guide --kubeconfig ~/.kube/kubeconfig'
alias k9stk='k9s --kubeconfig ~/.kube/kubeconfig'

# SYLVA CLUSTER ON PC
alias ks='kubectl --kubeconfig=$HOME/kubeconfigs/sylva-kubeconfig'
alias k9sylva='k9s --kubeconfig ~/kubeconfigs/sylva-kubeconfig'

# Chart museum
alias cm=chartmuseum

# OTC CAAS clusters
alias kcas='k --kubeconfig ~/kubeconfigs/otc-caas-management-cluster-kubeconfig'
alias kcasw='k --kubeconfig ~/kubeconfigs/otc-caas-workload-cluster-kubeconfig'

# NIF KUBELOGIN
alias knif='kubectl --kubeconfig=$HOME/kubeconfigs/nif.conf'

# OTC-CAAS PRE WORKLOAD CLUSTER
alias kbm='kubectl --kubeconfig ~/kubeconfigs/bm-osp-capi-kubeconfig'

# kpt conditional alias
command -v kpt >/dev/null && alias kpt=~/bin/kpt_linux_amd64

# containerlab alias
command -v containerlab >/dev/null && complete -o default -F __start_containerlab cl

# Terraform aliases
alias tf=terraform
alias tg=terragrunt

# VS Code alias (platform-dependent)
# if [ `uname -n` == "LAPTOP-RKGTBC0K" ]; then
#   alias code="/mnt/c/Users/Ernesto/AppData/Local/Programs/Microsoft VS Code/Code.exe > /dev/null 2>&1 &"
# else
#   alias code="/mnt/c/Program\ Files/Microsoft\ VS\ Code/Code.exe > /dev/null 2>&1 &"
# fi