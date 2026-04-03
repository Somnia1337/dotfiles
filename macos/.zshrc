typeset -U path
zshConfig="$HOME/.zshrc"
zshHistory="$HOME/.zsh_history"

export BUN_INSTALL="$HOME/.bun"
export CONFIG="$HOME/.config"
export DEEPSEEK_API_KEY=<hidden>
export DOTS="$HOME/code/dotfiles/macos"
export GITHUB_TOKEN=<hidden>
export HTTP_PROXY="http://127.0.0.1:7897"
export HTTPS_PROXY=$HTTP_PROXY
export LANG=zh_CN.UTF-8
export PYTHON_HISTORY=/dev/null

path=(
  "$BUN_INSTALL/bin"
  "$HOME/.local/bin"
  "$HOME/bin"
  "$HOME/go/bin"
  $path
)

bindkey "^H" backward-kill-word
bindkey "^[[3;5~" kill-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[3~" delete-char

HISTFILE=$zshHistory
HISTSIZE=50000
SAVEHIST=50000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY

. "$HOME/.cargo/env"
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# compact
alias c='cargo'
alias dr='tldr'
alias f='fastfetch'
alias g='git'
alias j='just'
alias py='python3'
alias rs='restic'
alias sf='stockfish'
alias sudo='sudo '
alias tm='tmux'
alias yt='yt-dlp'
alias zj='zellij'

alias cpf='pbcopy <'
alias e='eza --icons --group-directories-first'
alias ea='eza -a --icons --group-directories-first'
alias el='eza -lh --icons --group-directories-first'
alias ela='eza -alh --icons --group-directories-first'
alias fa='fastfetch --logo none --config all.jsonc'
alias fn='fastfetch --logo none'
alias pg='progress -mp $!'
alias rm='command rm -I'
alias tarc='tar --disable-copyfile --exclude=".DS_Store" -caf'
alias tarl='tar -tf'
alias tarx='tar -xkf'

# zsh
alias clh=': > $zshHistory'
alias cls='clear'
alias zh='bat $zshConfig'
alias zm='vim $zshConfig'
alias zs='source $zshConfig'

# py-script
fund() { $HOME/code/python/py-script/fund.py }
rn3() { $HOME/code/python/py-script/rn3.py "$@"; }

# backup
bak() {
  local file="$1"
  [ -f "$file" ] || { echo "file not found: $file"; return 1; }
  cp "$file" "$file.bak"
  echo "backed up: $file.bak"
}

# restore
res() {
  local file="$1"
  local backup="$file.bak"
  [ -f "$backup" ] || { echo "backup not found: $backup"; return 1; }
  cp "$backup" "$file"
  echo "restored: $backup"
}

# compile most recent modified .typ file
typ() {
  local latest=$(ls -t *.typ 2>/dev/null | head -n 1)
  if [ -n "$latest" ]; then
    echo "Compiling $latest"
    typst compile "$latest"
  else
    echo "No .typ files found in the current dir."
  fi
}

# compile all .typ files
typa() {
  for file in *.typ; do
    [ -f "$file" ] || { echo "No .typ files found in the current dir."; return; }
    echo "Compiling $file"
    typst compile "$file"
  done
}

# apply CHANGELOG.md template
cgl() {
  local template="$HOME/code/template/CHANGELOG.md"
  local target="$PWD/CHANGELOG.md"

  [ -f "$template" ] || { echo "template not found: $template"; return 1; }
  [ -f "$target" ] && { echo "CHANGELOG.md already exists"; return 1; }

  cp "$template" "$target"
}

# uv export and lock
uvlock() {
  uv init --bare
  uv pip freeze > req_temp.txt
  uv add --requirements req_temp.txt
  uv lock
  uv sync --frozen
  rm req_temp.txt
}

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [[ $- == *i* ]]; then
  fastfetch --logo none
fi
