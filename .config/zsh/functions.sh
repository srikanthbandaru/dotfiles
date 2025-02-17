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

# save yabai layout
function save_layout() {
    if [ -z "$1" ]; then
        echo "Please provide a layout name."
        return 1
    fi

    layout_name=$1
    yabai -m query --spaces | jq > $HOME/.config/yabai/yabai_${layout_name}_spaces.json
    yabai -m query --windows | jq > $HOME/.config/yabai/yabai_${layout_name}_windows.json
    echo "Layout '${layout_name}' saved."
}

# restore yabai layout
function restore_layout() {
    if [ -z "$1" ]; then
        echo "Please provide a layout name."
        return 1
    fi

    layout_name=$1
    windows=$(cat $HOME/.config/yabai/yabai_${layout_name}_windows.json)

    # to ensure that the most recently used windows are restored last
    windows_reversed=$(echo "$windows" | jq -c '. | reverse')

    attempts=3 
    success=false

    for ((i = 0; i < attempts; i++)); do
        echo "$windows_reversed" | jq -c '.[]' | while read window; do
            id=$(echo "$window" | jq -r '.id')
            app=$(echo "$window" | jq -r '.app')
            space=$(echo "$window" | jq -r '.space')
            x=$(echo "$window" | jq -r '.frame.x')
            y=$(echo "$window" | jq -r '.frame.y')
            width=$(echo "$window" | jq -r '.frame.w')
            height=$(echo "$window" | jq -r '.frame.h')

            yabai -m window --focus $id
            yabai -m window --space $space

            # toggle float to move and resize if necessary
            yabai -m window --toggle float
            yabai -m window --move abs:$x:$y
            yabai -m window --resize abs:$width:$height
            yabai -m window --toggle float  

        done
        
        # check if the restoration was successful
        if [ $? -eq 0 ]; then
            success=true
            break
        fi
    done

    if [ "$success" = true ]; then
        echo "Layout '${layout_name}' restored successfully."
    else
        echo "Layout '${layout_name}' could not be restored completely. Please try again."
    fi
}

