# Autoload screen if we aren't in it.  (Thanks Fjord!)

autoload -U colors && colors

#{{{ Options

# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# Now we can pipe to multiple outputs!
setopt MULTIOS

# Spell check commands!  (Sometimes annoying)
setopt CORRECT

# This makes cd=pushd
setopt AUTO_PUSHD

# This will use named dirs when possible
setopt AUTO_NAME_DIRS

# If we have a glob this will expand it
setopt GLOB_COMPLETE
setopt PUSHD_MINUS

# No more annoying pushd messages...
# setopt PUSHD_SILENT

# blank pushd goes to home
setopt PUSHD_TO_HOME

# this will ignore multiple directories for the stack.  Useful?  I dunno.
setopt PUSHD_IGNORE_DUPS

# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
setopt RM_STAR_WAIT

# use magic (this is default, but it can't hurt!)
setopt ZLE

setopt NO_HUP

# only fools wouldn't do this ;-)
export EDITOR="vim"


setopt IGNORE_EOF

# If I could disable Ctrl-s completely I would!
setopt NO_FLOW_CONTROL

# beeps are annoying
setopt NO_BEEP

# Keep echo "station" > station from clobbering station
setopt NO_CLOBBER

# Case insensitive globbing
setopt NO_CASE_GLOB

# Be Reasonable!
setopt NUMERIC_GLOB_SORT

# I don't know why I never set this before.
setopt EXTENDED_GLOB

# hows about arrays be awesome?  (that is, frew${cool}frew has frew surrounding all the variables, not just first and last
setopt RC_EXPAND_PARAM

#}}}

#{{{ Variables
declare -U path

export LANG=en_US.UTF-8
export LC_ALL=en_US.utf-8
export LC_TYPE=en_US.utf-8
export PAGER=less

export TZ="/usr/share/zoneinfo/America/Vancouver"
#}}}

#{{{ External Files

# Include stuff that should only be on this
if [[ -r ~/.localinclude ]]; then
    source ~/.localinclude
fi

# Include local directories
if [[ -r ~/.localdirs ]]; then
        source ~/.localdirs
fi

autoload run-help
HELPDIR=~/zsh_help

#}}}

#{{{ Aliases


#{{{ Shell Conveniences

alias sz='source ~/.zshrc'
alias ez='vim ~/.zshrc'
alias mk=popd
alias ls='ls --color'
alias kcurl='curl -k'

#}}}

#{{{ Globals...

alias -g G="| grep"
alias -g L="| less"

#}}}

#{{{ Suffixes...

if [[ $DISPLAY = '' ]] then
  alias -s txt=vi
else
  alias -s txt=gvim
fi

#}}}

#}}}

#{{{ Key bindings

# Use vi key bindings
bindkey -v

# Who doesn't want home and end to work?
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

# Incremental search is elite!
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward

# Search based on what you typed in already
bindkey -M vicmd "//" history-beginning-search-backward
bindkey -M vicmd "??" history-beginning-search-forward

bindkey "\eOP" run-help

# oh wow!  This is killer...  try it!
bindkey -M vicmd "q" push-line

# Ensure that arrow keys work as they should
bindkey '\e[A' up-line-or-history
bindkey '\e[B' down-line-or-history

bindkey '\eOA' up-line-or-history
bindkey '\eOB' down-line-or-history

bindkey '\e[C' forward-char
bindkey '\e[D' backward-char

bindkey '\eOC' forward-char
bindkey '\eOD' backward-char

bindkey -M viins 'jj' vi-cmd-mode
bindkey -M vicmd 'u' undo

# Rebind the insert key.  I really can't stand what it currently does.
bindkey '\e[2~' overwrite-mode

# Rebind the delete key. Again, useless.
bindkey '\e[3~' delete-char

bindkey -M vicmd '!' edit-command-output

# it's like, space AND completion.  Gnarlbot.
bindkey -M viins ' ' magic-space

bindkey "^R" history-incremental-search-backward

#}}}

#{{{ History Stuff

# Where it gets saved
HISTFILE=~/.history

# Remember about a years worth of history (AWESOME)
SAVEHIST=10000
HISTSIZE=10000

# Don't overwrite, append!
setopt APPEND_HISTORY

# Write after each command
# setopt INC_APPEND_HISTORY

# Killer: share history between multiple shells
setopt SHARE_HISTORY

# If I type cd and then cd again, only save the last one
setopt HIST_IGNORE_DUPS

# Even if there are commands inbetween commands that are the same, still only save the last one
#setopt HIST_IGNORE_ALL_DUPS

# Pretty    Obvious.  Right?
setopt HIST_REDUCE_BLANKS

# If a line starts with a space, don't save it.
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE

# When using a hist thing, make a newline show the change before executing it.
setopt HIST_VERIFY

# Save the time and how long a command ran
setopt EXTENDED_HISTORY

setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

#}}}

#{{{ Prompt!

### Git
setopt prompt_subst
autoload -Uz vcs_info

GIT_PROMPT_LB="%{$bg[black]%} %{$reset_color%}"
GIT_PROMPT_RB="%{$bg[black]%} %{$reset_color%}"
GIT_PROMPT_BRANCH="%{$bg[white]%}%{$fg_bold[black]%} %b %{$reset_color%}"
GIT_PROMPT_ACTION="%{$bg[purple]%}%{$fg_bold[white]%} %a %{$reset_color%}"
GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔%{$reset_color%}" # can this work?
GIT_PROMPT_STAGED="%{$bg[green]%}%{$fg_bold[black]%} ± %{$reset_color%}"
GIT_PROMPT_UNSTAGED="%{$bg[yellow]%}%{$fg_bold[black]%} ✎ %{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$bg[red]%}%{$fg_bold[black]%} ∴ %{$reset_color%}"

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' stagedstr $GIT_PROMPT_STAGED
zstyle ':vcs_info:*' unstagedstr $GIT_PROMPT_UNSTAGED
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats \
  "$GIT_PROMPT_LB$GIT_PROMPT_BRANCH$GIT_PROMPT_ACTION$GIT_PROMPT_RB%f"
zstyle ':vcs_info:*' formats \
  "$GIT_PROMPT_LB$GIT_PROMPT_BRANCH%c%u$GIT_PROMPT_RB%f"
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
  [[ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]] ; then
    hook_com[unstaged]+=$GIT_PROMPT_UNTRACKED
  fi
}

# Here NPS1 stands for "naked PS1" and isn't a built-in shell variable. I've
# defined it myself for PS1-PS2 alignment to operate properly.
_1LEFT='%{%F{cyan}%}%n%{%f%}@%{%F{green}%}%m%{%f%}:%{%F{yellow}%}%~%{%f%}%{%F{red}%}%(?..[%?])%{%f%}'
NPS1='%n@%m:%~%(?..[%?])'
_1RIGHT='[%*]'

PROMPT='> %# '
RPROMPT='%F{green}${vcs_info_msg_0_}%f'

# Hook function which gets executed right before shell prints prompt.
function precmd() {
    vcs_info
    local expandedPrompt="$(print -P "$NPS1$_1RIGHT")"
    _1SPACES=`get_space ${expandedPrompt}`
    print
    print -rP "$_1LEFT$_1SPACES$_1RIGHT"
}

get_space () {
  local STR=$1$2
  local zero='%([BSUbfksu]|([FB]|){*})'
  local LENGTH=${#${(S%%)STR//$~zero/}}
  local SPACES=""
  (( LENGTH = ${COLUMNS} - $LENGTH - 2))
  for i in {0..$LENGTH}
    do
      SPACES="$SPACES "
    done
  echo $SPACES
}

#}}}

#{{{ Functions

source .zsh/marks

_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1  # Because we didn't really complete anything
}

edit-command-output() {
 BUFFER=$(eval $BUFFER)
 CURSOR=0
}
zle -N edit-command-output

#}}}

#{{{ Testing... Testing...
#exec 2>>(while read line; do
#print '\e[91m'${(q)line}'\e[0m' > /dev/tty; done &)

watch=(notme)
LOGCHECK=0

#}}}
