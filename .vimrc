if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/yamamoto/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/yamamoto/.vim/bundles')
  call dein#begin('/home/yamamoto/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('/home/yamamoto/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('itchyny/lightline.vim')
  call dein#add('othree/yajs.vim')
  call dein#add('tpope/vim-fugitive')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"構文ごとに色分けを行う
syntax on
"256color terminal
set t_Co=256
"カラースキーマ
colorscheme xoria256

"バックアップファイルを作るディレクトリ
set backupdir=$HOME/vimbackup
"スワップファイル用のディレクトリ
set directory=$HOME/vimbackup
"Undoファイル用のディレクトリ
set undodir=$HOME/vimbackup

"行番号を表示する
set number
"カーソル行ハイライト
set cursorline
"タブの代わりに空白文字を挿入する
set expandtab
"シフト移動幅
set shiftwidth=4
"ファイル内の <Tab> が対応する空白の数
set tabstop=4
"新しい行のインデントを現在行と同じにする
set autoindent
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

"検索時に大文字を含んでいたら大/小を区別
set ignorecase
set smartcase
"インクリメンタルサーチを行う
set incsearch

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"ステータス行を常に表示
set laststatus=2
"スクロール送り
set scrolloff=10

"マウス連携
set mouse=

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"タブ文字、行末など不可視文字を表示する
"set list
"listで表示される文字のフォーマットを指定する
"set listchars=eol:$,tab:>\ ,extends:<

set backspace=indent,eol,start

"保存時に行末の空白を除去
function! s:remove_eol_spaces()
    let cursor = getpos(".")
    %s/\s\+$//ge
    call setpos(".", cursor)
    unlet cursor
endfunction
autocmd BufWritePre * call <SID>remove_eol_spaces()

"makefileでexpandtabを無効にする
autocmd FileType make setlocal noexpandtab

"netrwの初期状態でツリー表示
let g:netrw_liststyle = 3
"netrwフィルタ定義
let g:netrw_list_hide='\.o$,\.d$,GTAGS,GPATH,GRTAGS,GSYMS'

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" fugitive
nnoremap [fugitive] <Nop>
nmap <space>g [fugitive]
nnoremap <silent> [fugitive]s :Gstatus<CR><C-w>T
nnoremap <silent> [fugitive]a :Gwrite<CR>
nnoremap <silent> [fugitive]c :Gcommit<CR>
nnoremap <silent> [fugitive]b :Gblame<CR>
nnoremap <silent> [fugitive]d :Gdiff<CR>
nnoremap <silent> [fugitive]m :Gmerge<CR>
set diffopt+=vertical

"lightline
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ }

" SuperTab like snippets behavior.
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"yajs.vim
autocmd BufRead, BufNewFile *.es6 setfiletype javascript

