if &compatible
  set nocompatible
endif

" dein.vimインストール時に指定したディレクトリをセット
let s:dein_dir = expand('~/.vim/bundles')

" dein.vimの実体があるディレクトリをセット
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif


if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " dein.toml, dein_layz.tomlファイルのディレクトリをセット
  let s:toml_dir = expand('~/.config/nvim')

  " 起動時に読み込むプラグイン群
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  " 遅延読み込みしたいプラグイン群
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


" 設定まわり

" NERDTreeToggle のキーマップ
map <C-e> :NERDTreeToggle<CR>

" 行数を表示
set number
" クリップボードの共有
set clipboard=unnamed
" 現在の行を強調, ハイライト化
set cursorline
" 検索結果をハイライト
set hlsearch
" 検索パターンに大文字小文字を判断しない
set ignorecase
" tabで文字数を空白の数
set shiftwidth=2
set tabstop=2
" tab文字を半角スペースに
set expandtab
" 改行時に行の構文をチェックしインデントをよしなに
set smartindent
" 不可視文字を可視化
set list
set listchars=tab:»-,trail:.,extends:»,nbsp:%
" 行末の1文字先までカーソル移動可能に
set virtualedit=onemore
" タイトルをセット
set title

