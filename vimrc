" The introduction of map, nmap, vmap, omap, map!, imap, cmap

" Firstly,there are five modles in using vim including Normal, Visual, Operator, Insert Only, Command line.
" Now,the explainations of map of keyboard are as follow:
" map: for three models of vim normal, Visual, Operator
" 		nmap: Only for Normal
" 		vmap: Only for Visual
" 		omap: Only for Operator Pending
" 		map!: for Insert Only and Command Line
" 		imap: only for Insert Only
" 		cmap: only for Command Line
"Besides, if you want to cancle the map of one key, you can use the command of 'unmap' combined with 'i', 'n', 'v', 'o', '!', 'c', such as 'iunmap', 'ounmap', for cancling one map of the key and mapclear for cancling all the map.


" imap <C-I> <Esc> "the Esc maps to new key--Ctrl+I

set runtimepath+=~/.vim/Ultisnips
set nocompatible
set backspace=indent,eol,start

set t_Co=256

syntax enable
set background=dark
set cursorline
hi CursorLine cterm=NONE ctermfg=LightBlue ctermbg=Red
set cursorcolumn
hi CursorColumn cterm=NONE ctermfg=White ctermbg=Grey          

set fdm=manual


set ruler
set nu
set showcmd

set history=1000
set nobackup
set noswapfile

set showmatch

set autoindent
set cindent

syntax enable
syntax on

set t_Co=256
set ignorecase

" set smarttab
set tabstop=4   
set softtabstop=4   
set shiftwidth=4   
set noexpandtab   
"粘贴是不置换剪贴板
xnoremap p pgvy

set encoding=utf-8
" set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'c.vim'

Bundle 'tpope/vim-fugitive'

"快速移动插件
Bundle 'Lokaltog/vim-easymotion'

" let g:EasyMotion_off_screen_search=0
let g:EasyMotion_leader_key='\'
let g:EasyMotion_startofline=0 "keep cursor column when JK motion
map <Leader><leader>j <Plug>(easymotion-j)
map <Leader><leader>k <Plug>(easymotion-k)
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <leader><leader>. <Plug>(easymotion-repeat)
nmap / <Plug>(easymotion-sn)
nmap n <Plug>(easymotion-next)
nmap N <Plug>(easymotion-prev)

"自动注释用的一个插件 选中要注释的代码,敲击gcc即可
"使用方法
"gcc 注释当前行，普通模式下
"gc  可是模式下，注释当前选中的部分
"gcu 撤销上一次注释的部分，可以是一行或者多行
"gcgc 撤销注释当前行和临近的上下两行
Bundle 'tpope/vim-commentary'

"代码自动补全
" Plugin 'Valloric/YouCompleteMe'
" let mapleader = ","  "这个leader就映射为逗号 ,

" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'  " 配置默认的ycm_extra_conf.py
" nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>   “按,jd 会跳转到定义
" let g:ycm_confirm_extra_conf=0 "打开vim时不再询问是否加载ycm_extra_conf.py配置
" let g:ycm_collect_identifiers_from_tag_files = 1 "使用ctags生成的tags文件"


Plugin 'AutoComplPop'

Plugin 'OmniCppComplete'
set completeopt=menu,menuone  
let OmniCpp_MayCompleteDot=1    " 打开  . 操作符
let OmniCpp_MayCompleteArrow=1  "打开 -> 操作符
let OmniCpp_MayCompleteScope=1  "打开 :: 操作符
let OmniCpp_NamespaceSearch=1   "打开命名空间
let OmniCpp_GlobalScopeSearch=1  
let OmniCpp_DefaultNamespace=["std"]  
let OmniCpp_ShowPrototypeInAbbr=1 "打开显示函数原型
let OmniCpp_SelectFirstItem=1	"自动弹出跳至第一个

Plugin 'ctags.vim'





" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'

Bundle 'The-NERD-tree'
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeShowBookmarks=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=20
map <F2> :NERDTreeToggle<CR>

Bundle 'scrooloose/syntastic'

highlight SyntasticError guibg=#2f0000
 """"""""""syntastic""""""""""""
let g:syntastic_check_on_open=1
let g:syntastic_cpp_include_dirs=['/usr/include/']
let g:syntastic_cpp_remove_include_errors=1
let g:syntastic_cpp_check_header=1
let g:syntastic_cpp_compiler='clang++'
let g:syntastic_cpp_compiler_options='-std=c++11 -stdlib=libstdc++'
"设置pyflakes为默认的python语法检查工具
let g:syntastic_python_checkers = ['pyflakes']

let g:syntastic_loc_list_height = 5

"set error or warning signs
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
"whether to show balloons
let g:syntastic_enable_balloons=1

"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_wq=0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" 标签导航
Plugin 'Tagbar'
nmap <F3>	:TagbarToggle<CR>	" F3 打开tagbar窗口
let g:tagbar_autofocus=1
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=20
autocmd BufReadPost *.c,*.cpp,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()


Plugin 'Solarized'
colorscheme solarized

Plugin 'SirVer/UltiSnips'
Plugin 'honza/vim-snippets'

set ft=cuda.cpp
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsListSnippets="<C-Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" non github repos
Bundle 'git://git.wincent.com/command-t.git'


" 'for code alignment
Bundle 'godlygeek/tabular'
" 'b                 按=号对齐代码 [Tabular插件]
nmap <leader>bb :Tab /=<CR>
" 'n                 自定义对齐    [Tabular插件]
nmap <leader>bn :Tab 


"PowerLine插件 状态栏增强展示
Bundle 'Lokaltog/vim-powerline'
"vim有一个状态栏 加上powline则有两个状态栏
set laststatus=2
set t_Co=256
let g:Powline_symbols='fancy'

filetype plugin indent on     " required!
" inoremap ( ()<ESC>i
" inoremap [ []<ESC>i
" inoremap { {}<ESC>i
" inoremap < <><ESC>i
" inoremap " ""<Esc>i

"--ctags setting--
" 按下F5重新生成tag文件，并更新taglist
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags
set tags+=./tags "add current directory's generated tags file


"2017.10.23
"for cmake
Plugin 'pboettch/vim-cmake-syntax'

"for quick mark and jump
Bundle "kshenoy/vim-signature"

"for multipule mouse
Bundle "terryma/vim-multiple-cursors"
let g:multi_cursors_use_default_mapping=0
"Default mapping
let g:multi_cursors_next_key='<C-m>'
let g:multi_cursors_prev_key='<C-p>'
let g:multi_cursors_skip_key='<C-x>'
let g:multi_cursors_quit_key='<Esc>'

"for easy-alig 
Bundle 'junegunn/vim-easy-align'
"ga= 对齐等号表达
"ga: 对齐冒号表达式
"默认左对齐
"ga<space> 首个空格对齐
"ga2<space> 第二个空格对齐
"ga-2<space> 倒数第二个空格对齐
"ga*<space> 所有空格依次对齐
"
"右对齐
"ga<Enter>*<space>
"ga-<space> 
"ga-<space> 
vmap ga <Plug>(EasyAlign)"vmap 表示在visual模式下的映射
nmap ga <Plug>(EasyAlign)"namp 表示在normal模式的映射
if !exists('g:easy_align_delimiters')
	  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }

"for auto match parentheses with rainbow
Bundle 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" 不加入这行, 防止黑色括号出现, 很难识别
" " \ ['black',       'SeaGreen3'],
"
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

if exists('$TMUX')
	set term=screen-256color
endif
