# Load ~/.extra, ~/.bash_prompt, ~/.aliases
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,aliases}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Add Git completion support + add infos about the current branch in the prompt
source `brew --prefix`/etc/bash_completion.d/git-completion.bash
source `brew --prefix`/etc/bash_completion.d/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1 GIT_PS1_SHOWSTASHSTATE=1 GIT_PS1_SHOWUNTRACKEDFILES=1

# Add Homebrew completion support
source `brew --repository`/Library/Contributions/brew_bash_completion.sh
