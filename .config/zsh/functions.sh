# nvm, node, npm, pnpm
lazy_load_nvm() {
    unset -f npm node nvm
    export NVM_DIR=~/.nvm
    [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
}

npm() {
    lazy_load_nvm
    npm $@
}

pnpm() {
    lazy_load_nvm
    pnpm $@
}

node() {
    lazy_load_nvm
    node $@
}

nvm() {
    lazy_load_nvm
    nvm $@
}

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

function fuzzy_navigate() {
    local item
    item=$(
        find -L . -maxdepth 2 \
            -not -path "./.git/*" \
            -not -path "./Library" \
            -not -path "./Library/*" \
            -not -path "./Desktop" \
            -not -path "./Desktop/*" \
            -not -path "./Documents" \
            -not -path "./Documents/*" \
            -not -path "./Downloads" \
            -not -path "./Downloads/*" \
            -not -path "./OneDrive - Bayer" \
            -not -path "./OneDrive - Bayer/*" \
            -not -path "./.Trash" \
            -not -path "./.Trash/*" 2>/dev/null |
            fzf --preview 'bat --color=always --style=numbers {}' --preview-window=down:20%:wrap
    )

    if [[ -n $item ]]; then
        if [[ -d $item ]]; then
            cd "$item"
        elif [[ -f $item ]]; then
            nvim "$item"
        fi
    fi
}

# function cheat_sheet() {
#     languages=$(echo "typescript javascript bash react | tr " " "\n")
#     core_utils=$(echo "git docker find grep | tr ' ' '\n'")
#     selected=$(echo -e "$languages\n$core_utils" | fzf --preview 'cheat {}' --preview-window=down:20%:wrap)

#     read -p "Query: " query

#     if echo "$languages" | grep -qs "$selected"; then
#         curl "cht.sh/$selected/$(echo $query | tr ' ' '+')"
#     elif echo "$core_utils" | grep -qs "$selected"; then
#         curl "cht.sh/$selected~$query"
#     fi
# }
