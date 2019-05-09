#/usr/bin/bash
init_ruby(){
    gem sources --add https://gems.ruby-china.com
    gem sources -r https://rubygems.org/
}

init_zsh(){
    git clone --depth=1 git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    chsh -s /bin/zsh
}

init_brew() {
    brew install python2 python3 nvm you-get wget htop docker mycli ffmpeg ccat autojump tig tmux mwget
    echo 'export HOMEBREW_NO_AUTO_UPDATE=true' >> ~/.zshrc; source ~/.zshrc
    brew tap homebrew/cask
    brew cask install postman ShadowsocksX-NG
}

init_python() {
    pip isntall ipython
    pip3 install ipython thefuck
    echo 'eval $(thefuck --alias)' >> ~/.zshrc 
}

init_node() {
    nvm install node
    npm install cnpm -g --registry=https://registry.npm.taobao.org
}

init_vim(){
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

}

init_font() {
    # 安装如诗般的FiraCode字体
    brew tap homebrew/cask-fonts
    brew cask install font-fira-code
}

source ~/.zshrc
