# Set custom prompt: [akolesov@akolesov-ws64 llvm]$
export PS1='[\u@\h \W]\$ '
 
# Report the status of terminated background jobs immediately.
set -b

alias grep='grep --color=auto'

# Use user-friendly ll alias
alias ll='ls -lv'

# Import anything specific to this machine.
if [ -f ~/bashrc.machine ]; then
    source ~/bashrc.machine
fi

