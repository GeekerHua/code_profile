#/usr/bin/bash
init_ruby() {
    gem sources --add https://gems.ruby-china.com
    gem sources -r https://rubygems.org/
}

init_brew() {
    brew install python2 python3 lua nvm you-get wget htop docker mycli ffmpeg bat autojump tig tmux mwget bash-completion fzf
    echo 'export HOMEBREW_NO_AUTO_UPDATE=true' >>~/.zshrc
    source ~/.zshrc
    brew tap homebrew/cask
    brew cask install postman ShadowsocksX-NG
}

init_python() {
    pip isntall ipython
    pip3 install ipython thefuck
    echo 'eval $(thefuck --alias)' >>~/.zshrc
}

init_font() {
    # 安装如诗般的FiraCode字体
    brew tap homebrew/cask-fonts
    brew cask install font-fira-code
}

init_vim() {
    brew install macvim --head --override-system-vim
}

init_zsh() {
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone --depth=1 git@github.com:skywind3000/z.lua.git ~/Code/tools/z.lua

}

mac_setting() {
    # dock
    defaults write com.apple.dock autohide-delay -int 0;killall Dock #（时间设为最短）
    defaults write com.apple.dock autohide-delay -int 0.5;killall Dock #（时间设为 0.5s）
    defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock # (去掉过渡动画)
    defaults delete com.apple.dock autohide-time-modifier;killall Dock # (恢复默认过渡动画)
}
source ~/.zshrc
