# source <(kubectl completion bash)
# alias k="kubectl"
# complete -F __start_kubectl k
# alias pods="k get pods"
# alias svc="k get svc"
# alias nodes="k get node"
# alias dep="k get deploy"
# alias kall="k get all"
# alias kns="k config set-context --current --namespace"
# alias ns="k get ns"

alias ls='ls --color=auto'
alias ll='ls -la'
alias l.='ls -d .* --color=auto'
alias py='python3 $@'
alias venvh='. /mnt/e/repos/BigData/Hadoop/.venv/bin/activate'

alias reload='source ~/.bashrc'
alias rego='cd /mnt/e/repos/Golang'
alias repy='cd /mnt/e/repos/Python'

alias cov='coverage run -m pytest'
alias comis='coverage report --show-missing'

# git aliases
alias gs='git status'
alias gd='git diff'
alias gu='git add -u'
alias ga='git add -A'
alias gb='git branch'
function gchk {
    if [[ -z "$1" ]]; then
        echo "Error: Please provide a branch name."
        return 1
    fi

    git checkout "$1"  # Run the git checkout command
}
# alias gchk='git checkout $1'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'
alias gr='git reset'
alias gl='git log --graph --oneline --decorate --color --pretty=format:"%C(auto)%h %C(bold blue)%<(15,trunc)%an%Creset -%C(auto)%d%Creset %C(white)%s%Creset %C(dim white)(%cr)%Creset %C(auto)%C(bold green)%t%Creset"'
alias glcall='git log --graph --oneline --decorate --color --pretty=format:"%C(auto)%h %C(bold blue)%<(15,trunc)%an%Creset -%C(auto)%d%Creset %C(white)%s%Creset %C(dim white)(%cr)%Creset %C(auto)%C(bold green)%t%Creset" \
    | grep -E --color "chore:|fix:|ci:|feat:|docs:|style:|refactor:|test:|build:|perf:|revert:"'
alias glct='function _glc() { git log --graph --oneline --decorate --color --pretty=format:"%C(auto)%h %C(bold blue)%<(15,trunc)%an%Creset -%C(auto)%d%Creset %C(white)%s%Creset %C(dim white)(%cr)%Creset %C(auto)%C(bold green)%t%Creset" \
            | tail -n $1 \
            | grep -E --color "chore:|fix:|ci:|feat:|docs:|style:|refactor:|test:|build:|perf:|revert:"; }; _glc'
alias glch='function _glc() { git log --graph --oneline --decorate --color --pretty=format:"%C(auto)%h %C(bold blue)%<(15,trunc)%an%Creset -%C(auto)%d%Creset %C(white)%s%Creset %C(dim white)(%cr)%Creset %C(auto)%C(bold green)%t%Creset" \
            | head -n $1 \
            | grep -E --color "chore:|fix:|ci:|feat:|docs:|style:|refactor:|test:|build:|perf:|revert:"; }; _glc'

# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    alias update='sudo apt-get update'
    alias upgrade='sudo apt-get upgrade'
    alias install='sudo apt-get install $@'
    alias d='sudo docker $@'
    alias vim='sudo vim $@'
    alias t='sudo terraform $@'
fi

export DR="--dry-run=client -oyaml"