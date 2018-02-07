" Bundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"主题
Plugin 'morhetz/gruvbox' 

"文件管理器
Plugin 'scrooloose/nerdtree'

"美化
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"代码检查
Plugin 'w0rp/ale'
"代码补全
Bundle 'davidhalter/jedi-vim'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'MarcWeber/vim-addon-mw-utils'

call vundle#end()
filetype plugin indent on

" 设置缩进
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cindent
filetype indent on

"杂项
set mouse=
set shortmess=atI
set go-=T
exec "language zh_CN.utf8"
set guifont=Monospace

"外观
syntax enable
set fileformat=unix
set encoding=utf-8
set number
set t_Co=256
set showcmd
set splitbelow
set splitright
set cuc
set cul

"搜索
set ignorecase
set hlsearch

"代码折叠
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"选择主题
colorscheme gruvbox
set background=dark

" airline插件设定
let g:airline#extensions#ale#enabled = 1
set laststatus=2
"一键运行
map<F5> :!time python3 % <CR>

"自动插入头注释
autocmd BufNewFile *.c,*.py,*.sh exec ":call SetComment()"

func SetComment()
    if expand("%:e") == 'py'
        call setline(1, "#!/usr/bin/env python3")
    elseif expand("%:e") == 'bash'
        call setline(1, '#!/bin/bash')
    endif
endfunc

"设置Nerdtree快捷键
map <F3> :NERDTreeToggle<CR>
