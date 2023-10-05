# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source ~/.config/zsh/functions.sh

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# starship prompt
eval "$(starship init zsh)"
