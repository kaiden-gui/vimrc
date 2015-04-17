" 定义快捷键的前缀，即<Leader>
let mapleader=","
"开启语法高亮
syntax on
"显示当前的行号列号：
set ruler
"在状态栏显示正在输入的命令
set showcmd
 
"关闭/打开配对括号高亮
"NoMatchParen
let loaded_matchparen = 1 
"显示行号：
set number
"为方便复制，用<F2>开启/关闭行号显示:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
set modeline
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
" 高亮显示搜索结果
set hlsearch
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4"

set rtp+=~/.vim/bundle/vundle/ 
call vundle#rc()

Bundle 'gmarik/vundle' 
"目录树显示插件
Bundle 'The-NERD-tree'   
Bundle 'jistr/vim-nerdtree-tabs'
"快速注释插件             
Bundle 'The-NERD-Commenter'    
"文件查找插件    
Bundle 'ctrlp.vim'          
"自动添加匹配的右括号 
Bundle 'AutoClose'      
"目前最好用的自动补全插件              
"Bundle 'Valloric/YouCompleteMe'
"代码片段自动生成插件     
Bundle 'honza/vim-snippets' 
"快速跳转/查找字符插件           
Bundle 'Lokaltog/vim-easymotion'    

" NERDTree config
""map <F3> :NERDTreeToggle<CR>
map <F3> :NERDTreeTabsToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")&&b:NERDTreeType == "primary") | q | endif"
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd w
let g:nerdtree_tabs_open_on_console_startup=1

