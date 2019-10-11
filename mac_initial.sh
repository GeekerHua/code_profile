#/usr/bin/bash
init_ruby() {
    gem sources --add https://gems.ruby-china.com
    gem sources -r https://rubygems.org/
}

init_brew() {
    xcode-select --install
    # /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install >> brew_install
    sed -i /github\.com/Homebrew/brew/mirrors\.ustc\.edu\.cn/brew\.git/g
    /usr/bin/ruby ./brew_install

    brew tap homebrew/cask
    cd "$(brew --repo)"
    git remote set-url origin git://mirrors.ustc.edu.cn/brew.git
    cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
    git remote set-url origin git://mirrors.ustc.edu.cn/homebrew-core.git
    cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
    git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git

    brew install lsd wget python2 python3 lua nvm you-get htop docker mycli ffmpeg bat tig tmux bash-completion fzf cmake mvim
    echo 'export HOMEBREW_NO_AUTO_UPDATE=true' >>~/.zshrc
    source ~/.zshrc
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
    brew cask install font-hack-nerd-font
}

init_vim() {
    # brew install macvim
    # 安装im-select，用来自动切换vscode输入法
    curl -Ls https://raw.githubusercontent.com/daipeihust/im-select/master/install_mac.sh | sh
    curl -sLf https://spacevim.org/cn/install.sh | bash
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
    
    # touch
    defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 1;
    defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0;
    defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 0;
    defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 1;
    
}
source ~/.zshrc
