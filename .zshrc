# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# export ZSH_THEME="robbyrussell"
# export ZSH_THEME="sporty_256"
# export ZSH_THEME="sorin"
#export ZSH_THEME="miloshadzic"
export ZSH_THEME="bira"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rvm)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs...
export PATH=/home/clemensp/.rvm/gems/ree-1.8.7-2010.01/bin:/home/clemensp/.rvm/gems/ree-1.8.7-2010.01@global/bin:/home/clemensp/.rvm/rubies/ree-1.8.7-2010.01/bin:/home/clemensp/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/clemensp/scripts:/home/clemensp/bin

export NVM_DIR="/home/clemensp/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export JRUBY_INVOCATION="$(readlink "$(which celerity_jruby)")"

[[ -s "/home/clemensp/.rvm/scripts/rvm" ]] && source "/home/clemensp/.rvm/scripts/rvm"  # This loads RVM into a shell session.

set -o vi
stty -ixon

# speed up testing!
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_GC_HEAP_INIT_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

alias tmux="TERM=screen-256color-bce tmux"
alias sublime='~/sublime/sublime_text'

alias zedrem='~/zedrem'

# export TERM=xterm-256color  # for common 256 color terminals
# eval `dircolors ~/.dircolors`

#fpath=(~/.zsh/Completion $fpath)
devreview() {
  if [[ -n $1 ]]; then
    git log --pretty=oneline | egrep "Merge branch '${1}.*' into (dev|release|rails_3_stable|production|i18n_daily_dev)" | awk '{print "https://github.com/nulogy/packmanager/commit/" $1}'
  fi
}

cpi_devreview() {
  if [[ -n $1 ]]; then
    git log --pretty=oneline | egrep "Merge branch '${1}.*'.*" | awk '{print "https://github.com/nulogy/cpi/commit/" $1}'
  fi
}

q_devreview() {
  if [[ -n $1 ]]; then
    git log --pretty=oneline | egrep "Merge branch '${1}.*'.*" | awk '{print "https://github.com/nulogy/qcloud/commit/" $1}'
  fi
}

e_devreview() {
  if [[ -n $1 ]]; then
    git log --pretty=oneline | egrep "Merge branch '${1}.*'.*" | awk '{print "https://github.com/nulogy/eventor/commit/" $1}'
  fi
}

r_devreview() {
  if [[ -n $1 ]]; then
    git log --pretty=oneline | egrep "Merge branch '${1}.*'.*" | awk '{print "https://github.com/nulogy/reporting/commit/" $1}'
  fi
}

i_devreview() {
  if [[ -n $1 ]]; then
    git log --pretty=oneline | egrep "Merge branch '${1}.*'.*" | awk '{print "https://github.com/nulogy/iam3d/commit/" $1}'
  fi
}

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

alias xrun="xvfb-run -a --server-args='-screen 0, 1600x1200x24'"
export LD_LIBRARY_PATH=/usr/local/lib

checkmerge() {
  git merge --no-ff --no-commit $1
  if [ "$?" = 0 ]
  then echo "Clean Merge!"
  else echo "Merge Errors!"
  fi
  git merge --abort
}

alias restartx="cinnamon --replace --display=:0"

alias karma="xrun `pwd`/node_modules/.bin/karma"

alias vim="vim --servername 'vim'"
alias xargstovim=$'xargs bash -c \'</dev/tty vim --remote \"$@\"\' ignoreme'

alias ri="rspec spec/integration"
alias ru="rspec spec/unit"
alias rr="ru;ri"
