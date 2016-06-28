# Set custom prompt: [akolesov@akolesov-ws64 llvm]$
export PS1='[\u@\h \W]\$ '

# Set custom prompt for `set -x`: [HH:MM:SS akolesov@akolesov-lab ~]$
export PS4='[\t \W]\$ '

# Report the status of terminated background jobs immediately.
set -b

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Use user-friendly ll alias
alias ll='ls -lhv'

# Import anything specific to this machine.
if [ -f ~/bashrc.machine ]; then
    source ~/bashrc.machine
fi

