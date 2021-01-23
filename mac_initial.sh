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
    cd "$(brew --repo)"/Library/Taps/homebrew/homebrew-cask
    git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-cask.git


    brew install lsd wget python2 python3 lua nvm you-get htop mycli ffmpeg bat tig tmux bash-completion fzf cmake pyenv
    echo 'export HOMEBREW_NO_AUTO_UPDATE=true' >>~/.zshrc
    source ~/.zshrc
    brew install  visual-studio-code google-chrome
}

init_hosts() {
    echo "151.101.1.194 github.global.ssl.fastly.Net" >> /etc/hosts
    echo "13.229.188.59 gist.github.com" >> /etc/hosts
    echo "151.101.76.133 raw.githubusercontent.com" >> /etc/hosts
    echo "54.231.82.146  vagrantcloud-files-production.s3.amazonaws.com" >> /etc/hosts
    echo "219.76.4.4  s3.amazonaws.com" >> /etc/hosts
    echo "219.76.4.4  github-cloud.s3.amazonaws.com" >> /etc/hosts
}

init_python() {
    v=2.7.18;wget https://npm.taobao.org/mirrors/python/$v/Python-$v.tar.xz -P ~/.pyenv/cache/;PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install $v
    v=3.8.2;wget https://npm.taobao.org/mirrors/python/$v/Python-$v.tar.xz -P ~/.pyenv/cache/;PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install $v
    # 以下方法适用于mac OS 11+
    PYTHON_CONFIGURE_OPTS="--enable-framework";CFLAGS="-I$(brew --prefix openssl)/include -I$(brew --prefix bzip2)/include -I$(brew --prefix readline)/include -I$(xcrun --show-sdk-path)/usr/include" LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix readline)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix bzip2)/lib" pyenv install --patch 3.8.2 < <(curl -sSL https://github.com/python/cpython/commit/8ea6353.patch\?full_index\=1)
    pyenv global 2.7.18 3.8.2
    pip isntall ipython
    pip3 isntall ipython
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
    git clone --depth=1 git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    chsh -s /bin/zsh

    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone --depth=1 git@github.com:skywind3000/z.lua.git ~/code/tools/z.lua
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
