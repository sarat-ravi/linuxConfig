# Path to your oh-my-zsh configuration.
#
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx macports per-directory-history rails3 ruby screen)

#setopt PROMPT_SUBST

source $ZSH/oh-my-zsh.sh
export PROMPT='%{%F{237}%}$PWD$ %{$reset_color%}%{%F{white}%}%{$reset_color%}%'
#%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}

DYLD_FALLBACK_LIBRARY_PATH=$DYLD_FALLBACK_LIBRARY_PATH:"/Users/saratt/lm-vfp/vfp/vfpy/thirdparty/lib/"
export DYLD_FALLBACK_LIBRARY_PATH

unsetopt correct_all  
setopt correct


# Customize to your needs...
export PATH=$PATH:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/usr/local/go/bin:/Users/saratt/.rvm/bin
export PATH=/Users/saratt/Software/bin:$PATH


if [ $(t | wc -l | sed -e's/ *//') != "0" ]
then
    export PS1="[$(t | wc -l | sed -e's/ *//')] $PS1"
fi

#displays contents after cd'ing into it
function cd()
{
    param=$* 2> /dev/null
    if $param -eq "" 2> ~/.error_log
    then
        builtin cd ~/ 2> ~/.error_log && ls
    else
        builtin cd $param && ls
    fi
}

export MARKPATH=$HOME/.marks
function jump { 
    cd $(readlink -n $MARKPATH/$1) 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark {
    rm -i $MARKPATH/$1
}
function marks {
    ls -l $MARKPATH | sed 's/ / /g' | cut -d' ' -f9- && echo
}

if [[ `uname` -eq 'Darwin' ]]
then

    # MAC OSX Specific commands


    #for MAC OSX only
    function exitt()
    {
        #osascript -e 'tell application "Terminal" to quit'
        exit
    }

    function activateVirtualEnv()
    {
        path="~/Software/pythonVirtualEnvs/$1"; 
        echo $path;
        if [ -d "${path}" ]; then
            echo "The directory exists";
        else
            #virtualenv ~/Software/pythonVirtualEnvs/$1;
            echo "New Virtualenv Created";
        fi
        #source "$path/bin/activate";

    }

    alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir=Library/Application\ Support/Google/Chrome/Default/"
    alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
    #eqv of find . -iname "<str>"
    alias search="find . -iname "$1""
    alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl $1"

    export CLICOLOR=1
    export LSCOLORS=GxFxCxDxBxegedabagaced


    # Setting PATH for Python 2.7
    # The orginal version is saved in .bash_profile.pysave
    #PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
    #export PATH

    export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

    ##
    # Your previous /Users/saratt/.bash_profile file was backed up as /Users/saratt/.bash_profile.macports-saved_2012-06-27_at_14:09:41
    ##

    # MacPorts Installer addition on 2012-06-27_at_14:09:41: adding an appropriate PATH variable for use with MacPorts.
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    #export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/bin:$PATH
    export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH
    # Finished adapting your PATH environment variable for use with MacPorts.

    # add postgres.app path
    #export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
    #export DYLD_FALLBACK_LIBRARY_PATH=$DYLD_FALLBACK_LIBRARY_PATH:/Applications/Postgres.app/Contents/MacOS/lib

    # enable bash completion
    #if [ -f `brew --prefix`/etc/bash_completion ]; then
    #    . `brew --prefix`/etc/bash_completion
    #fi

    #up key autocompletes based on history, 
    #bind '"\e[A": history-search-backward'
    #bind '"\e[A": history-search-backward'
    #bind '"\e[B": "\C-k \C-u"'



fi
# The following lines were added by compinstall
