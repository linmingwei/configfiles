# Folders
alias doc="$HOME/Documents"
alias dow="$HOME/Downloads"
# Better ls
alias ls="eza --all --icons=always"

# Lazygit
alias lg="lazygit"



# Git 别名
alias g='git'
alias ga='git add'
alias gc='git commit -m'
alias gs='git status'
alias gp='git push'
alias gl='git pull'
alias glog="git log --oneline --decorate --graph --all"

# 系统导航
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# proxy
# 开启代理，使用 7890 端口
alias startproxy='export http_proxy=http://127.0.0.1:7890; export https_proxy=http://127.0.0.1:7890; export all_proxy=http://127.0.0.1:7890; echo "activate proxy on 7890 port"'
# 关闭代理
alias stopproxy='unset http_proxy; unset https_proxy; unset all_proxy; echo "deactivate proxy"'

# 常用工具
alias cat='bat' # 如果你安装了 bat
alias vim='nvim' # 如果你主要使用 Neovim

# 创建并进入目录 (这是一个函数，比 alias 更强大)
# 函数也可以放在这个文件里
function take() {
  mkdir -p "$1" && cd "$1"
}
