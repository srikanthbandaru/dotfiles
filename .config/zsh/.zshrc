# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source ~/.config/zsh/functions.sh
source ~/.config/zsh/fuzzy_navigate.sh

# source my work config
if [[ -f ~/.zshrc-work ]]; then
    source ~/.zshrc-work
fi

# Always enable colored `grep` output
alias grep='grep --color=auto'

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# aliases
alias downloadSubs="yt-dlp --write-auto-sub --skip-download -o "output" \$1"
alias extractSubs="awk '/-->/ {g=1; next} /-->/ {g=0} g' output.en.vtt | sed -e 's/<[^>]*>//g' | awk 'NF' | uniq > subtitles.txt"

alias code='open -a "Visual Studio Code"'
alias {v,vim,nvim}='NVIM_APPNAME=nvim-kickstart nvim'

alias cdLibris="cd '/Users/sri/Library/Mobile Documents/iCloud~md~obsidian/Documents/Libris'"

# starship prompt
eval "$(starship init zsh)"

# fnm - faster nvm
eval "$(fnm env --use-on-cd)"

# FIXME: Why is this not working?
setopt nomatch

# bun completions
[ -s "/Users/glkni/.bun/_bun" ] && source "/Users/glkni/.bun/_bun"
