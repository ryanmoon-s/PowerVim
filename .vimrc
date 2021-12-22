" ===================== 插件 =====================
" Vundle管理工具
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	""Plugin 'ycm-core/YouCompleteMe'
    Plugin 'camspiers/animate.vim'
    Plugin 'camspiers/lens.vim'
call vundle#end()

" NERD
" 窗口大小
:let g:NERDTreeWinSize=30
" 为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q |
" 打开文件自动关闭
let NERDTreeQuitOnOpen=1

" lens
" 窗口最小 大小
let g:lens#width_resize_min = 150

" ===================== VIM配置 =====================
" 插件高度 ycm
set pumheight=25
" 主题
" colorscheme monokai
colorscheme onedark

"""""""""""""快捷键"""""""""""""

" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" MiniBufExplorer Resize window 15
" ;1 ;2 ;3 ;4
map <Leader>1 <ESC><C-W>15-
map <Leader>2 <ESC><C-W>15+
map <Leader>3 <ESC><C-W>15<
map <Leader>4 <ESC><C-W>15>

" MiniBufExplorer rotate window
map <Leader>r <ESC><C-W>r

" ===================== YCM =====================
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 1    " 开启实时错误或者warning的检测
let g:ycm_add_preview_to_completeopt = 0    " 关闭补全预览
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf = 0
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
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
" 错误标记
let g:ycm_error_symbol = '✗'  "set error or warning signs
" warning标记
let g:ycm_warning_symbol = '⚠'
"颜色
"highlight YcmErrorSign       标记颜色
"highlight YcmWarningSign ctermbg=none
"highlight YcmErrorSection      代码中出错字段颜色
highlight YcmWarningSection ctermbg=none
"highlight YcmErrorLine        出错行颜色
"highlight YcmWarningLine


" ================================================
" 以上为DIY配置
" ================================================


" pathogen plugin manager
execute pathogen#infect()
" syntax on
filetype plugin indent on

"高亮搜索关键词"
let g:ackhighlight = 1
"修改快速预览窗口高度为15
let g:ack_qhandler = "botright copen 15"
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
"set autocmd
set autoindent		" always set autoindenting on 自动缩进
" indent C++ autoindent private public keyword
set cindent
set cinoptions=g-1
"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif
set nobackup        "I hate backup files.
set number
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
"设置非兼容模式
set nocp

"set encoding=utf-8
""set encoding=gb2312
set langmenu=zh_CN.gb2312
language message zh_CN.gb2312

set fileencoding=gbk2312
set ts=4
set sw=4
set smartindent
set showmatch        " Show matching brackets.
set guioptions-=T
set expandtab

let curpwd = getcwd()
" vim自身命令行模式智能补全
set wildmenu

" 不产生.swp文件
set noswapfile

" 禁止光标闪烁
" set gcr=a:block-blinkon0

" ack搜索时不打开第一个搜索文件
map <Leader>fw :Ack! <Space>
" AckFile不打开第一个搜索文件
map <Leader>ff :AckFile!<Space>
" 定义快捷键 关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键
nmap <Leader>w :w<CR>
" 删除光标所在单词
" nmap e daw
" close TAB
nmap tabc :tabc <CR>
" go to previous table
map gp :tabp <CR>
" 定义快捷键 跳转到光标所在关键词的定义处
" here are multiple matches, show me a list of all the matching tags
nmap <Leader>gt g<C-]>
" 定义快捷键 跳回原关键词 与 ;gr 配合使用
nmap <Leader>gr <C-T>
" 向下翻半屏
nmap <Leader>u <C-U>
" 向上翻半屏
nmap <Leader>d <C-D>
" 快速切换C H源文件
nmap <Leader>a :A<CR>

"快速切换到上一个文件
" nmap <Leader>j :bn<CR>
" nmap <Leader>k :bp<CR>

" 设置快捷键gs遍历各分割窗口。快捷键速记法：goto the next spilt window
nnoremap <Leader>gg <C-W><C-W>

" 向左
nnoremap <leader>h <C-W><C-H>
" 向右
nnoremap <leader>l <C-W><C-L>
" 向上
nnoremap <Leader>k <C-W><C-K>
" 向下
nnoremap <Leader>j <C-W><C-J>
" 去除高亮
"nmap <Leader>h :noh<CR>
" 打开文件
nmap <Leader>e :e<Space>
" 不关闭文件推出
nmap <Leader>z <C-Z>
" 水平分隔
" nmap <Leader>s :Sex<CR>
" 竖直分隔
" nmap <Leader>v :Vex<CR>
" 全局替换
" nmap <Leader>r :%s/fileName-/fileName+/g
" align 表格对齐
nmap <Leader>t :Tab /
" 打tag
" --c++-kinds=+p  : Adds prototypes in the database for C/C++ files.
"--fields=+iaS   : Adds inheritance (i), access (a) and function
"                  signatures (S) information.
"--extra=+q      : Adds context to the tag name. Note: Without this
"                  option, the script cannot get class members.
nmap<leader>tg :!ctags -R --fields=+aS --extra=+q<CR>
" java jdk 补全
map! <C-O> <C-X><C-O>
" 使用NERDTree插件查看工程文件。设置快捷键
nnoremap <silent> <Leader>n  :NERDTreeToggle <CR>
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 设置忽略的文件
let NERDTreeIgnore=['\.vim$', '\~$', '\.o$', '\.d$', '\.a$', '\.out$', '\.tgz$']

" 使用TlistToggle查看文件函数列表。设置快捷键：<F12>
nnoremap  <Leader>m  :TlistToggle <CR>
" 粘贴到系统剪切板
map <Leader>y "*y
"禁止自动改变当前Vim窗口的大小
let Tlist_Inc_Winwidth=0
"把方法列表放在屏幕的右侧
let Tlist_Use_Right_Window=1
"让当前不被编辑的文件的方法列表自动折叠起来
let Tlist_File_Fold_Auto_Close=1
" let g:winManagerWindowLayout='FileExplorer'
" 定义快捷键 打开/关闭 winmanger
" nmap wm :WMToggle<cr>
" let g:winManagerWidth=20
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 根据侦测到的不同类型采用不同的缩进格式
filetype indent on

" 取消补全内容以分割子窗口形式出现，只显示补全列表
" set completeopt=longest,menu

"cs add $curpwd/cscope.out $curpwd/
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
set cscopequickfix=s-,c-,d-,i-,t-,e-


" VIM支持多种文本折叠方式，我VIM多用于编码，所以选择符合编程语言语法的代码折叠方式。
" set foldmethod=syntax
" 启动vim时打开所有折叠代码。
set nofen

let cwd=""
set tags=tags
"cs add cscope.out
let g:miniBufExplMapWindowNavArrows = 1
"允许光标在任何位置时用CTRL-TAB遍历buffer
let g:miniBufExplMapCTabSwitchBufs = 1

"设置winmanager窗口宽度
"let g:winManagerWidth = 30

" 重新打开文档时光标回到文档关闭前的位置
if has("autocmd")
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
 \ exe "normal g'\"" |
\ endif
endif


"花括号自动格式化，首行一个tab
autocmd FileType cpp,java inoremap { {<CR>}<ESC>kA<CR>

set fenc=" "
"显示匹配
set showmatch
"括号匹配
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
set selectmode=mouse,key
set selection=exclusive
""set mouse=n "可视模式下使用鼠标，set mouse=a这个命令导致在vim下复制粘贴不好用
set ai "vim中复制粘贴保存格式
set ignorecase "设置默认大小写不敏感查找
set smartcase "如果有大小写字母，则切换到大小写敏感查找
set tags=tags;/ "告诉在每个目录下如果找不到tags就到上一层目录去找
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1


set ruler           " 显示标尺"
autocmd InsertEnter * se cul    " 用浅色高亮当前行"
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示

" vim-commentary style set 注释针对不同语言的注释方法
autocmd FileType cpp set commentstring=//\ %s
autocmd FileType php set commentstring=//\ %s
" set modeline
set modeline
" 搜索关键词高亮
set hlsearch
" 开启语义分析
syntax enable
syntax on
" 使用ctrlc, v就可以实现vim之间的复制粘贴
vnoremap <C-c> :w! ~/tmp/clipboard.txt <CR>
inoremap <C-v> <Esc>:r ~/tmp/clipboard.txt <CR>
" 编译快捷键
autocmd filetype python nnoremap <F1> :w <bar> exec '!python '.shellescape('%')<CR> autocmd filetype c nnoremap <F1> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F1> :w <bar> exec '!g++ --std=c++11 -pthread '.shellescape('%').' -o ./bin/'.shellescape('%:r').' && ./bin/'.shellescape('%:r')<CR>
" autocmd filetype dot nnoremap <F1> :w <bar> exec '!dot -Tsvg '.shellescape('%').' > ./svg/'.shellescape('%:r').' && open ./bin/'.shellescape('%:r')<CR>
autocmd filetype dot nnoremap <F1> :w <bar> exec '!dot -Tsvg sqlparse.dot > sqlparse.svg'<CR>
autocmd Filetype java nnoremap <F1> :w <bar> exec '!javac '.shellescape('%'). ' -d ./bin'<CR>
autocmd filetype java nnoremap <F2> :w <bar> exec '!java -cp ./bin '.shellescape('%:r')<CR>


let g:tlist_markdown_settings = 'markdown;h:Headlins'
"新建.c,.h,.sh,.Java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.Java,*.go exec ":call SetTitle()"
"""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
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
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc


" shortcut for markdown
" 创建时间快捷键for markdown
nmap tm :call SetTime() <CR>
func SetTime()
        call append(line("."), "\# ".strftime('%a %d %b %Y'))
endfunc

nmap tb :call SetTable() <CR>
func SetTable()
        call append(line("."), "\| | | ")
        call append(line(".")+1, "\|---|---|")
        call append(line(".")+2, "\| | |")
endfunc

nmap pc :call SetPic() <CR>
func SetPic()
        call append(line("."), "\<img src='' width=600 alt=''> </img></div>")
endfunc

nmap pi :call SetPic1() <CR>
func SetPic1()
        call append(line("."), "\![]()")
endfunc

nmap vi :call SetVideo() <CR>
func SetVideo()
        call append(line("."), "\<video src='1.mp4' controls='controls' width='640' height='320' autoplay='autoplay'> Your browser does not support the video tag.</video></div>")
endfunc

nmap cl :call SetCollor() <CR>
func SetCollor()
        call append(line("."), "<span  style='color: #f16707;'> </span>")
endfunc

" vim cc
nmap cc :call SetCC() <CR>
func SetCC()
    call append(line("."), "// vim: et tw=100 ts=4 sw=4 cc=120")
endfunc

" Hello，我是PowerVim的作者，程序员Carl，欢迎关注我的微信公众号：代码随想录

" 添加自动补全字典
au FileType php setlocal dict+=~/.vim/dictionary/php_keywords_list.txt
au FileType cpp setlocal dict+=~/.vim/dictionary/cpp_keywords_list.txt
au FileType java setlocal dict+=~/.vim/dictionary/java_keywords_list.txt
" au FileType markdown setlocal dict+=~/.vim/dictionary/words.txt

" for vim-syntastic
" disabled Syntastic by default
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" open/close Syntastic checker
nnoremap <Leader>p :SyntasticToggleMode<CR> :w<CR>
" set vim-syntastic compiler
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" test
" 自动已当前文件为根目录，可能会影响使用:Vex的，我在mac是ok的，但是在centos下:Vex功能错乱了
" set autochdir
autocmd BufEnter * silent! lcd %:p:h
" 需要在哪个目录有类函数补全功能，就加载哪个目录的tags
" set tags+=/Users/XXX/Documents/workplace/brpc/tags
set tags+=/data/arashi/QQMail/wwoutcontactxmq

" complete with no first suggestion
" :set completeopt+=noinsert

set completeopt=menu,menuone
let OmniCpp_MayCompleteDot=1    "  打开  . 操作符
let OmniCpp_MayCompleteArrow=1  " 打开 -> 操作符
let OmniCpp_MayCompleteScope=1  " 打开 :: 操作符
let OmniCpp_NamespaceSearch=1   " 打开命名空间
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DefaultNamespace=["std"]
let OmniCpp_ShowPrototypeInAbbr=1  " 打开显示函数原型
let OmniCpp_SelectFirstItem = 2 " 自动弹出时自动跳至第一个
autocmd BufRead scp://* :set bt=acwrite
" au FileType * setlocal dict+=~/.vim/dictionary/words.txt
autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:JavaComplete_JavaCompiler="/Library/Java/JavaVirtualMachines/jdk-10.0.2.jdk/Contents/Home/bin/javac"
" for JavaComplete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
nmap <Leader>o o<Esc>

:set syntax=markdown
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
" au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
" for me
func MarkdownSet()
    let filePath=expand('%:p')
    exe ':!open ' . filePath '-a "MacDown"'
endfunc

" usage :call GenMarkdownSectionNum    给markdown 文件生成目录编号
function! GenMarkdownSectionNum()
  if &ft != "markdown"
    echohl Error
    echo "filetype is not markdown"
    echohl None
    return
  endif

  let lvl = []
  let sect = []
  let out = ""
  for i in range(1, line('$'), 1)
    let line = getline(i)
    let heading_lvl = strlen(substitute(line, '^\(#*\).*', '\1', ''))
    if heading_lvl < 2
      continue
    endif
    " there should be only 1 H1, topmost, on a conventional web page
    " we should generate section numbers begin with the first heading level 2
    if len(lvl) == 0
      if heading_lvl != 2 " count from level 2
        echohl Error
        echo "subsection must have parent section, ignore illegal heading line at line " . i
        echohl None
        continue
      endif
      call add(sect, 1)
      call add(lvl, heading_lvl)
    else
      if lvl[-1] == heading_lvl
        let sect[-1] = sect[-1] + 1
      elseif lvl[-1] > heading_lvl " pop all lvl less than heading_lvl from tail
        while len(lvl) != 0 && lvl[-1] > heading_lvl
          call remove(lvl, -1)
          call remove(sect, -1)
        endwhile
        let sect[-1] = sect[-1] + 1
      elseif lvl[-1] < heading_lvl
        if heading_lvl - lvl[-1] != 1
          echohl Error
          echo "subsection must have parent section, ignore illegal heading line at line " . i
          echohl None
          continue
        endif
        call add(sect, 1)
        call add(lvl, heading_lvl)
      endif
    endif

    let cur_sect = ""
    for j in sect
      let cur_sect = cur_sect . "." . j
    endfor
    let cur_sect = cur_sect[1:]
    let out = out . " " . cur_sect
    call setline(i, substitute(line, '^\(#\+\) \?\([0-9.]\+ \)\? *\(.*\)', '\1 ' . cur_sect . ' \3', line))
  endfor
  " echo lvl sect out
  echo out
endfunc

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
