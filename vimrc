""显示行号
set nu

" imap <C-i> <Esc>
inoremap <C-l> <Esc>


"启动时隐去援助提示
"set shortmess=atI

"语法高亮
syntax on

"使用vim的键盘模式
set nocompatible

" 不需要备份
set nobackup

 " 基于缩进或语法进行代码折叠
set fdm=manual "折叠代码"
" set foldmethod=indent
" 设置键盘映射，通过空格设置折叠
" nnoremap <space> @=((foldclosed(line('.')<0)?'zc':'zo'))<CR>
" set foldmethod=syntax
 " 启动 vim 时关闭折叠代码
" set nofoldenable

" 允许用退格键删除字符
set backspace=indent,eol,start

"编码设置
set encoding=utf-8

"共享剪切板
set clipboard=unnamed
"自动对齐
set autoindent
"c文件自动缩进
set cindent
set pastetoggle=<F10>

" 配色方案
syntax enable
" set background=light
set background=dark

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2

" 禁止折行
"set nowrap

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

syntax keyword cppSTLtype initializer_list

"自动执行
map <F5> :call CompilerunGcc()<CR>
func! CompilerunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc --std=c++11 % -o %<"
        echo "----------------------"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ --std=c++11 % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!clear"
        exec "!time python %"
    endif
endfunc


"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"PEP8
au BufNewFile,BufRead *.py
\ set fileformat=unix
" \ set textwidth=79 |

"没有保存或文件只读时弹出确认
set confirm

"鼠标可用
set mouse=a
"tab缩进
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
"文件自动检测外部更改
set autoread
"智能缩进
" set smartindent

"高亮查找匹配
set hlsearch

"显示匹配
set showmatch

"显示标尺，就是在右下角显示光标位置
set ruler

"去除vi的一致性
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""
"不要闪烁
set novisualbell

"启动显示状态行
set laststatus=2

"用浅色高亮当前行 列
set cursorcolumn
set cursorline
"显示输入的命令
set showcmd

"被分割窗口之间显示空白
set fillchars=vert:/
set fillchars=stl:/
set fillchars=stlnc:/

" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'ctags.vim'
Plugin 'VundleVim/Vundle.vim'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
" Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
"打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"设置切换Buffer快捷键"
nmap <C-h> :bn<CR>
" nmap <C-k> :bp<CR>
" 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Raimondi/delimitMate'
"实现输入花括号回车一下就完成
"{
"   tab
"}
"这种效果
let delimitMate_expand_cr=1
Plugin 'scrooloose/nerdtree'
"加入:lclose<CR>是因为有时候syntax总是提示头文件找不到，会打开一个窗口，每次开关导航栏时就会再次打开，加上这句就不会了
nnoremap <F2> :NERDTreeToggle<CR> :lclose<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeShowBookmarks=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=20
Plugin 'vim-scripts/indentpython.vim'
"---------------------------------------------------------
" Plugin 'davidhalter/jedi-vim'
"
"-----********************************----------------------------------------------------
Bundle 'tpope/vim-surround'
"ds+括号类型  删除括号
"cs+原括号+要替换的括号 替换括号
"ysiw( 添加括号
"yss( 整行添加括号
"   
"---------------------------------------------------------
" 标签导航
Bundle 'Tagbar'
"F3 open winndow
"加入:lclose<CR>是因为有时候syntax总是提示头文件找不到，会打开一个窗口，每次开关导航栏时就会再次打开，加上这句就不会了
nnoremap <silent> <F3> :TagbarToggle<CR> :lclose<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus=1
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_width=50
let g:tagbar_indent = 1
"--ctags setting--
"" 按下F9重新生成tag文件，并更新taglist
" map <F10> :<ESC>g<C-]> 
map <F9> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> 
imap <F9> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> 
"add current directory's generated tags file
set tags=tags;
set autochdir
"
"---------------------------------------------------------
"for cmake
Bundle 'pboettch/vim-cmake-syntax'

"自动注释用的一个插件 选中要注释的代码,敲击gcc即可
"使用方法
"gcc 注释当前行，普通模式下
"gc  可是模式下，注释当前选中的部分
"gcu 撤销上一次注释的部分，可以是一行或者多行
"gcgc 撤销注释当前行和临近的上下两行
Bundle 'tpope/vim-commentary'
"---------------------------------------------------------
"---------------------------------------------------------
Plugin 'easymotion/vim-easymotion'
let g:EasyMotion_leader_key='\'
let g:EasyMotion_startofline=0 "keep cursor column when JK motion
map <leader><leader>. <Plug>(easymotion-repeat)
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>F <Plug>(easymotion-overwin-f)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>W <Plug>(easymotion-overwin-w)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout
"---------------------------------------------------------
Plugin 'vim-syntastic/syntastic'
"syntastic
""设置error和warning的标志
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='►'
"总是打开Location List（相当于QuickFix）窗口，如果你发现syntastic因为与其他插件冲突而经常崩溃，将下面选项置0
let g:syntastic_always_populate_loc_list = 2
""自动打开Locaton List，默认值为2，表示发现错误时不自动打开，当修正以后没有再发现错误时自动关闭，置1表示自动打开自动关闭，0表示关闭自动打开和自动关闭，3表示自动打开，但不自动关闭
let g:syntastic_auto_loc_list = 1
"修改Locaton List窗口高度
let g:syntastic_loc_list_height = 5
""打开文件时自动进行检查
let g:syntastic_check_on_open = 0
"自动跳转到发现的第一个错误或警告处 0 off, 1 on
let g:syntastic_auto_jump = 0
""进行实时检查，如果觉得卡顿，将下面的选项置为1
let g:syntastic_check_on_wq = 0
"高亮错误
let g:syntastic_enable_highlighting=1
""让syntastic支æC++11
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
"设置pyflakes为默认的python语法检查工具
let g:syntastic_python_checkers = ['pyflakes']
""修复syntastic使用:lnext和:lprev出现的跳转问题，同时修改键盘映射使用sn和sp进行跳转
function! <SID>LocationPrevious()                       
    try                                                   
        lprev                                               
    catch /^Vim\%((\a\+)\)\=:E553/                        
        llast                                               
    endtry                                                
endfunction                                             
function! <SID>LocationNext()                           
    try                                                   
        lnext                                               
    catch /^Vim\%((\a\+)\)\=:E553/                        
        lfirst                                              
    endtry                                                
endfunction                                             
nnoremap <silent> <Plug>LocationPrevious    :<C-u>exe 'call <SID>LocationPrevious()'<CR>                                        
nnoremap <silent> <Plug>LocationNext        :<C-u>exe 'call <SID>LocationNext()'<CR>
nmap <silent> sp    <Plug>LocationPrevious              
nmap <silent> sn    <Plug>LocationNext
" nmap <F8> :lclose<CR>:close<CR>
nmap <F8> :lclose<CR>
"关闭syntastic语法检查, 鼠标复制代码时用到, 防止把错误标志给复制了
nnoremap <silent> <Leader>ec :SyntasticToggleMode<CR>
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*


"---------------------------------------------------------
"添加代码块插件
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

"TODO list plugin
Plugin 'mileszs/ack.vim'
"vim 和tmux buffer共享
" Plugin 'tmux-plugins/vim-tmux-focus-events'
" Plugin 'roxma/vim-tmux-clipboard'


"头文件源文件切换
":A head source change
":AS 分隔窗口后切换（上下， AV为左右）
":IH切换当前光标所在文件，将光标所在处单词座位文件名打开
Plugin 'a.vim'
"在 header source之间来回切换
nmap <F7> :A<CR>
":IH切换当前光标所在文件，将光标所在处单词座位文件名打开
nmap <C-^> :IH<CR> 

Plugin 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
        \ ['darkgreen',   'firebrick3'],
        \ ['brown',       'RoyalBlue3'],
        \ ['lightblue',    'SeaGreen3'],
        \ ['darkgray',    'DarkOrchid3'],
        \ ['darkcyan',    'RoyalBlue3'],
        \ ['darkred',     'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['brown',       'firebrick3'],
        \ ['gray',        'RoyalBlue3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['lightblue',    'firebrick3'],
        \ ['darkgreen',   'RoyalBlue3'],
        \ ['darkcyan',    'SeaGreen3'],
        \ ['darkred',     'DarkOrchid3'],
        \ ['red',         'firebrick3'],
        \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces                


" 插件列表结束
call vundle#end()
filetype plugin indent on
colorscheme molokai
" colorscheme blue
" colorscheme phd


if executable('ag')
    let g:ackprg='ag --vimgrep'
endif
"自定义命令Todo Debug 用于查看TODO FIXME NOTE等内容
command Todo Ack! 'TODO|FIXME|CHANGED|BUG|HACK'
command Debug Ack! 'NOTE|INFO|IDEA'

if exists('$TMUX')
      set term=screen-256color
endif
vmap <silent> <C-c> y:call system("> /tmp/theClipboardWithouX", getreg("\""))<CR>
map <silent> <C-p> :call setreg("\"", system("< /tmp/theClipboardWithouX"))<CR>p



