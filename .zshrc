# ~/.zshrc (revised)

# ── PATH / FPATH: one place, no duplicates, no hardcoded home dir ───────────
typeset -U path fpath                       # auto-dedupe both arrays
export PNPM_HOME="$HOME/.local/share/pnpm"
path=("$HOME/.local/bin" "$PNPM_HOME" $path /usr/local/go/bin "$HOME/go/bin")
fpath=("$HOME/.zsh/completions" $fpath)     # deno completions live here
[[ -f $HOME/.deno/env ]] && . "$HOME/.deno/env"

# ── Zinit bootstrap ─────────────────────────────────────────────────────────
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [[ ! -d $ZINIT_HOME/.git ]]; then
    mkdir -p "${ZINIT_HOME:h}"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "$ZINIT_HOME/zinit.zsh"

# zsh-completions only adds to fpath, so it must load BEFORE compinit
zinit light zsh-users/zsh-completions

# ── compinit: full rebuild at most once a day, cached otherwise ─────────────
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do compinit; done
compinit -C
unset dump

# ── Plugins that must load AFTER compinit ───────────────────────────────────
# Order matters: fzf-tab first, then anything that wraps widgets
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions

# ── Keybindings ─────────────────────────────────────────────────────────────
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# ── History ─────────────────────────────────────────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=$HISTSIZE

setopt share_history          # implies incremental append + import
setopt extended_history       # store timestamps
setopt hist_ignore_space      # commands starting with a space aren't saved
setopt hist_ignore_all_dups   # newest copy wins (also covers hist_ignore_dups)
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks

# ── Completion styling ──────────────────────────────────────────────────────
[[ -z $LS_COLORS ]] && (( $+commands[dircolors] )) && eval "$(dircolors -b)"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # case-insensitive
zstyle ':completion:*' menu no                              # required by fzf-tab
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':fzf-tab:complete:(cd|z|__zoxide_z):*' fzf-preview 'ls --color=always $realpath'

# ── Aliases (GNU ls; this file is Linux-specific anyway) ────────────────────
alias ls='ls --color=auto'
alias ll='ls -lha'

# ── Tools (guarded so a missing binary doesn't spam errors at startup) ──────
(( $+commands[fzf] ))      && source <(fzf --zsh)          # needs fzf >= 0.48
(( $+commands[zoxide] ))   && eval "$(zoxide init zsh)"
(( $+commands[starship] )) && eval "$(starship init zsh)"

# ── nvm: lazy-loaded (saves several hundred ms per shell start) ─────────────
export NVM_DIR="$HOME/.nvm"
for _cmd in nvm node npm npx; do
    eval "${_cmd}() { unset -f nvm node npm npx; source \"\$NVM_DIR/nvm.sh\"; ${_cmd} \"\$@\"; }"
done
unset _cmd

# ── Syntax highlighting: keep LAST ──────────────────────────────────────────
zinit light zsh-users/zsh-syntax-highlighting
