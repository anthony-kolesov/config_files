# Set custom prompt: [akolesov@akolesov-ws64 llvm]$
export PS1='[\u@\h \W]\$ '
 
# Report the status of terminated background jobs immediately.
set -b

# Import anything specific to this machine.
if [ -f "~/bashrc.machine" ]; then
    source "~/bashrc.machine"
fi

