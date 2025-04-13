export XDG_CONFIG_HOME="$HOME/.config"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/nabil/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/nabil/.cache/lm-studio/bin
set -q KREW_ROOT; and set -gx PATH $PATH $KREW_ROOT/.krew/bin; or set -gx PATH $PATH $HOME/.krew/bin

# set fish_greeting
# set --erase fish_greeting
set -U fish_greeting

set -gx GPG_TTY (tty)

set -l os (uname)

set -gx DIRENV_WARN_TIMEOUT 0

export PATH="$HOME/.local/bin:/opt/homebrew/bin/:/opt/homebrew/sbin/:$HOME/.cargo/bin/:/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin/:$HOME/.bin:$PATH"
if test "$os" = Linux
    export PATH="/home/linuxbrew/.linuxbrew/bin/:/opt/google-cloud-cli/bin:~/.bin:$PATH"
    eval (direnv hook fish)
    export TERM=xterm-256color
    # set -xU MANPAGER 'sh -c "col -bx | /usr/sbin/bat -l man -p"'
    set -xU MANPAGER 'less -R --use-color -Dd+r -Du+b'
    set -xU MANROFFOPT '-P -c'
end
export EDITOR="nvim"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

zoxide init fish | source
atuin init fish --disable-up-arrow | source

# Editor
alias vim="$EDITOR"
alias v="$EDITOR"

# cat
alias cat="bat -pp"

alias dircolors='gdircolors'

# ls and tree
alias treed='erd -I -H -y inverted -d logical -s name'
alias tree='erd -I --suppress-size -y inverted -s name'
alias ls='eza --icons --git --hyperlink'
alias l="ls -la"
# alias ls='lsd --hyperlink auto'

# sshuttle
alias tunnel='sshuttle -r pi1 0/0'
alias tunnel_dns='sshuttle --dns -r pi1 0/0'
alias reset_tunnel='sudo ipfw -q -f flush'

## git aliases
alias g="git"
alias gst="git status"
alias gcm="git commit -m"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gpr="git pull --rebase"
alias ga="git add"
alias gcm="gco main"
alias gcs="git commit --gpg-sign"
alias gd="git diff"
alias glog="git log --oneline --decorate --graph"
alias gloga='git log --oneline --decorate --graph --all'
alias gqs="git quick-stats"
alias gstp="gst --porcelain"
alias tig="gitui"
if test "$os" = Darwin
    alias tigg="/opt/homebrew/bin/tig"
else
    alias tigg="/usr/sbin/tig"
end
alias gb="git branch"
alias gbs="git branch --show"
alias gp="git push"
alias gpfwl="git push --force-with-lease"
alias gpf="git push --force-with-lease"
alias gpfwol="git push --force"

# just
alias j="just"

# dig
alias dig="dig +short"

# pueue
alias p="pueue"

# watch
alias watch='viddy '

# nas
alias nas='cd ~/Library/CloudStorage/SynologyDrive-macbook-pro-m2max/'

# kubectl
alias k="kubectl"
alias kctx="kubectx"
alias kns="kubens"
alias kgp="kubectl get pods"
alias kgs="kubectl get svc"
alias kgd="kubectl get deployment"
alias kgns="kubectl get ns"
alias kg="kubectl get"
alias kpf="kubectl port-forward"
alias keti="kubectl exec -ti"
alias klo="kubectl logs -f"
alias kdel="kubectl delete"
alias kdesc="kubectl describe"
alias kaf="kubectl apply -f"
alias kdelf="kubectl delete -f"

# terraform
alias tf="terraform"
alias tfi="terraform init"
alias tfget="terraform get"
alias tfa="terraform apply"
alias tfa!="terraform apply -auto-approve"
alias tfp="terraform plan"
alias tfc="terraform console"
alias tfo="terraform output"
alias tfr="terraform refresh"
alias tfs="terraform show"
alias tft="terraform taint"
alias tfu="terraform untaint"
alias tfd="terraform destroy"
alias tff="terraform fmt"
alias tfv="terraform validate"
alias tfw="terraform workspace"
alias tfws="terraform workspace"
alias tfwsl="terraform workspace list"
alias tfwsc="terraform workspace create"
alias tfwsd="terraform workspace delete"
alias tfver="terraform version"
alias tfst="terraform state"
alias tfstl="terraform state list"
alias tfsts="terraform state show"
alias tfim="terraform import"

alias tfswitch="tfswitch -b $HOME/.bin/terraform"
alias tfsw="tfswitch"

# pacman
if test "$os" = Linux
    alias pacman="sudo pacman"
end

# tput
alias tpr="tput reset"

# cd
function =
    cd -
end

function take
    mkdir -p $argv; and cd $argv
end

function growl
    set -l os (uname)
    if test "$os" = Darwin
        terminal-notifier -title "Psssssst !!" -subtitle "A message from your shell:" -message "$argv"
    end
    curl -s -d "$argv" 'https://ntfy.sh/ne_mac_2023_ntfy_20231021' >/dev/null
end

function sgrowl
    growl $argv
    set -l os (uname)
    if test "$os" = Darwin
        say "$argv"
    end
end

function shch
    curl https://cheat.sh/$argv
end

function update_all
    set -l os (uname)
    if test "$os" = Darwin
        brew update
        brew upgrade
        brew link --overwrite node --force
        brew upgrade --greedy
        growl "brew update finished"
        nvim +silent -c "Lazy update" +MasonUpdate +qall
        growl "vim plug update finished"
    end
    topgrade --disable chezmoi --disable platformio_core --disable pnpm
end

function reload
    source ~/.config/fish/config.fish
end

function reload_tips
    reload
    __abbr_tips_init
end

function change
    v ~/.config/fish/config.fish
end

function get_cluster_name
    # string match -r 'em52-svpc-gke.*' $argv
    set -l kontext (kubectl config view --minify --output 'jsonpath={.current-context}/{..namespace}' 2>/dev/null)
    if test $status != 0
        return 1
    end
    set -l match (string match -r 'gke-.*' $kontext)
    if test -n "$match"
        echo $match
    else
        echo $kontext
    end
end

function _tide_item_kubectl
    get_cluster_name | read -l context &&
        _tide_print_item kubectl $tide_kubectl_icon' ' (string replace -r '/(|default)$' '' $context)
end

function update_ollama_models
    for model in (ollama list | tail -n +2 | awk '{print $1}')
        echo "Pulling model: $model"
        ollama pull $model
    end
end

function chead
    cat $argv[2] | head -n $argv[3] | bat - -l $argv[1]
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
