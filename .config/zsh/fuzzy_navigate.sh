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
