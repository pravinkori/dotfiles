# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/pravin/.zsh/completions:"* ]]; then export FPATH="/home/pravin/.zsh/completions:$FPATH"; fi
	# Created by newuser for 5.9
# Zinit setup
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME/.git" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Completions
autoload -Uz compinit && compinit

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview "ls --color=always \${realpath}"
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview "ls --color=always \${realpath}"

# Aliases
if ls --color=auto >/dev/null 2>&1; then
    alias ls='ls --color=auto'
elif ls -G >/dev/null 2>&1; then
    alias ls='ls -G'
fi
alias ll='ls -lha'

export PATH=$PATH:/usr/local/go/bin

# fzf setup
source <(fzf --zsh)

# zoxide (optional)
eval "$(zoxide init zsh)"

# Starship prompt
eval "$(starship init zsh)"

export PATH=$PATH:$HOME/go/bin

# pnpm
export PNPM_HOME="/home/pravin/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
. "/home/pravin/.deno/env"
