# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history


# Bind Keys:
bindkey '^a' beginning-of-line	#Home 
bindkey '^e' end-of-line			#end
bindkey "\e[3~" delete-char		#delete


# theme/plugins
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-autosuggestions.zsh


# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh


# https://github.com/skywind3000/vim/blob/master/etc/zshrc.zsh
# syntax color definition
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009,standout
ZSH_HIGHLIGHT_STYLES[alias]=fg=034,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=034,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=034,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=034,underline
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=034,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
ZSH_HIGHLIGHT_STYLES[path]=fg=214,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=cyan,underline
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[assign]=none

# work around: fast syntax highlighting may crash zsh without this
#FAST_HIGHLIGHT[chroma-git]="chroma/-ogit.ch"


