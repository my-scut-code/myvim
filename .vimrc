"*******************************************
"help 文档设置
"*******************************************
set helplang=cn
set encoding=utf8

"*******************************************
"高亮设置
"*******************************************
syntax enable
syntax on
colorscheme desert
set background=dark
"highlight current line
set cursorline
"set gui Fonts
set guifont=Consolas:h12

"*******************************************
"VIM user interface
"*******************************************
"set the wildcard menu on
set wildmenu
"set the wildcard ignored Files
set wildignore=*.o,*.pyc,*.bak
"set number line show on the left
set number
set numberwidth=4
"set text width for a line with number
set textwidth=80
set columns=84
"set text height line number
set lines=30
"set current position show
set ruler
"no annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
"configure backspace so it acts as it should be
set backspace=indent,eol,start
"show command at the commandbar
set cmdheight=2
set showcmd
"do not redraw while executing macros
set lazyredraw
"a buffer becomes hidden when it is abandoned
set hidden
"show matchi brackets when text indicator is over them
set showmatch
set matchtime=5

"*******************************************
" ->Files and backups
"*******************************************
"set Unix as the standard file type
set ffs=unix,dos,mac
"set fast save and close
let g:mapleader =","
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>qq :q!<cr>
nmap <leader>wq :wq!<cr>
"turn backup off, since most stuff is in SVN,git etc.anyway.
set nobackup
set nowb
"turn swap file off
set noswapfile

"*******************************************
" ->Text,tab and indent related
"*******************************************
"set hightlight when width >= 80
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%80v.\+/
"Use spaces instead of tabs(to tab: ctrl + v + tab)
set expandtab
set smarttab
"1 tab = 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
"set auto indent
set ai
"set smart indent
set si
"set c style indent
set cindent
"linebreak when a line is too long, wrap it automatically.
set wrap
set completeopt=longest,menu "自动补全配置,让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"set relativenumber number   "相对行号，可用Ctrl+n在相对/绝对行号间切换
" 选中模式 Ctrl+c 复制选中的文本
"vnoremap <c-c> "+y

"*******************************************
"ctags
"*******************************************
nnoremap <F8> :!ctags -R --languages=C++ --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
set tags+=tags
set tags+=~/.vim/systags


"*******************************************
"taglist
"*******************************************
"let Tlist_Ctags_Cmd = ‘/usr/bin/ctags’
noremap <silent> <F3>  <Esc><Esc>:Tlist<CR>
inoremap <silent> <F3>  <Esc><Esc>:Tlist<CR>
"set ctags bin path for Taglist
let Tlist_Ctags_Cmd='/usr/bin/ctags'
"open Taglist window as default
let Tlist_Auto_Open=1
"show only one file tags
let Tlist_Show_One_File=1
"do not fold
let Tlist_File_Fold_Auto_Close=1
"close vim if only the taglist window
let Tlist_Exit_OnlyWindow=1
"close tags when open file
let Tlist_Close_On_Select=1
"focus on Taglist when opened
let Tlist_GainFocus_On_ToggleOpen=1
"display prototype
let Tlist_Display_Prototpye=1
"generate tags even the taglist window is closed
let Tlist_Process_File_Always=1
"define the heading for the (q)make sections
let tlist_make_settings='make;m:makros;t:targets;i:includes'
let tlist_qmake_settings='qmake;t:SystemVariables'
if has("autocmd")
    autocmd BufNewFile,BufRead *.pro set filetype=qmake
endif

"*****************************************
"winManager
"*****************************************
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>


"******************************************
"Cscope
"******************************************
set cscopequickfix=s-,c-,d-,i-,t-,e-
"设置自动添加cscope.out
if has("cscope")
   set csprg=/usr/bin/cscope              "指定用来执行 cscope 的命令
   set csto=1                             "先搜索tags标签文件，再搜索cscope数据库
   set cst                                "使用|:cstag|(:cs find g)，而不是缺省的:tag
   set nocsverb                           "不显示添加数据库是否成功
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out                   "添加cscope数据库,注意，如果要在子目录下也适用，最好写成cs add PWD/cscope.out PWD
   endif
   set csverb                             "显示添加成功与否
endif

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"******************************************
"MiniBufExplorer
"******************************************
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavVim = 1
noremap <silent> <Left> :bp<CR>
noremap <silent> <Right> :bn<CR>

"******************************************
"A
"******************************************
nnoremap <silent> <F12> :A<CR>


"******************************************
"智能补全
"******************************s************
filetype plugin indent on
set completeopt=longest,menu


"******************************************
"SuperTab
"******************************************
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"


"******************************************
" ->Bufexplorer
"******************************************
"map <leader><F4> :BufExplorer<CR>
"nmap <F4> :BufExplorerHorizontalSplit<CR>


"******************************************
"Grep
"******************************************
nnoremap <silent> <F3> :Grep<CR>

"******************************************
"Vundle
"******************************************
set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github 
 Bundle 'Shougo/neocomplete.vim'
 " vim-scripts repos
 "Bundle 'L9'
 " non github repos
 "Bundle 'git://git.wincent.com/command-t.git'
 " git repos on your local machine (ie. when working on your own plugin)
 "Bundle 'file:///Users/gmarik/path/to/plugin'
 " ...

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..


"******************************************
"neocomplete
"******************************************
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"******************************************
"F5自动编译单个c文件的代码
"******************************************
if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:iswindows=1
else
    let g:iswindows=0
endif

map <F5> :call Do_OneFileMake()<CR>
function Do_OneFileMake()
    if expand("%:p:h")!=getcwd()
        echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press <F7> to redirect to the dir of this file." | echohl None
        return
    endif
    let sourcefileename=expand("%:t")
    if (sourcefileename=="" || (&filetype!="cpp" && &filetype!="c"))
        echohl WarningMsg | echo "Fail to make! Please select the right file!" | echohl None
        return
    endif
    let deletedspacefilename=substitute(sourcefileename,' ','','g')
    if strlen(deletedspacefilename)!=strlen(sourcefileename)
        echohl WarningMsg | echo "Fail to make! Please delete the spaces in the filename!" | echohl None
        return
    endif
    if &filetype=="c"
        if g:iswindows==1
            set makeprg=gcc\ -o\ %<.exe\ %
        else
            set makeprg=gcc\ -o\ %<\ %
        endif
    elseif &filetype=="cpp"
        if g:iswindows==1
            set makeprg=g++\ -o\ %<.exe\ %
        else
            set makeprg=g++\ -o\ %<\ %
        endif
        "elseif &filetype=="cs"
        "set makeprg=csc\ \/nologo\ \/out:%<.exe\ %
    endif
    if(g:iswindows==1)
        let outfilename=substitute(sourcefileename,'\(\.[^.]*\)' ,'.exe','g')
        let toexename=outfilename
    else
        let outfilename=substitute(sourcefileename,'\(\.[^.]*\)' ,'','g')
        let toexename=outfilename
    endif
    if filereadable(outfilename)
        if(g:iswindows==1)
            let outdeletedsuccess=delete(getcwd()."\\".outfilename)
        else
            let outdeletedsuccess=delete("./".outfilename)
        endif
        if(outdeletedsuccess!=0)
            set makeprg=make
            echohl WarningMsg | echo "Fail to make! I cannot delete the ".outfilename | echohl None
            return
        endif
    endif
    execute "silent make"
    set makeprg=make
    execute "normal :"
    if filereadable(outfilename)
        if(g:iswindows==1)
            execute "!".toexename
        else
            execute "!./".toexename
        endif
    endif
    execute "copen"
endfunction
"进行make的设置
map <F6> :call Do_make()<CR>
map <c-F6> :silent make clean<CR>
function Do_make()
    set makeprg=make
    execute "silent make"
    execute "copen"
endfunction
