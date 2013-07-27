# Thierry Régagnon’s dotfiles

## Installation

### Prerequisite

* You are on Mac OS X
* You use [Homebrew](http://brew.sh/)
* You have installed Git with Homebrew

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/.dotfiles/) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone http://github.com/tregagnon/dotfiles.git && cd dotfiles && ./bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
./bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
./bootstrap.sh -f
```

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/tregagnon/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh}
```

To update later on, just run that command again.

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# PATH additions
export PATH="/usr/local/bin:/usr/local/git/bin"

# Git credentials
# Not in the dotfiles repository, to prevent people from committing under my name
git config --global user.name "Your Name"
git config --global user.email "your@mail.com"
git config --global github.user "yourusername"
git config --global github.token "yourtoken"
```

## Feedback

Suggestions/improvements
[welcome](https://github.com/tregagnon/dotfiles/issues)!

## Thanks to…

* [Mathias Bynens](http://mathiasbynens.be/) for sharing his [dotfiles](https://github.com/mathiasbynens/dotfiles) and the bootstrap script
* anyone who published their dotfiles on GitHub with comments. I am learning a lot thanks to you!
