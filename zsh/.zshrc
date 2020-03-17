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

### Specific

###  BMWRPP-BEGIN  ###
# Do not change content between BEGIN and END!
# This section is managed by a script.

if [ -f "/etc/bmwrpp-bootstrap/zshrc" ]; then
  . "/etc/bmwrpp-bootstrap/zshrc"
else
  echo "bmwrpp-bootstrap not installed, please remove BMWRPP section from /home/vaya/.zshrc"
fi
###  BMWRPP-END  ###
alias git="git"

alias screencast="avconv -video_size 1920x1080 -framerate 25 -f x11grab -i :0.0+0,0 "
alias fork="fork &> /dev/null"
alias gitlog="git log --graph --all --decorate=full"
alias to-clipboard="xclip -selection clipboard -i"
alias rmbuild='if [ `basename $PWD` = "build" -a -e CMakeCache.txt ]; then rm -rvf *; else echo "\e[31mRecursive remove conditions not met\e[0m"; fi'
alias gitlog="git log --all --graph --decorate=full"
alias gitlog-master="git log --graph --decorate=full master"

#PROXY="$USER:$PW@10.12.9.140:8080";
PROXY_USH_PAC="http://www.fiatauto.com/pac/proxy-trn1.pac"
#PROXY_USH="151.88.24.11:8080"
PROXY_USH="ittrn1s3px02.fiatauto.com:8080"
alias myproxy='read -r "USER?Username: " ;read -rs "PW?Password: " 
PROXY="$USER:$PW@$PROXY_USH";
export http_proxy=http://$PROXY;export Proxy=$http_proxy;export https_proxy=https://$PROXY;export ftp_proxy=ftp://$PROXY'

alias setproxy='read -rs "PW?Password: " 
PROXY="f09620c:$PW@$PROXY_USH";
export http_proxy=http://$PROXY;export Proxy=$http_proxy;export https_proxy=https://$PROXY;export ftp_proxy=ftp://$PROXY'

alias cntlm-passwd='echo "Enter password and update /etc/cntlm.conf accordingly. Afterwards restart cntlm service"; echo -n "New password: "; cntlm -H -u f09620c -d fiatauto | grep PassNTLMv2'

alias emacs='nohup emacs &>/dev/null & disown'
alias charm='nohup charm &>/dev/null & disown'
alias jvim='/usr/bin/vim'
alias vim='nvim'
alias vimconf='nvim $HOME/.config/nvim/init.vim'

# Bazel alias
alias launch-test-gui="bazel run --config=adp_fca --cache_test_results=no "
alias current-status=" echo ddad: \$(git rev-parse --short HEAD) && echo adp master: \$(git -C application/adp rev-parse --short master) && echo adp: \$(git -C application/adp rev-parse --short HEAD) && git submodule status"

export HISTSIZE=10000000

# cntlm
PROXY_NTLM="127.0.0.1:3128"
export http_proxy="http://$PROXY_NTLM/"
export https_proxy="http://$PROXY_NTLM/"
export HTTP_PROXY="http://$PROXY_NTLM/"
export HTTPS_PROXY="http://$PROXY_NTLM/"

