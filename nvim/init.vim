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
" コピペで貼り付けモードになるのを防止
autocmd InsertLeave * set nopaste
" 行末, 行頭から次の行へ移動可能に
set whichwrap+=h,l
" 閉じタグの補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
augroup END

" =====================
" ==      fzf        ==
" =====================
nnoremap <C-p> :FZFFileList<CR>
command! FZFFileList call fzf#run(fzf#wrap({
            \ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store',
            \ 'down': '25%'}))

nnoremap <C-b> :Buffers<CR>

" =====================
" ==   map settgin   ==
" =====================

" Insert mode
inoremap <silent> jj <ESC>

" ウィンドウ分割系
noremap <silent> ss :split<CR>
noremap <silent> sv :vsplit<CR>

" ウィンドウ移動系
noremap sj <C-w>j
noremap sk <C-w>k
noremap sh <C-w>h
noremap sl <C-w>l

" バッファコマンド系
noremap <silent> <C-j> :bprev<CR>
noremap <silent> <C-k> :bnext<CR>

" ハイライト解除
noremap <silent> <Space><Space> :nohl<CR>

" markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a Google\ Chrome'
