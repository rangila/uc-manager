# Path to your oh-my-zsh installation.
export ZSH=$HOME/uc-manager/ohmyzsh

ZSH_THEME="af-magic"

DISABLE_AUTO_UPDATE="true"

plugins=(sudo last-working-dir ssh-agent wd)

source $ZSH/oh-my-zsh.sh


alias nbstrip_jq="jq --indent 1 \
    '(.cells[] | select(has(\"outputs\")) | .outputs) = []  \
    | (.cells[] | select(has(\"execution_count\")) | .execution_count) = null  \
    | .metadata = {\"language_info\": {\"name\": \"python\", \"pygments_lexer\": \"ipython3\"}} \
    | .cells[].metadata = {} \
    '"

# Base16 Shell
BASE16_SHELL="$HOME/uc-manager/base16-shell"
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Jupyter and pip
#
export PATH="$HOME/.local/bin:$PATH"

# Anaconda
#
saved_ps=$PS1
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/rangila/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/rangila/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/rangila/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/rangila/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PS1="$saved_ps"

