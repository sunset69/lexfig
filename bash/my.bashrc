#命令别名 
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls -a --color=auto'
alias grep='grep --color=auto'
alias cls="clear"
alias ra="ranger"
alias vim="nvim"
alias bashrc="nvim ~/config/bash/my.bashrc"
alias bashrcs="source ~/config/bash/my.bashrc"
alias nvimrc="nvim ~/.config/nvim/init.vim"
alias zshrc="nvim ~/.zshrc"
alias zshrcs="source ~/.zshrc"

# ==========自定义指令==========
#终端代理
proxy_statu="off"
function proxy_on() {
	proxy_off="on"
	export http_proxy=http://127.0.0.1:7890
	export https_proxy=$http_proxy
	echo -e "终端代理已开启。"
}

function proxy_off(){
	unset http_proxy https_proxy
	echo -e "终端代理已关闭。"
	proxy_off="off"
}


# =================================
export PATH="/home/lexur/chromium_build/depot_tools:$PATH"
