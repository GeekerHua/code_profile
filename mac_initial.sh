
gem sources --add https://gems.ruby-china.com
gem sources -r https://rubygems.org/

git clone --depth=1 git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s /bin/zsh

brew install python2 python3 nvm you-get wget htop docker mycli ffmpeg ccat autojump tig tmux mwget
echo 'export HOMEBREW_NO_AUTO_UPDATE=true' >> ~/.zshrc; source ~/.zshrc

pip isntall ipython
pip3 install ipython thefuck

echo '[ -f /usr/local/etc/profile.d/autojump.sh  ] && . /usr/local/etc/profile.d/autojump.sh' >> .zshrc
echo 'eval $(thefuck --alias)' >> ~/.zshrc 

nvm install node
npm install cnpm -g --registry=https://registry.npm.taobao.org

brew cask install postman ShadowsocksX-NG

source ~/.zshrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
