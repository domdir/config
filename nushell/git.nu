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
    let $bname = (git symbolic-ref --short HEAD | str trim)
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
alias gb = git branch
alias gdf = git diff
def grho [] {
    let $bname = (git symbolic-ref --short HEAD| str trim)
    grh (echo "origin/" $bname | str collect)
}
def gu [bname] {
    if (gdf --exit-code | complete).exit_code == 0 {
        gjo $bname
        go $bname
        grho
    } else {
        echo "There are uncommitted changes"
    }
}
