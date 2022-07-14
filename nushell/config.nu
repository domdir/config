# Nushell Config File
source ~/.config/nushell/default.nu

let-env config = {
    edit_mode: vi,
    shell_integration: true
}

let-env PROMPT_COMMAND = { starship prompt }
let-env PROMPT_COMMAND_RIGHT = ""
let-env JAVA_HOME = "/usr/lib/jvm/default"

alias ll = ls -l
alias pp = python ~/ppc.py .

source ~/.config/nushell/paru.nu
source ~/.config/nushell/git.nu
source ~/.config/nushell/venv.nu
source ~/.config/nushell/zellij.nu

let personal_scripts = (echo $env.HOME "/personal_config/scripts" | str collect) 
if ($personal_scripts | path exists) {
    ls -f $personal_scripts | each { |it|
        source $it.name
    }
}
