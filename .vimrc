" 定义快捷键前缀，即<Leader> 对数字无效
let mapleader=";"

" ===================== 教学 =====================
" == 快捷键 map ==
" n/i/c   nore    map    <silent>        src-cmd    dst-cmd
" mode    非递归  映射   不显示提示信息

" <CR>     carriage-return 回车
" <ESC>    esc
" <C-w>    Ctrl + w 可跟大写
" <Space>  space
" <Leader> mapleader

" ===================== 插件管理 =====================
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 窗口调整大小动画
Plug 'camspiers/animate.vim'
" 窗口自动适应大小
Plug 'camspiers/lens.vim'

" 在左侧查看git提交差异
Plug 'airblade/vim-gitgutter'

" 左边文件窗口
Plug 'preservim/nerdtree'

" 代码对齐
Plug 'godlygeek/tabular'

" 快捷键注释 行:gcc  块: gc
Plug 'tpope/vim-commentary'

" 快捷键使用ack，前提是已经安装ack
Plug 'mileszs/ack.vim'

" 帮助项目生成 .ycm_extra_conf.py，支持make cmake qmake autotools
" Plug 'rdnetto/YCM-Generator'

" taglist  ;m 显示tags
Plug 'preservim/tagbar'

" 最强语法提示插件  sh ycm_install.sh
Plug 'ryanmoon-s/YouCompleteMe'

" 在头/源文件之间快速跳转
Plug 'vim-scripts/a.vim'

" TODO blame

call plug#end()

""""""""""""" NERD """""""""""""
" 为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q |
" 打开文件自动关闭
let NERDTreeQuitOnOpen=1
" 子窗口位置
let NERDTreeWinPos="left"
" 忽略的文件
let NERDTreeIgnore=['\.vim$', '\~$', '\.o$', '\.d$', '\.a$', '\.out$', '\.tgz$']
" 打开快捷键
nnoremap <silent> <Leader>n :NERDTreeToggle <CR>

""""""""""""" airline """""""""""""
 "永远显示状态栏
set laststatus=2
 "选择主题
let g:airline_theme='violet'

" tableline (buffer)
let g:airline#extensions#tabline#enabled = 1           " 是否打开tabline
let g:airline#extensions#tabline#buffer_idx_mode = 1   " 切换模式
nmap [ <Plug>AirlineSelectPrevTab  " 前一个tab 只可nmap 不可nnoremap
nmap ] <Plug>AirlineSelectNextTab  " 后一个tab
let g:airline#extensions#tabline#left_sep = ''        " 分隔符
let g:airline#extensions#tabline#left_alt_sep = '➤'

" symbol
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '▌'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '  ｢'
let g:airline_symbols.maxlinenr = '｣'
let g:airline_symbols.colnr = '   ❤ '
let g:airline_symbols.paste = '[paste]'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.branch = '⎇'''

" [23]trailing 表示23行 末尾的文字后面有尾随的空格

""""""""""""" gitgutter """""""""""""
" 更新间隔
set updatetime=100
" 标志符号
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_modified_removed = '#'
" 进入自动显示
autocmd BufEnter * GitGutter
autocmd VimEnter * GitGutter
" 改动 块间 跳转
nnoremap 'k <Plug>(GitGutterPrevHunk)
nnoremap 'j <Plug>(GitGutterNextHunk)

""""""""""""" ack """""""""""""
" 高亮搜索关键词
let g:ackhighlight = 1
" 修改快速预览窗口高度为15
let g:ack_qhandler = "botright copen 15"


""""""""""""" tabular """""""""""""
" tabular 对齐插件
" nnoremap <Leader>v :Tabularize /

" ===================== VIM配置 =====================
" 主题 ~/.vim/color
colorscheme onedark

""""""""""""" 代码折叠 """""""""""""
" 基于语法高亮
set foldmethod=syntax
" 启动vim时打开所有折叠代码。
set nofen
" zc 折叠
" zC 对范围内的所有嵌套折叠
" zo 展开
" zO 对范围内的所有折叠展开
" zj 向下移动，到下一个折叠的开始处，关闭的折叠也计入
" zk 向上移动，到下一个折叠的结束处，关闭的折叠也计入

""""""""""""" other """""""""""""
" 点亮光标所在前行
set cursorline
" 插件高度 main for ycm
set pumheight=25
" 退格可以删除：自动缩进、跨行、之前插入的
set backspace=indent,eol,start
" o O <CR> 时复制上一行的缩进格式
set autoindent
" c-style indent
set cindent
set cinoptions=g-1
" 不产生交换文件
set nobackup
" 行号 :no nu 取消
set number
" 命令保存的条数
set history=50
" 显示鼠标位置
set ruler
" 显示未完成的命令
set showcmd
" 增量搜索 increase search 边输入边搜索
set incsearch
"设置非兼容vi模式
set nocompatible
" 不产生.swp文件
set noswapfile
" <Table> 长度
set tabstop=4
" 缩进偏移量
set shiftwidth=4
" 智能缩进
set smartindent
" 显示匹配的括号
set showmatch
" 把<Table>替换成等量的空格
set expandtab
" 指定何时启动选择模式，而不是可视模式
set selectmode=mouse,key
" 选择模式
set selection=exclusive
" 搜索时大小写不敏感
set ignorecase "设置默认大小写不敏感查找
set smartcase "如果有大小写字母，则切换到大小写敏感查找
" tags搜索路径
set tags=./.tags;,.tags "在每个目录下如果找不到tags就到上一层目录去找
" 编码
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" set modeline
set modeline
" 搜索关键词高亮
set hlsearch
" 开启语义分析
syntax enable
" 语法高亮
syntax on
" 不显示打开文件时的提示
set shortmess=atI
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 根据侦测到的不同类型采用不同的缩进格式
filetype indent on

" ===================== map(快捷键) =====================
" 实用快捷键记忆
"
" U 将当前行恢复至开始编辑前的样子 只缓存当前行 u撤销是上次操作可无限u
" D 删除至行尾
" I 行首插入
" A 行尾插入
" s 删除并插入
" f + x 行内查找字符x 直接跳转
" H 跳到当前屏幕左上角
" L 跳到当前屏幕左下角
" M 跳到当前屏幕中间行
" K 跳到 当前位置的单词 的help
" X 退格 不断删除光标左边的符号 x是删除光标上的符号
" c cc和dd类似 但不会将光标移到下一行 而是在当前行合适的缩进位置 进入插入模式
" C 和D类似 但删除后 会进入插入模式
" V 行 可视模式
" w 后一单词 b 前一单词 e 词尾
"
" y: yy nyy ygg yG yw y0 y$
" 剪切 复制 [可以] -->  左接数字 || 右接跳转
" 只能左接数字 s x
" 可以右接跳转 y d c

" 禁用快捷键 需要shift+ 才能按出的
nnoremap R <nop>
nnoremap Q <nop>
nnoremap T <nop>
nnoremap S <nop>
nnoremap F <nop>
nnoremap J <nop>
nnoremap Z <nop>
nnoremap B <nop>
nnoremap E <nop>
nnoremap W <nop>
nnoremap ~ <nop>
nnoremap ! <nop>
nnoremap @ <nop>
nnoremap ^ <nop>
nnoremap & <nop>
nnoremap ( <nop>
nnoremap ) <nop>
nnoremap _ <nop>
nnoremap # <nop>
nnoremap ? <nop>
" 还可以用来组合其它快捷键 直接按出的
nnoremap t <nop>
nnoremap m <nop>
nnoremap q <nop>
nnoremap " <nop>
nnoremap \ <nop>
nnoremap , <nop>
nnoremap . <nop>
nnoremap ` <nop>

" Ack搜索 不自动打开第一个文件
nnoremap <Leader>fw :Ack! <Space>
" AckFile搜索 不自动打开第一个文件
nnoremap <Leader>ff :AckFile!<Space>
" 关闭当前窗口
nnoremap <Leader>q :q<CR>
" 保存
nnoremap <Leader>w :w<CR>
" 不保存强制退出
nnoremap <Leader>Q :q!<CR>
" 跳转到光标所在关键词的定义处
nnoremap <Leader>gt g<C-]>
" 跳回原关键词 与 ;gt 合使用
nnoremap <Leader>gr <C-T>
" 快速切换头/源文件 需要a.vim插件支持
nnoremap <Leader>a :A <CR>
" 去除搜索高亮
nnoremap <Leader>b :noh<CR>
" 打开文件
nnoremap <Leader>e :e<Space>
" 打ctag
nnoremap <leader>tg :!ctags -R --fields=+aS --extra=+q<CR>
" 行尾
nnoremap e $
" 括号匹配
" nnoremap 1 %
" source .vimrc
nnoremap <Leader>s :source ~/.vimrc <CR>

" taglist 查看符号列表
nnoremap <Leader>m :TagbarToggle <CR>

" 输入括号时 括号匹配 ESC光标会向前移一格
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i

" 使用ctrl c,v实现vim之间的复制粘贴 非mac os实用
vnoremap <C-c> :w! ~/tmp/clipboard.txt <CR>
inoremap <C-v> <Esc>:r ~/tmp/clipboard.txt <CR>

""""""""""""" 窗口 """""""""""""
" 大小调整
" 1变低 2变高 3变窄 4变宽
nnoremap <Leader>1 <ESC><C-W>15-
nnoremap <Leader>2 <ESC><C-W>15+
nnoremap <Leader>3 <ESC><C-W>15<
nnoremap <Leader>4 <ESC><C-W>15>

" 移动
" h左 l右 k上 j下
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>l <C-W><C-L>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>j <C-W><C-J>

" 交换 依次向后
nnoremap <Leader>r <ESC><C-W>r

" 翻页
nnoremap 'f <C-f>
nnoremap 'b <C-b>
nnoremap 'u <C-u>
nnoremap 'd <C-d>

" ===================== YCM =====================
" 全局文件配置
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
" 开启实时错误或者warning的检测
let g:ycm_show_diagnostics_ui = 1
" 关闭补全预览
let g:ycm_add_preview_to_completeopt = 0
" 允许vim加载.ycm_extra_conf.py文件，不再提示
let g:ycm_confirm_extra_conf = 0
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.','re![_a-zA-z0-9]'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
" error标记
let g:ycm_error_symbol = '✗'
" warning标记
let g:ycm_warning_symbol = '⚠'
" 颜色
highlight YcmErrorLine guibg=#333333
highlight YcmWarningLine guibg=#008B8B

" ===================== autocmd =====================
" 花括号自动格式化，首行一个tab
autocmd FileType cpp,java inoremap { {<CR>}<ESC>kA<CR>

" 注释针对不同语言的注释方法 需要vim-commentary插件支持
autocmd FileType cpp set commentstring=//\ %s
autocmd FileType php set commentstring=//\ %s

" 编译快捷键
autocmd filetype python nnoremap <F1> :w <bar> exec '!python '.shellescape('%')<CR> autocmd filetype c nnoremap <F1> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F1> :w <bar> exec '!g++ --std=c++11 -pthread '.shellescape('%').' -o ./bin/'.shellescape('%:r').' && ./bin/'.shellescape('%:r')<CR>
autocmd filetype dot nnoremap <F1> :w <bar> exec '!dot -Tsvg sqlparse.dot > sqlparse.svg'<CR>

" 进入窗口高亮 todo TODO
augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('todo', 'TODO', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('todo', 'todo', -1)
augroup END

" ===================== function =====================

" 当前位置 插入 时间
nnoremap tm :call SetTime() <CR> 0
func SetTime()
        call append(line("."), "\# ".strftime('%c'))
endfunc

" 当前位置 插入 lorem 凑位词
nnoremap lm :call Lorem() <CR> 0
func Lorem()
        call append(line("."), "Lorem ipsum dolor sit amet, consectetur adipisicing elit dolore magna aliqua.")
endfunc

" 自动插入文件头 .cpp .c .h .sh .java .go
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.Java,*.go exec ":call SetTitle()"
func SetTitle()
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."),   "\# File Name:    ".expand("%"))
        call append(line(".")+1, "\# Author:       arashi")
        call append(line(".")+2, "\# mail:         arashi@tencent.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    else
        call setline(1, "/* ************************************************************************")
        call append(line("."),   "> File Name:     ".expand("%"))
        call append(line(".")+1, "> Author:        arashi")
        call append(line(".")+2, "> mail:          arashi@tencent.com")
        call append(line(".")+3, "> Created Time:  ".strftime("%c"))
        call append(line(".")+4, "> Description:   ")
        call append(line(".")+5, " ************************************************************************/")
        call append(line(".")+6, "")
    endif
endfunc

" 新建文件后 自动定位到文件末尾
autocmd BufNewFile * normal G

" ===================== block =====================

" 重新打开文档时光标回到文档关闭前的位置
if has("autocmd")
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
 \ exe "normal g'\"" |
\ endif
endif

" onedark
" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
" (see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  " For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  " Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

