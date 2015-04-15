"开启语法高亮
syntax on
"依文件类型设置自动缩进
filetype indent plugin on
 
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
"为深色背景调整配色
set background=dark

set rtp+=~/.vim/bundle/vundle/ 
call vundle#rc()

Bundle 'gmarik/vundle' 
 "目录树显示插件
Bundle 'The-NERD-tree'   
 "快速注释插件             
Bundle 'The-NERD-Commenter'    
"文件查找插件    
Bundle 'ctrlp.vim'          
"自动添加匹配的右括号 
Bundle 'AutoClose'      
"目前最好用的自动补全插件              
""Bundle 'Valloric/YouCompleteMe'
"代码片段自动生成插件     
Bundle 'honza/vim-snippets' 
"快速跳转/查找字符插件           
Bundle 'Lokaltog/vim-easymotion'    
