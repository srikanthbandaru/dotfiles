function link_dotfiles() {
    local current_dir="$PWD"
    
    # Linking directories in ~/.config
    echo "Linking directories to ~/.config..."
    cd ~/projects/dotfiles/.config
    for dir in *; do
        # Check if symlink or directory doesn't already exist
        if [ ! -e ~/.config/"$dir" ]; then  
            ln -s "$PWD/$dir" ~/.config/
            echo "Linked $dir to ~/.config/"
        else
            echo "~/.config/$dir already exists. Skipping."
        fi
    done

    # Linking individual dotfiles to ~
    echo "Linking dotfiles to home directory..."
    for file in ~/projects/dotfiles/.*; do
        base_name=$(basename "$file")
        # Check if it's a file and doesn't already exist in ~
        if [ -f "$file" ] && [ ! -e ~/"$base_name" ]; then  
            ln -s "$file" ~/
            echo "Linked $base_name to ~/"
        elif [ -e ~/"$base_name" ]; then
            echo "~/$base_name already exists. Skipping."
        fi
    done
    
    cd "$current_dir"
}