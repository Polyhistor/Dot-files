# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Config for ZINIT

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"


# Adding powerLevel10K
zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Defining this function for ohMyZshGit 
function git_current_branch() {
  git branch --show-current 
}

zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl 
zinit snippet OMZP::kubectx 
zinit snippet OMZP::command-not-found 

autoload -U compinit && compinit 

zinit cdreplay -q

bindkey -e
bindkey '^p' history-search-backward 
bindkey '^n' history-search-forward
bindkey ";5C" forward-word
bindkey ";5D" backward-word

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

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' meno no
zstyle ':fzf-tab:complete:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z' fzf-preview 'ls --color $realpath'

alias ls='ls --color'
alias c='clear'


eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

autoload -U select-word-style
select-word-style bash

function checkCommandInstalled(){
  if [[ $# -eq 0 ]]; then 
    echo "No input has been given to the <command_name> command"
    return 2
  fi 

  local command_name="$1"
  precursorText="Commanad"


  if command -v "$command_name" &> /dev/null 
  then 
    echo "$precursorText $command_name is installed"
    return 0 
  else 
    echo "$precursorText $command_name is not installed" 
  fi
}

function gir(){
  # first checking if GH is installed:wq
  checkCommandInstalled gh 

  # then let's see if the user has added the repo name 
  if [ $# -eq 0 ]
  then 
    echo "Please enter the repo name, exiting"
    return 1 
  fi 

  local repo_name="$1"
  
  if gh repo create "$repo_name" --public; then 
    echo "Repo succesfully created"
  else 
    echo "Failed to create the repo"
    return 1
  fi 

  if [! -d .git]; then 
    git init 
  fi

  githubUsername=$(gh api user --jq .login)
  git remote add origin "git@github.com:$githubUsername/$repo_name.git"

  git branch -M main 

  echo "Repo $repo_name created succesfully on Github and initialised locally"
  echo "Remote origin set to: git@github.com:$githubUsername/$repo_name.git"


}

function mkcd(){
  mkdir -p "$1" && cd "$1"
}

function gsrr(){ 


}
