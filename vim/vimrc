" -------
" Options
" -------
" Show relative line numbers in gutter
set number
set relativenumber

" Don't wrap lines by default
set nowrap

" Stop folding stuff!
set nofoldenable

" Indentation
set expandtab
set shiftwidth=4
set softtabstop=4

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Don't drop undo history when abandoning a buffer
set hidden

" Persistent undo, requires the presence of ~/.vim/undo directory!
" set undofile
" set undodir=$HOME/.vim/undo

" set undolevels=1000
" set undoreload=10000

" Some servers have issues with backup files.
" See https://github.com/neoclide/coc.nvim/issues/649
set nobackup
set nowritebackup

" We don't want to deal with this in .gitignore
set noswapfile

" Show partial command keys in the status line
set showcmd

" Automatically :write before running commands
set autowrite

" Ignore case unless capital letters are used
set ignorecase smartcase

" assume the /g flag on :s substitutions to replace all matches in a line
set gdefault 

" Disable modelines as a security precaution
set modelines=0

" Always use Python 3
set pyxversion=3
let g:python3_host_prog = "/usr/local/bin/python3"

" ----------
" Remappings
" ----------

" Zero moves to first character on line instead of beginning of line
nmap 0 ^
" Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk
" Y yanks to end of line instead of the entire line
nmap Y y$

" Remove highlight, e.g. after search
nmap <Esc> :nohlsearch<cr>

" Save from insert mode
imap <C-s> <esc>:w<cr>

" Expand Emmet abbreviation
" imap <S-tab> <plug>(emmet-expand-abbr)

" ------------------
" Leader mappings (disable in VSCod(e|ium)
" ------------------
" <leader> = <Space>
let mapleader = " "

" Split edit .vimrc
nmap <leader>vr :sp $MYVIMRC<cr>
" Source (reload) .vimrc
nmap <leader>so :source $MYVIMRC<cr>
" Install Plugins
nmap <leader>pi :PlugInstall<cr>
" Update tag (via Emmet)
nmap <leader>u <plug>(emmet-update-tag)
" Switch between the last two files
nnoremap <leader><leader> <C-^>

" Search for word under cursor within project.
nnoremap <C-f> :Rg <C-R><C-W><cr>
" Search for selected text withing project using f(ind) register
vnoremap <C-f> "fy:Rg <C-R>f<C-W><cr>

" RENAME CURRENT FILE (thanks Gary Bernhardt and Ben Orenstein)
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>r :call RenameFile()<cr>

" Autocommands
" Bind `q` to close the buffer for help files
autocmd Filetype help nnoremap <buffer> q :q<CR>
" Force Vim to rescan entire buffer when highlighting large JSX/TSX files.
" Disable when leaving.
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Enable wrapping in Markdown files, disable when leaving
autocmd BufEnter,BufNewFile,BufRead *.{md,mdx} :set wrap
autocmd BufLeave *.{md,mdx} :set nowrap

" Force Nunjucks files to register as such
autocmd BufEnter,BufNewFile,BufRead *.{njk,nunjucks,jinja} :set filetype=jinja.html

