set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc

" ------------------------
" NeoVim-specific settings
" ------------------------
"  Make search/replace interactive without the split pane
set inccommand=nosplit

" Helpful terminal mode shortcuts
" Switch to normal mode with <Esc>
" tnoremap <Esc> <C-\><C-n>
" Backup Esc event
" tnoremap <A-[> <Esc>
tnoremap <A-[> <C-\><C-n>
" Window switching
" Alt + hjkl: jump between windows
" Alt + HJKL: move windows around
tnoremap <a-h> <c-\><c-n><c-w>h
tnoremap <a-j> <c-\><c-n><c-w>j
tnoremap <a-k> <c-\><c-n><c-w>k
tnoremap <a-l> <c-\><c-n><c-w>l
tnoremap <a-H> <c-\><c-n><c-w>H
tnoremap <a-J> <c-\><c-n><c-w>J
tnoremap <a-K> <c-\><c-n><c-w>K
tnoremap <a-L> <c-\><c-n><c-w>L
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l
nnoremap <a-H> <c-w>H
nnoremap <a-J> <c-w>J
nnoremap <a-K> <c-w>K
nnoremap <a-L> <c-w>L
" Paste into terminal from register
tnoremap <expr> <A-r> '<C-\><C-n>"'.nr2char(getchar()).'pi'

" Open terminal
nnoremap <leader>t :terminal<cr>
