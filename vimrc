" -------------  Vim configuration   ------------------------------
"定义快捷键的前缀，即<Leader>
let mapleader=","
"开启语法高亮功能
syntax enable
"允许用指定语法高亮配色方案替换默认方案
syntax on
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 自适应不同语言的智能缩进
"filetype indent on
"显示当前的行号列号：
set ruler
"在状态栏显示正在输入的命令
set showcmd
"显示行号：
set number
" 高亮显示当前行/列
set cursorline
"定义快速跳屏:
nmap <leader>h <C-w>h
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k
nmap <leader>l <C-w>l
"为方便复制，用<F2>开启/关闭行号显示:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
set modeline
"开启实时搜索功能
set incsearch
"搜索时大小写不敏感
set ignorecase
"关闭兼容模式
set nocompatible
"vim 自身命令行模式智能补全
set wildmenu
" 高亮显示搜索结果
set hlsearch
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 基于缩进或语法进行代码折叠
set foldmethod=indent
"set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable"

set rtp+=~/.vim/bundle/vundle/ 
call vundle#rc()

"----------------   Bundle plugin        --------------------------
Bundle 'gmarik/vundle' 
"目录树显示插件
Bundle 'The-NERD-tree'   
"快速注释插件             
Bundle 'The-NERD-Commenter'    
"文件查找插件    
Bundle 'ctrlp.vim'          
"自动添加匹配的右括号 
Bundle 'AutoClose'      
"代码片段自动生成插件     
Bundle 'honza/vim-snippets' 
"快速跳转/查找字符插件           
Bundle 'Lokaltog/vim-easymotion'    
"tag列表
Bundle 'taglist.vim'
"jedi python 自动不全，python 必须安装 jedi模块
Bundle 'davidhalter/jedi-vim'
"Supertab"
Bundle 'ervandew/supertab'
"code check, conbine flake with pep8
Bundle 'nvie/vim-flake8'
"buffer
Bundle 'fholgado/minibufexpl.vim'

"-----------------  Bundle plugin configuration -----------------------
" NERDTree config
map <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")&&b:NERDTreeType == "primary") | q | endif"
autocmd vimenter * NERDTree
" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）"
"let NERDTreeWinPos="right"
"设置光标在启动时在文件里
autocmd VimEnter * wincmd p
" 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1
" Mirror tree position for every buffer
autocmd BufEnter * NERDTreeMirror
" Set current dir to vim cwd
set autochdir
let NERDTreeChDirMode=2
let g:nerdtree_tabs_open_on_console_startup=1

"taglist configuration"
nnoremap <silent> <F4> :TlistToggle<CR> 
autocmd vimenter * TlistToggle
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File = 1  
"如果taglist窗口是最后一个窗口，则退出vim          
let Tlist_Exit_OnlyWindow = 1
"在右侧窗口中显示taglist窗口          
let Tlist_Use_Right_Window = 1 

" If only 2 windows left, NERDTree and Tag_List, close vim or current tab
fun! NoExcitingBuffersLeft()
    if winnr("$") == 3
    let w1 = bufname(winbufnr(1))
    let w2 = bufname(winbufnr(2))
    let w3 = bufname(winbufnr(3))
    if (exists(":NERDTree")) && (w1 == "__Tag_List__" || w2 == "__Tag_List__" || w3 == "__Tag_List__")
      if tabpagenr("$") == 1
        exec 'qa'
      else
        exec 'tabclose'
      endif
    endif
  endif
endfun
autocmd BufWinLeave * call NoExcitingBuffersLeft()

"configure jedi default using with supertab
let g:SuperTabDefaultCompletionType = "context"

"buffer configure
let g:miniBufExplMapCTabSwitchBufs = 1
