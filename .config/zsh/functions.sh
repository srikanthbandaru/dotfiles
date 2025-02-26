# pyenv, python
layz_load_pyenv() {
    unset -f pyenv python
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
}

pyenv() {
    layz_load_pyenv
    pyenv $@
}

python() {
    layz_load_pyenv
    python $@
}

# Cheat Sheet
function fetch_cheat() {
    local language="$1"
    local query="$2"
    curl -s "https://cht.sh/$language/$(echo $query | tr ' ' '+')?T" | bat --pager="less -R" -l "$3"
}

function cheat_sheet() {
    local languages="typescript\njavascript\nbash\nreact"
    local core_utils="git\ndocker\nfind\ngrep"

    # Combine languages and core_utils into one list and use fzf to select an item
    local selected=$(echo -e "$languages\n$core_utils" | fzf --preview 'cheat {}' --preview-window=down:20%:wrap)

    # Exit if nothing was selected
    [ -z "$selected" ] && return

    # Prompt user for a query
    print -n "Query: "
    read query

    # Associative array for mapping language/tool to bat language type
    declare -A lang_map=(
        [typescript]="ts"
        [javascript]="js"
        [bash]="sh"
        [react]="jsx"
        [git]="sh"
        [docker]="sh"
        [find]="sh"
        [grep]="sh"
    )

    # If the selected item exists in the lang_map, fetch and highlight using the mapped value
    if [[ ${lang_map[$selected]} ]]; then
        fetch_cheat "$selected" "$query" "${lang_map[$selected]}"
    else
        # Default case: just fetch without specific highlighting
        fetch_cheat "$selected" "$query" "txt"
    fi
}

# dedupeAndSortZshHistory
function dedupeAndSortZshHistory() {
    local data
    data=$(cat $HOME/.config/zsh/.zsh_history)
    echo "$data" |
        sed 's/git commit -m "[^"]*"/git commit -m ""/g' |
        sort |
        awk '!a[$0]++' \
            >$HOME/.config/zsh/.zsh_history
}

v() {
    select config in kickstart nvchad; do
        NVIM_APPNAME=nvim-$config nvim "$@"
        break
    done
}
