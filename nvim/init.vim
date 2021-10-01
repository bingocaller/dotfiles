set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc

" ------------------------
" NeoVim-specific settings
" ------------------------
"  Make search/replace interactive without the split pane
set inccommand=nosplit

" Don't load Python2 provider
let g:loaded_python_provider = 0

"-------------------
" Treesitter modules
" From: https://github.com/nvim-treesitter/nvim-treesitter#available-modules

lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        
    -- List of parsers to ignore installing
    ignore_install = {
        "beancount",
        "bibtex",
        "cuda",
        "devicetree",
        "dot",
        "fennel",
        "gdresource",
        "gdscript",
        "gomod",
        "hcl",
        "heex",
        "ledger",
        "pioasm",
        "ql",
        "sparql",
        "supercollider",
        "surface",
        "teal",
        "tlaplus",
        "turtle",
        "verilog",
        "yang"
    },

    -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
    context_commentstring = {
        enable = true
    },

    -- Core module
    highlight = {
        enable = true,              -- false will disable the whole extension

        -- custom_captures = {
        --     -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
        --     ["foo.bar"] = "Identifier",
        -- },

        -- disable = { "c", "rust" },  -- list of language that will be disabled

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },

    -- Core module
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },

    -- Core module
    indent = {
        enable = true
    }
}
require'lualine'.setup {
    options = {theme = 'material'}
}
EOF

if exists('g:vscode')
    " Let VSCod(e|ium) handle things
    source $HOME/.config/nvim/vscode/settings.vim
else
    " Only set up Coc if we're not in VSCod(e|ium)
    " ---
    " Coc
    " ---

    " Help coc-css with @s in SCSS files
    autocmd FileType scss setl iskeyword+=@-@

    " From Coc example configuration
    " https://github.com/neoclide/coc.nvim#example-vim-configuration

    " Give more space for displaying messages.
    set cmdheight=2

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    if has("patch-8.1.1564")
        " Recently vim can merge signcolumn and number column into one
        set signcolumn=number
    else
        set signcolumn=yes
    endif

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <C-Space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
    if exists('*complete_info')
        inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
        inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window, fallback to :help.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code. Works as a motion and with visual mode.
    xmap <leader>f <Plug>(coc-format-selected)
    nmap <leader>f <Plug>(coc-format-selected)

    augroup mygroup
        autocmd!
        " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder.
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a <Plug>(coc-codeaction-selected)
    nmap <leader>a <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf <Plug>(coc-fix-current)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

    " Mappings for CoCList
    " Show all diagnostics.
    nnoremap <silent> <leader>di :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent><nowait> <leader>ex :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent><nowait> <leader>c :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent><nowait> <leader>o :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent><nowait> <leader>sy :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    " nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    " nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    " nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

    " " Scroll inside pop-up/floating windows using keyboard
    " nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    " nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    " noremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    " noremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    
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

    " Tab switching
    tnoremap <a-]> <c-\><c-n>gt
    nnoremap <a-]> gt
    tnoremap <a-[> <c-\><c-n>gT
    nnoremap <a-[> gT

    tnoremap <a-1> <c-\><c-n>1gt
    tnoremap <a-2> <c-\><c-n>2gt
    tnoremap <a-3> <c-\><c-n>3gt
    tnoremap <a-4> <c-\><c-n>4gt
    tnoremap <a-5> <c-\><c-n>5gt
    tnoremap <a-6> <c-\><c-n>6gt
    tnoremap <a-7> <c-\><c-n>7gt
    tnoremap <a-8> <c-\><c-n>8gt
    tnoremap <a-9> <c-\><c-n>9gt
    nnoremap <a-1> 1gt
    nnoremap <a-2> 2gt
    nnoremap <a-3> 3gt
    nnoremap <a-4> 4gt
    nnoremap <a-5> 5gt
    nnoremap <a-6> 6gt
    nnoremap <a-7> 7gt
    nnoremap <a-8> 8gt
    nnoremap <a-9> 9gt

    " Open terminal
    nnoremap <leader>t :terminal<cr>
    " Helpful terminal mode shortcuts
    " Switch to normal mode with <Esc>
    " tnoremap <Esc> <C-\><C-n>
    " Backup Esc event
    " tnoremap <A-[> <Esc>
    tnoremap <A-[> <C-\><C-n>
    " Paste into terminal from register
    tnoremap <expr> <A-r> '<C-\><C-n>"'.nr2char(getchar()).'pi'
endif

