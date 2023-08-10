alias pjo="pj open"

function pj() {
    local project="$1"
    local open=false

    if [[ "open" == "$project" ]]; then
        shift
        open=true
    fi

    project=$*

    for basedir ($PROJECT_PATHS); do
        if [[ -d "$basedir/$project" ]]; then
            cd "$basedir/$project"
            if [[ $open = true ]]; then
                ${=EDITOR} "$basedir/$project"
            fi
            return
        fi
    done

    echo "No such project '${project}'."
}

_pj () {
    local -a projects
    for basedir ($PROJECT_PATHS); do
        projects+=(${basedir}/*(/N))
    done

    compadd ${projects:t}
}

compdef _pj pj
