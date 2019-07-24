set nowrap
" un~ ファイルを生成しない
set noundofile
set nobackup
set list 
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
set cursorline
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=0
set autoindent
set number
set noswapfile
set title
set fenc=utf-8
set ff=unix

set tags=C:/workspace/

if has('gui') || has('xterm_clipboard')
  set clipboard+=unnamed
endif

" timestamp 設定
:nnoremap <F5> "=strftime("%c")<CR>P
:inoremap <F5> <C-R>=strftime("%c")<CR>

" deinパス設定
let s:dein_dir = fnamemodify('~/vim/dein/', ':p') "<-お好きな場所
let s:dein_repo_dir = s:dein_dir . 'repos/github.com/Shougo/dein.vim' "<-固定

" dein.vim本体の存在チェックとインストール
if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' shellescape(s:dein_repo_dir)
endif

" dein.vim本体をランタイムパスに追加
if &runtimepath !~# '/dein.vim'
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

" 必須
call dein#begin(s:dein_dir)
call dein#add('Shougo/neocomplcache')

" Plugins

call dein#add('Shougo/unite.vim')
call dein#add('Shougo/unite-outline')
call dein#add('tpope/vim-fugitive')
call dein#add('idanarye/vim-merginal')
call dein#add('airblade/vim-gitgutter')
call dein#add('tpope/vim-markdown')
call dein#add('kannokanno/previm')
call dein#add('vim-scripts/DirDiff.vim')

" ruby
call dein#add('basyura/unite-rails')
call dein#add('tpope/vim-endwise')

" elixir
call dein#add('elixir-editors/vim-elixir')

" python
" call dein#add('davidhalter/jedi-vim')

call dein#add('Shougo/vimfiler')
call dein#add('tyru/open-browser.vim')

call dein#add('itchyny/lightline.vim')
call dein#add('tomtom/tcomment_vim')

call dein#add('thinca/vim-quickrun')
call dein#add('rhysd/accelerated-jk')
call dein#add('Lokaltog/vim-easymotion')

call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('sjl/badwolf')

" else
call dein#add('twitvim/twitvim')
call dein#add('simeji/winresizer')

" 必須
call dein#end()
filetype plugin indent on
syntax enable

" プラグインのインストール
if dein#check_install()
  call dein#install()
endif

" neobundle 系のキーバインド
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>

nmap s <Plug>(easymotion-s2)
nmap ss <Plug>(easymotion-overwin-f)

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

" for twitvim
let twitvim_browser_cmd = 'C:\Users\hanbe\AppData\Local\Vivaldi\Application\vivaldi.exe' " for Windows
let twitvim_force_ssl = 0
let twitvim_count = 40

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" 読み込んだプラグインも含め、ファイルタイプの検出、ファイルタイプ別プラグイン/インデントを有効化する
filetype plugin indent on

colorscheme desert
"Colorscheme hybrid
