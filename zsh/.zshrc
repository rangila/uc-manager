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
#BASE16_SHELL="$HOME/uc-manager/base16-shell"
#[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Nord dircolors
test -r ~/uc-manager/nord/nord-dircolors/src/dir_colors && eval $(dircolors ~/uc-manager/nord/nord-dircolors/src/dir_colors)

# Jupyter and pip
#
export PATH="$HOME/.local/bin:$PATH"

