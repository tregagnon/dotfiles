# Load ~/.secret
# ~/.secret can be used for settings you don’t want to commit
for file in ~/.{secret}; do
[ -r "$file" ] && source "$file"
done
unset file

# alias to run MacVim with the standard gui command
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'

alias ls='ls -aFo'

# add git completion support + add infos about the current branch in the prompt (check .git-completion.sh)
source "$HOME/.git-completion.sh" &&
export GIT_PS1_SHOWDIRTYSTATE=1 GIT_PS1_SHOWSTASHSTATE=1 GIT_PS1_SHOWUNTRACKEDFILES=1 &&
export PS1='\u@\h:\W$(__git_ps1 " (%s)")\$ '
