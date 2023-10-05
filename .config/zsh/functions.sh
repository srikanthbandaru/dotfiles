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
