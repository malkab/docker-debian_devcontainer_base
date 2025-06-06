# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Environment
export PAGER='less -iMSx4 -FX'
export ALTERNATE_EDITOR=''
export PGCLIENTENCODING='UTF-8'
# export TERM=screen-256color
export TERM=xterm-256color
export COLORTERM=gnome-terminal
export EDITOR=vim

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# Define colors
if [ "$color_prompt" = yes ]; then
    BOLD='\[\033[1m\]'
    RED='\[\033[0;31m\]'
    GREEN='\[\033[0;32m\]'
    BGREEN='\[\033[1;32m\]'
    YELLOW='\[\033[0;33m\]'
    BLUE='\[\033[0;34m\]'
    BBLUE='\[\033[1;94m\]'
    PURPLE='\[\033[0;35m\]'
    CYAN='\[\033[0;36m\]'
    WHITE='\[\033[0;37m\]'
    RESET='\[\033[0m\]'
else
    BOLD=''
    RED=''
    GREEN=''
    YELLOW=''
    BLUE=''
    PURPLE=''
    CYAN=''
    WHITE=''
    RESET=''
fi

# Function to get the current Git branch
parse_git_branch() {
    git branch 2>/dev/null | grep '*' | sed 's/* / (/;s/$/)/'
}

# Set the prompt
if [ "$color_prompt" = yes ]; then
  PS1="${BOLD}${BGREEN}\u@\h:${BBLUE}\w\$(parse_git_branch)${RESET}\$ "
else
    PS1="\u@\h:\w\$(parse_git_branch)\$ "
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# some more aliases
alias la='ls -hA'
alias l='ls -CF'
alias ll='ls -lAh -v -w 0 --color=auto --group-directories-first'
alias dfh='df -h'
alias drl='dir -lh'
alias duh='du -h -s'
alias lesss='less -S'
alias fzf='fzf --multi --cycle --layout=reverse --inline-info'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Locale
export LANG=es_ES.UTF-8
export LANGUAGE=es:en
export LC_CTYPE="es_ES.UTF-8"
export LC_NUMERIC=es_ES.UTF-8
export LC_TIME=es_ES.UTF-8
export LC_COLLATE="es_ES.UTF-8"
export LC_MONETARY=es_ES.UTF-8
export LC_MESSAGES="es_ES.UTF-8"
export LC_PAPER=es_ES.UTF-8
export LC_NAME=es_ES.UTF-8
export LC_ADDRESS=es_ES.UTF-8
export LC_TELEPHONE=es_ES.UTF-8
export LC_MEASUREMENT=es_ES.UTF-8
export LC_IDENTIFICATION=es_ES.UTF-8
export LC_ALL=

export LS_COLORS='rs=0:di=01;32:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=04;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'

# bat
alias bat="bat --theme=\"ansi\""

# fzf
export FZF_DEFAULT_COMMAND='fdfind --type f --color=never --hidden --no-ignore'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --theme=\"ansi\" --line-range :50 {}'"

export FZF_ALT_C_COMMAND='fdfind --type d . --color=never --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"

fshow() {
	  git log --graph --color=always \
		  --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
	  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
			        --bind "ctrl-m:execute:
	                  (grep -o '[a-f0-9]\{7\}' | head -1 |
				                  xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
			                  {}
					  FZF-EOF"
}

# fzf
eval "$(fzf --bash)" &> /dev/null
