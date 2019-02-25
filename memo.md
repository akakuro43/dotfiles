## neovim を インストール
```
brew install neovim
```

## dein.vim install
```
sh ~/dotfiles/installer.sh ./.vim/bundles
```

## 設定ファイルのシンボリックリンクを作成
```
mkdir ~/.config
mkdir ~/.config/nvim
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/nvim/dein.toml ~/.config/nvim/dein.toml
ln -s ~/dotfiles/nvim/dein_lazy.toml ~/.config/nvim/dein_lazy.toml
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

## fish のシンボリックリンク
```
ln -s ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
```

## zsh
```
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
```

*use*
[Prezto - Github](https://github.com/sorin-ionescu/prezto)

add modules
  'syntax-highlighting' \
  'autosuggestions' \

use prompt
  pure

