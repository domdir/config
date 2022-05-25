alias zz = zellij

def repos [] {
    ls ~/repos/ | get name | path basename
}

def z [repo: string@repos] {
    let wd = (echo "~/repos/" $repo | path join)
    let template = open --raw ~/.config/zellij/layouts/repo_template.yaml
    $template |
        str replace '{{session_name}}' $repo -s |
        save /tmp/zellij-repo-layout.yaml --raw

    cd $wd
    zz --layout-path /tmp/zellij-repo-layout.yaml
}

