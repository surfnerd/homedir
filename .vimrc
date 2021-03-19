" file editing 
"backspace 
set backspace=indent,eol,start
" show syntax colors
syntax on
" set the color scheme
colorscheme molokai
" show line numbers
set number
" highlight last inserted text
nnoremap gV `[v`]

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" misc
set showcmd
set cursorline
set cursorcolumn
set wildmenu
set lazyredraw
set laststatus=2
set statusline+=%F

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\

" tabs
set autoindent
set expandtab    " spaces instead of tabs
set tabstop=4
set shiftwidth=4

" backup
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" folding
"set modelines=1

" mappings
let mapleader=" "
nnoremap <SPACE> <Nop>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
inoremap { {}<Esc>i

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 
set wildignore+=*\\External\\**
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" Set no max file limit
let g:ctrlp_max_files = 0
" Search from current directory instead of project root
let g:ctrlp_working_path_mode = 0

" custom file types
au BufRead,BufNewFile *.bindings set filetype=cs
au BufRead,BufNewFile *.jam setlocal ft=jam
au BufNewFile,BufRead *.sol setf solidity

autocmd FileType r if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif
autocmd FileType rmd if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif

hi Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
