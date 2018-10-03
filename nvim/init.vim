" =====================
" ==     dein        ==
" =====================

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

" 新しく入れたプラグインがあれば自動でインストール
if dein#check_install()
  call dein#install()
endif


" =====================
" ==      設定       ==
" =====================

set encoding=utf-8
set fileencoding=utf-8
set ambiwidth=double

" 行数を表示
set number
" クリップボードの共有
set clipboard+=unnamed
" 現在の行を強調, ハイライト化
set cursorline
" インクリメンタルサーチ
set incsearch
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
" 保存するコマンド履歴の数
set history=5000


" =====================
" ==   map settgin   ==
" =====================

" Insert mode
inoremap <silent> jj <ESC>

" ウィンドウ分割系
noremap <C-j> :split<CR>
noremap <C-k>j <C-w>j
noremap <C-k>k <C-w>k
noremap <C-k>h <C-w>h
noremap <C-k>l <C-w>l

" ウィンドウ移動系
noremap sj <C-w>j
noremap sk <C-w>k
noremap sh <C-w>h
noremap sl <C-w>l

