# Nushell Config File
source ~/.config/nushell/default.nu

let-env PROMPT_COMMAND = { starship prompt }
let-env PROMPT_COMMAND_RIGHT = ""

alias a = paru
alias as = paru -S
alias aall = paru -Syu

alias ll = ls -l
alias gl = git log --oneline -n 10
alias gln = git log --oneline -n
alias gf = git commit --fixup
alias ga = git rebase -i --autosquash
alias gs = git status
alias gc = git commit
alias gca = git commit --amend
alias gp = git push
alias gpf = git push --force-with-lease
def gpu [] {
    let $bname = (git symbolic-ref --short HEAD)
    gp --set-upstream origin $bname
}
alias go = git checkout
alias gob = git checkout -b
alias gg = git pull
alias gi = git stash
alias gip = git stash pop
alias gj = git fetch
alias gjo = git fetch origin
alias gr = git reset
alias grh = git reset --hard
alias gd = git add

source ~/.config/nushell/venv.nu
