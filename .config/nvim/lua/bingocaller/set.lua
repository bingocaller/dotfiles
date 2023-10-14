-- Show relative line numbers in gutter
vim.opt.number = true
vim.opt.relativenumber = true

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.opt.signcolumn = "yes"

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- Exceptions; could also be handled in ftplugin,
-- but it becomes untenable with many different file types
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*.css", "*.scss", "*.sass", "*.json" },
	command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab",
})

-- Do extra smart auto-indentation
vim.opt.smartindent = true

-- Show tabs and spaces as characters
vim.opt.list = true
vim.opt.listchars:append("tab:│  ,lead:·,trail:·")

-- Set line length limit and highlight the boundary
vim.opt.textwidth = 80
vim.opt.colorcolumn = "+1"

-- Don't (soft) wrap lines by default
vim.opt.wrap = false
-- When wrapping, don't break in the middle of words
vim.opt.linebreak = true

-- Don't conceal characters (in links and text formatting).
vim.opt.conceallevel = 0

-- Use British English and Danish for spelling
vim.opt.spelllang = "en_gb,da"

-- Open new split panes to right and bottom, which feels more natural
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8
-- The minimal number of screen columns to keep to the left and to the right of the cursor if 'nowrap' is set.
vim.opt.sidescrolloff = 8

-- We don't want to deal with this in .gitignore
vim.opt.swapfile = false

-- Some servers have issues with backup files.
-- See https://github.com/neoclide/coc.nvim/issues/649
vim.opt.backup = false
vim.opt.writebackup = false

-- Don't drop undo history when abandoning a buffer
-- 2022-01-07: Experimentally remove this in favour of undofile
vim.opt.hidden = false

-- Persistent undo, requires the presence of ~/.vim/undodir directory!
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Use incremental search, i.e. show results as you type
vim.opt.incsearch = true

-- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Ignore case unless capital letters are used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Assume the /g flag on :s substitutions to replace all matches in a line.
-- Can be disabled on a case-by-case basis by appending /g.
vim.opt.gdefault = true

-- Allow for @ in file names; might be useful
vim.opt.isfname:append("@-@")

-- Show partial command keys in the status line
vim.opt.showcmd = true

-- Automatically :write before running commands
vim.opt.autowrite = true

--  Make search/replace interactive without the split pane
vim.opt.inccommand = "nosplit"

-- Disable modelines as a security precaution
vim.opt.modelines = 0

-- _Fast_ updates
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")
-- vim.cmd("set shortmess+=c")

-- Show a global statusline instead of one for each window (Neovim only)
vim.opt.laststatus = 3

-------------
-- Filetypes
-------------

-- Always use Python 3
vim.opt.pyxversion = 3
vim.g.python3_host_prog = "/usr/local/bin/python3.10"
-- Don't load Python2 provider
vim.g.loaded_python_provider = 0

-- Markdown syntax highlighting
vim.g.markdown_fenced_languages = {
	"bash",
	"css",
	"html",
	"javascript",
	"lua",
	"scss",
	"sh",
	"typescript",
	"vim",
}

-- Abbreviations
-- Most of these are from https://vonheikemen.github.io/devlog/tools/using-vim-abbreviations/

-- Typos
vim.cmd("iabbrev borad board")
vim.cmd("iabbrev chagne change")
vim.cmd("iabbrev heigth height")
vim.cmd("iabbrev teh the")
vim.cmd("iabbrev widht width")

-- "Snippets" for JS/TS
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "javascript", "typescript", "typescriptreact" },
	command = "iabbrev <buffer> log console.log();<Left><Left>",
})

-- IIFEs
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "javascript", "typescript", "typescriptreact" },
	command = "iabbrev <buffer> iife (function() {})();<C-o>4h<CR><CR><Up><C-i>",
})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "javascript", "typescript", "typescriptreact" },
	command = "iabbrev <buffer> iife> (() => {})();<C-o>4h<CR><CR><Up><C-i>",
})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "javascript", "typescript", "typescriptreact" },
	command = "iabbrev <buffer> aiife (async function() {})();<C-o>4h<CR><CR><Up><C-i>",
})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "javascript", "typescript", "typescriptreact" },
	command = "iabbrev <buffer> aiife> (async () => {})();<C-o>4h<CR><CR><Up><C-i>",
})

-- `for` loops
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "javascript", "typescript", "typescriptreact" },
	command = "iabbrev <buffer> for@ for(let i = 0; i < z; i++) {<CR><CR>}<Esc>?z<CR>s",
})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "javascript", "typescript", "typescriptreact" },
	command = "iabbrev <buffer> forof for (const z of array) {<CR><CR>}<Esc>?z<CR>s",
})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "javascript", "typescript", "typescriptreact" },
	command = "iabbrev <buffer> forin for (const z in object) {<CR><CR>}<Esc>?z<CR>s",
})
