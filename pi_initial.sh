clone_code(){
    mkdir -p ~/Code
    cd ~/Code
    git clone git@github.com:GeekerHua/code_profile.git
}

install_soft(){
    apt-get install nvm wget htop mycli ccattig tmux mwget nmon sar nc
}

init_node() {
    nvm install node
    npm install cnpm -g --registry=https://registry.npm.taobao.org
}

update_kali(){
    # 安装kali完整版
    sudo apt-get install kali-linux-full    # 安装完整版
    sudo apt-get install kali-desktop-gnome # 安装gnome3
    sudo apt-get purge kali-desktop-xfce    # 卸载xfce
}
