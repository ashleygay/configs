#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# START ssh-agent if not already started
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

PS1='\[\e[0;32m\]\u\[\e[m\]\[\e[1;34m\]\w\[\e[m\]\[\e[1;32m\] $?\$ \[\e[m\]\[\e[1;37m\]'
#PS1='[\u@\h \W]$?\$ '

# set the TERM variable to a color-enabled type (xterm-color)
export TERM="st-256color"
export VISUAL="vim"

# FUNCTIONS

#TODO: will generate code to automatically set vars to their arguments value
set_args() {
	echo "TODO"
}

parse_options_test () {
	DEVICE="invalid"
	MOUNT_POINT=~/Public
	FILES_DIR=~/Music/*
	USAGE="TEST HERE"
#TODO: maybe switch to getopt in the future
while getopts ':hd:m:f:' option; do
	case "$option" in
	d) DEVICE=${OPTARG}
# if device = invalid return here
#	   if ["$DEVICE" == "invalid"]; then
#		echo $USAGE
#		return 1
#	   fi
	   ;;
	m) MOUNT_POINT=${OPTARG}
	   ;;
	f) FILES_DIR=${OPTARG}
	   ;;
	h) echo $USAGE
	   return 0
	   ;;
	:) echo Bad options
	   return 1
	   ;;
	\?) echo "$FUNCNAME : Illegal options"
	    return 1
	   ;;
	esac
shift $((OPTIND-1))
done
#shift $((OPTIND-1))

# if device = invalid return here

echo "Will sync device : $DEVICE (mountpoint : $MOUNT_POINT) with directory : $FILES_DIR"

read -r -p "Do you want to proceed ? [y/n]" response
response=${response,,} #lowercase
if [[ $response =~ ^(yes|y) ]] || [[ -z $response ]]; then
	#sudo mount $DEVICE $MOUNT_POINT
	#sudo cp -r $FILES_DIR $MOUNT_POINT
	#sudo umount $DEVICE
	echo 'Syncing done !'
fi
}

adjust_screen() {
	xrandr --output HDMI1 --$1-of eDP1 --mode 1920x1080
}

grepv() {
	grep -Irn $1 . | vim -R -
}

vp() {
	FILES=`find . -name $1`
	vim -p $FILES
}

lock() {
	$HOME/./.alt_lock.sh
}

backup() {
	sudo dd if=/dev/sda of=$1 bs=1M status=progress
}

kernel_cc() {
	make clean && make -j4
}

v() {
	vim -p $@
}

tar_stuff() {
	FILE=${1%/}
	if [ $FILE = "." ]; then
		FILE="root"
	fi
	tar -czf $FILE.tar.gz $1

}

find_package() {
	xbps-query -R -s "$1" | vim -
}


vgit() {
	vim -p $(git status --porcelain | awk '{print $2}')
}

#GIT ALIASES
alias commit='git commit --signoff -m'
#LAINCHAIN RADIO
alias radio='surf https://lainchan.org/radio.html'
# ALIASES
alias update='sudo xbps-install -Su'
alias lines='wc -l'
alias rm='rm -ri'
alias gist='git status'
alias gibr='git branch -vv'
alias gich='git checkout'
alias findfile='find . -name'
alias exact_grep='grep -Irn'
alias emax='emacs -nw'
alias c='cd'
alias gitree='git log --pretty=format:"%h %s" --graph'
alias gcc='clear && gcc'
alias g++='clear && g++'
alias make='clear && make'
alias l='ls -la --color=always'
alias shutdown='sudo shutdown now'
alias reboot='sudo reboot'

#BINDS
bind 'set mark-symlinked-directories on'

# Path to the bash it configuration
export BASH_IT="/home/ferryk/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='zork'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
source "$BASH_IT"/bash_it.sh
