# Set custom prompt: [akolesov@akolesov-ws64 llvm]$
export PS1='[\u@\h \W]\$ '
 
# Report the status of terminated background jobs immediately.
set -b

my_dir="$(dirname $(readlink -e $0))"

if [ -f "${my_dir}/bashrc.machine" ]; then
    source "${my_dir}/bashrc.machine"
fi

