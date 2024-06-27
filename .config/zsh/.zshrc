# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source ~/.config/zsh/functions.sh
source ~/.config/zsh/fuzzy_navigate.sh

# source my work config
if [[ -f ~/.zshrc-work ]]; then
    source ~/.zshrc-work
fi

# Always enable colored `grep` output
export GREP_OPTIONS="--color=auto"

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# aliases
alias downloadSubs="yt-dlp --write-auto-sub --skip-download -o "output" \$1"
alias extractSubs="awk '/-->/ {g=1; next} /-->/ {g=0} g' output.en.vtt | sed -e 's/<[^>]*>//g' | awk 'NF' | uniq > subtitles.txt"
# alias code='open -a "VSCodium"'
# alias codium='open -a "VSCodium"'
alias v='nvim'

# starship prompt
eval "$(starship init zsh)"

# fnm - faster nvm
eval "$(fnm env --use-on-cd)"

# FIXME: Why is this not working?
setopt nomatch

# bun completions
[ -s "/Users/glkni/.bun/_bun" ] && source "/Users/glkni/.bun/_bun"
