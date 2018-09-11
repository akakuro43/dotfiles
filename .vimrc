" 文字コードを指定
set encoding=utf-8
scriptencoding utf-8
" 保存時の文字コードを指定
set fileencoding=utf-8

" カラースキーム
colorscheme molokai

syntax on

" 行数を表示
set number
" 現在の行を強調,ハイライト化
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" 括弧入力時の対応する括弧を表示
set showmatch
set matchtime=1

" ターミナルのタイトルをセットする
set title

" 不可視文字を可視化(タブが「▸-」と表示される)
set list
set listchars=tab:»-,trail:.,extends:»,nbsp:%
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" 改行時に前の行の構文をチェックしインデントを増減する
set smartindent

" 検索関連
" インクリメンタルサーチ
set incsearch
" 検索パターンに大文字小文字を判断しない
set ignorecase
" 検索結果をハイライト
set hlsearch

" コマンド補完関連
" コマンドモードの補完
set wildmenu
" 保存するコマンド履歴
set history=5000

" nerdtree のキーマップ
map <C-e> :NERDTreeToggle<CR>

