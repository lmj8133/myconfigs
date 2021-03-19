set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" IndentLine
Plugin 'Yggdroot/indentLine'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'

" Color scheme of dracula
Plugin 'dracula/vim', {'as': 'dracula'}

Plugin 'morhetz/gruvbox'

" Globals
Plugin 'aceofall/gtags.vim'

" Outline Tool
Plugin 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plugin 'majutsushi/tagbar'

" Preview definition like source insight
Plugin 'wesleyche/srcexpl'

" Enhanced cpp syntax highlight
Plugin 'octol/vim-cpp-enhanced-highlight'

" Rainbow brackets 
Plugin 'luochen1990/rainbow'

" Auto pairs
Plugin 'jiangmiao/auto-pairs'

" Bracket selection
Plugin 'tpope/vim-surround'

" Multiple cursor
Plugin 'terryma/vim-multiple-cursors'

" Auto gray out precompilation condition
Plugin 'mphe/grayout.vim'

" Tag High light
Plugin 'vim-scripts/TagHighlight'

" Qt class support
Plugin 'fedorenchik/qt-support.vim'

" Show git diff lines
Plugin 'mhinz/vim-signify', { 'branch': 'legacy' }

" Git fugitive
" An powerful git plugin on vim
Plugin 'tpope/vim-fugitive'

" Markdown preview
Plugin 'iamcco/markdown-preview.vim'
", { 'do': { -> mkdp#util#install() } }

" Motivate scroll
Plugin 'yuttie/comfortable-motion.vim'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" python paths
let g:python3_host_pprog = '/usr/lib/python3'

" set indent line visible
let g:indentLine_color_term=249
let g:indentLine_color_gui='#39c5bb'
let g:indentLine_char='┆'

" set airline
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#right_sep=''
let g:airline_powerline_fonts=1
let g:airline_theme='tomorrow'
" reduce airline response time. eg. insert mode display to normal mode
set timeoutlen=1000 ttimeoutlen=0

let g:dracula_colorterm = 0

" scheme setting
" 'set' parameter
set t_Co=256
set background=dark
set number relativenumber
syntax on
" color dracula

let g:gruvbox_contrast_dark = 'hard'
'
color gruvbox
set termguicolors

" set comment color
hi Comment ctermfg=33
hi Identifier ctermfg=38

" set tab space
set tabstop=4
set shiftwidth=4
set expandtab

" Set cursor behavior
set cursorline
set cursorcolumn

" Set search behavior
set ignorecase

" set ctags
set tags=./tags,./TAGS,tags;~,TAGS;~
hi CTagsGlobalVariable ctermfg=27
hi CTagsMember ctermfg=135

" Reload vimrc automatically
augroup reload_vimrc
    autocmd!
    autocmd! BufWritePost $MYVIMRC nested source %
augroup END

" Refresh file (same with :edit)
set autoread

" Change to current file directory
"set autochdir

" set column color
set colorcolumn=72
let &colorcolumn="73,".join(range(81,101),",").join(range(121,999),",")
hi ColorColumn ctermbg=240 guibg=#20222b

" Mouse mode
" Enable
set mouse=a
set mouse+=nv
" Disable
" set mouse=
" Mapping middle key to nothing, by Maximum 3-clicks
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>

" Copy to clipboard
vnoremap <leader>y "+y

" Coding style of c code
set cinoptions+=:0

" Rainbow brackets
let g:rainbow_active=1

let g:rainbow_conf = {
\   'guifgs': ['#ff0000', '#ff5f00', '#ffd700', '#5fff5f', '#5f87ff', '#87ffff', '#ff00ff'],
"\                red   orange yellow green  blue  cyan   purple
\   'ctermfgs': ['196', '202', '220', '83', '69', '123', '201']
\}
" Disable automatic comment insertion
set formatoptions-=cro
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

nnoremap <silent> <special> <leader>nt :NERDTreeToggle <Bar> if &filetype ==# 'nerdtree' <Bar> wincmd p <Bar> endif<CR>
let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
let g:NERDTreeChDirMode=2
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
"nnoremap <F5> :exec ''NERDTreeToggle' <CR>
" Showing nerd tree bookmarks
let NERDTreeShowBookmarks=1

" Nerdtree tab shared
let g:nerdtree_tabs_open_on_console_startup=1

" Nerdtree git plugin
let g:NERDTreeGitStatusIndicatorMapCustom={
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
\}

" Setting gtags instead of ctags
set cscopetag
set cscopeprg='gtags-cscope'
let GtagsCscope_Auto_Load=1
let GtagsCscope_Auto_map=1
let GtagsCscope_Quiet=1

" Setting gtags functions
" let Gtags_Auto_VerticalWindow = 1
" let Gtags_Auto_Map=1
let Gtags_Auto_Update=1
" let Gtags_No_Auto_Jump = 1

" Setting Leaderf
noremap <F2> :LeaderfFunction!<cr>
noremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR><CR>
noremap <C-F><C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
noremap <C-F><C-R> :<C-U><C-R>=printf("Leaderf! rg -e ")<CR>
let g:Lf_WorkingDirectory=finddir('.gitignore', '.;')
let g:Lf_GtagsAutoGenerate=1
let g:Lf_WindowPosition='popup'
let g:Lf_PreviewInPopup=1

" Setting Tag bar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_foldlevel=0
let g:tagbar_show_linenumbers=2

" Setting srcexp
nmap <special> <F10> :SrcExplToggle <Bar> if &filetype ==# 'nerdtree' <Bar> wincmd l <Bar> endif<CR>
"nnoremap <silent> <special> <leader>nt :NERDTreeToggle <Bar> if &filetype ==# 'nerdtree' <Bar> wincmd p <Bar> endif<CR>
let g:SrcExpl_updateTagsKey = "<F10>"
let g:SrcExpl_prevDefKey = "<F3>"
let g:SrcExpl_nextDefKey = "<F4>"
let g:SrcExpl_pluginList = [
    \ "__Tagbar__",
    \ "NERD_tree"
\ ]
let g:SrcExpl_refreshTime = 50
let g:SrcExpl_isUpdateTags = 0

" Setting grayout
nnoremap <leader>gu :GrayoutUpdate<CR>
nnoremap <leader>gc :GrayoutClear<CR>
let g:grayout_workingdir = 1

" Setting update time of git diff lines
set updatetime=100

" Markdown preview
let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
"let g:mkdp_auto_start = 1
"let g:mkdp_auto_open = 1
"let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
nmap <C-m> <Plug>MarkdownPreviewToggle

"" Copyright insertion
"command AGcr
"map :AGcr :0r ~/Documents/works/copyright/ag_copyright
"if !exists(':AGcr')
    "command AGcr :0r ~/Documents/works/copyright/ag_copyright
"endif

"" Cmake syntax highlight
"  ----------------------
"  Set file extension of syntax highlight
au BufNewFile,BufRead CmakeLists.txt set filetype=cmake

"Searching resualt highlights
set hlsearch
"set textwidth=72
