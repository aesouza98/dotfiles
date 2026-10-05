# install
zinit light zsh-users/zsh-completions

# setup homebrew
for _brew in /opt/homebrew /usr/local /home/linuxbrew/.linuxbrew; do
    [[ -d $_brew/share/zsh/site-functions ]] && fpath=($_brew/share/zsh/site-functions $fpath) && break
done
unset _brew

# options
setopt auto_menu complete_in_word always_to_end
unsetopt list_ambiguous

# matching
zstyle ':completion:*' matcher-list \
    'm:{a-z}={A-Z}' \
    'm:{a-z}={A-Z} r:|[._-]=* r:|=*' \
    'm:{a-z}={A-Z} l:|=* r:|=*'

# tab menu
zstyle ':completion:*' menu no
zstyle ':completion:*' list-prompt ''
zstyle ':completion:*' select-prompt ''
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '[%d]'

# cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"

# commands
zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion::complete:cd:*:*' tag-order 'local-directories directory-stack path-directories'

# fzf-tab
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# init
autoload -Uz compinit
_zcd="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
mkdir -p "${_zcd:h}"
_stale=( $_zcd(N.mh+24) )
if [[ -f $_zcd && $#_stale -eq 0 ]]; then compinit -C -d $_zcd; else compinit -d $_zcd; fi
unset _zcd _stale
zinit cdreplay -q
