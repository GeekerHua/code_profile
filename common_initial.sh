#/usr/bin/bash
init_vim(){
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    # 进入vim，1. 安装：PlugInstall； 2.查看： PlugStatus； 3. 卸载： PlugClean； 4.更新插件：:PlugUpdate
}

init_zsh(){
    git clone --depth=1 git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    chsh -s /bin/zsh
}
