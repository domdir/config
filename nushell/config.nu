# Nushell Config File
source ~/.config/nushell/default.nu

let-env PROMPT_COMMAND = { starship prompt }
let-env PROMPT_COMMAND_RIGHT = ""
let-env JAVA_HOME = "/usr/lib/jvm/default"

alias ll = ls -l

source ~/.config/nushell/paru.nu
source ~/.config/nushell/git.nu
source ~/.config/nushell/venv.nu
source ~/.config/nushell/zellij.nu
