
## Options section
setopt extendedglob											# Extended globbing. Allows using regular expressions with *
setopt nocaseglob											# Case insensitive globbing
setopt rcexpandparam										# Array expension with parameters
setopt nocheckjobs											# Don't warn about running processes when exiting
setopt numericglobsort										# Sort filenames numerically when it makes sense
setopt appendhistory										# Immediately append history instead of overwriting
setopt histignorealldups									# If a new command is a duplicate, remove the older one
setopt autocd												# if only directory path is entered, cd there.
setopt inc_append_history									# save commands are added to the history immediately, otherwise only when shell exits.
setopt SHARE_HISTORY

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'	# Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"		# Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true							# automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh

mkdir -p ~/.config/zsh

HISTFILE=~/.config/zsh/history
HISTSIZE=10000
SAVEHIST=10000

export EDITOR=/usr/bin/micro
export VISUAL=/usr/bin/micro
WORDCHARS=${WORDCHARS//\/[&.;]}								# Don't consider certain characters part of the word


## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line							# Home key
bindkey '^[[H' beginning-of-line							# Home key
if [[ "${terminfo[khome]}" != "" ]]; then
	bindkey "${terminfo[khome]}" beginning-of-line			# [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line									# End key
bindkey '^[[F' end-of-line									# End key
if [[ "${terminfo[kend]}" != "" ]]; then
	bindkey "${terminfo[kend]}" end-of-line					# [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode								# Insert key
bindkey '^[[3~' delete-char									# Delete key
bindkey '^[[C'  forward-char								# Right key
bindkey '^[[D'  backward-char 								# Left key
bindkey '^[[5~' history-beginning-search-backward			# Page up key
bindkey '^[[6~' history-beginning-search-forward			# Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word									#
bindkey '^[Od' backward-word								#
bindkey '^[[1;5D' backward-word								#
bindkey '^[[1;5C' forward-word								#
bindkey '^H' backward-kill-word								# delete previous word with ctrl+backspace
bindkey '^[[Z' undo 										# Shift+tab undo last action

## Alias section
alias cp="cp -i" 											# Confirm before overwriting something
alias df='df -h' 											# Human-readable sizes
alias free='free -m' 										# Show sizes in MB

# Custom functions
remove_orphans() {											# Shortcut for removing orphaned packages
	pacman -Qttdq | sudo pacman -Rns -
}

if command -v lsd &> /dev/null
then
	alias ls='lsd -l --icon never'
	alias lsa='lsd -la --icon never'
else
	alias ls='ls -l'
	alias lsa='ls -la'
fi

if command -v micro &> /dev/null
then
	alias nano='micro'
fi

# Theming section
autoload -U compinit colors zcalc
compinit -d
colors


## Plugins section: Enable fish style features
# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


autoload -U add-zsh-hook

# enable substitution for prompt
setopt prompt_subst
# Maia prompt
PROMPT="%B%{$fg[cyan]%}%(4~|%-1~/.../%2~|%~)%u%b >%{$fg[cyan]%}>%B%(?.%{$fg[cyan]%}.%{$fg[red]%})>%{$reset_color%}%b "
RPROMPT="%{$fg[red]%} %(?..[%?])"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Allow for users to add their own stuff by sourcing ~/.config/zsh/extra-zshrc
EXTRA_ZSHRC_FILE=~/.config/zsh/extra-zshrc
if [ -f $EXTRA_ZSHRC_FILE ]; then
	source $EXTRA_ZSHRC_FILE
fi
