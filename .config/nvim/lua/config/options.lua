-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- DON'T use the system clipboard for yanking, deleting, etc.
vim.opt.clipboard = ""

-- Show tabs and spaces as characters
vim.opt.listchars:append("tab:│  ,lead:·,trail:·")

-- Set default line length limit and highlight the boundary
vim.opt.textwidth = 80
vim.opt.colorcolumn = "+1"

-- Don't conceal characters (in links and text formatting).
vim.opt.conceallevel = 0

-- Use British English and Danish for spelling
vim.opt.spelllang = "en_gb,da"

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8
-- The minimal number of screen columns to keep to the left and to the right of
-- the cursor if 'nowrap' is set.
vim.opt.sidescrolloff = 8

-- Don't drop undo history when abandoning a buffer
-- 2022-01-07: Experimentally remove this in favour of undofile
vim.opt.hidden = false

-- Persistent undo, requires the presence of ~/.vim/undodir directory!
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Use incremental search, i.e. show results as you type
vim.opt.incsearch = true

-- Assume the /g flag on :s substitutions to replace all matches in a line.
-- Can be disabled on a case-by-case basis by appending /g.
vim.opt.gdefault = true

-- Allow for @ in file names; useful for multiple-resolution images (e.g.
-- image@1x.png, image@2x.png, image@3x.png)
vim.opt.isfname:append("@-@")

-- Show partial command keys in the status line
vim.opt.showcmd = true

-- Disable modelines as a security precaution
vim.opt.modelines = 0

-- Allow for using more memory for patterns
vim.opt.maxmempattern = 5000 -- Default is 1000

-------------
-- Filetypes
-------------

vim.filetype.add({
	extension = {
		njk = "htmldjango",
		markdownlintrc = "jsonc",
		webc = "html",
	},
})

-- Node Provider setup
vim.g.node_host_prog = "/opt/homebrew/bin/neovim-node-host"

-- Always use Python 3
vim.opt.pyxversion = 3
vim.g.python3_host_prog = "/Users/jesper/.pyenv/versions/neovim/bin/python"
-- Don't load Python2 provider
vim.g.loaded_python_provider = 0

-- Disable Ruby provider
vim.g.loaded_ruby_provider = 0

----------------------------
-- Diagnostics
----------------------------

-- Virtual lines
-- https://gpanders.com/blog/whats-new-in-neovim-0-11/#virtual-lines
vim.diagnostic.config({
	-- Use the default configuration
	-- virtual_lines = true,

	-- Alternatively, customize specific options
	virtual_lines = {
		-- Only show virtual line diagnostics for the current cursor line
		current_line = true,
	},
})

----------------
-- Abbreviations
----------------

-- Typos
-- TODO: Use vim-abolish for these
vim.cmd("iabbrev borad board")
vim.cmd("iabbrev chagne change")
vim.cmd("iabbrev heigth height")
vim.cmd("iabbrev teh the")
vim.cmd("iabbrev widht width")

-- LazyVim automatically configures lazygit:
--  * theme, based on the active colorscheme.
--  * editorPreset to nvim-remote
--  * enables nerd font icons
-- Set to false to disable.
-- vim.g.lazygit_config = false
