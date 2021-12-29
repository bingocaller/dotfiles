local u = require("utils")

----------
-- Options
----------

-- Show relative line numbers in gutter
vim.opt.number = true
vim.opt.relativenumber = true

-- Don't wrap lines by default
vim.opt.wrap = false

-- Stop folding stuff!
vim.opt.foldenable = false

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Open new split panes to right and bottom, which feels more natural
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Don't drop undo history when abandoning a buffer
vim.opt.hidden = true

-- Persistent undo, requires the presence of ~/.vim/undo directory!
-- vim.opt.undofile
-- vim.opt.undodir=$HOME/.vim/undo

-- vim.opt.undolevels=1000
-- vim.opt.undoreload=10000

-- Some servers have issues with backup files.
-- See https://github.com/neoclide/coc.nvim/issues/649
vim.opt.backup = false
vim.opt.writebackup = false

-- We don't want to deal with this in .gitignore
vim.opt.swapfile = false

-- Show partial command keys in the status line
vim.opt.showcmd = true

-- Automatically :write before running commands
vim.opt.autowrite = true

-- Ignore case unless capital letters are used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Do extra smart auto-indentation
vim.opt.smartindent = true

-- assume the /g flag on :s substitutions to replace all matches in a line
vim.opt.gdefault = true

--  Make search/replace interactive without the split pane
vim.opt.inccommand = "nosplit"

-- Disable modelines as a security precaution
vim.opt.modelines = 0

-- Always use Python 3
vim.opt.pyxversion = 3
vim.g.python3_host_prog = "/usr/local/bin/python3"
-- Don't load Python2 provider
vim.g.loaded_python_provider = 0

-- Markdown syntax highlighting
vim.g.markdown_fenced_languages = {
  "css",
  "html",
  "javascript",
  "lua",
  "scss",
  "typescript",
  "vim",
}

-------------
-- Remappings
-------------

-- Zero moves to first character on line instead of beginning of line
u.nmap("0", "^")
-- Move up and down by visible lines if current line is wrapped
u.nmap("j", "gj")
u.nmap("k", "gk")
-- Y yanks to end of line instead of the entire line
u.nmap("Y", "y$")

-- Remove highlight, e.g. after search
u.nmap("<Esc>", ":nohlsearch<cr>")

-- Save from insert mode
u.imap("<C-s>", "<esc>:w<cr>")

------------------
-- Leader mappings
------------------

-- <leader> = <Space>
vim.g.mapleader = " "

-- Split edit init.lua
u.nmap("<leader>vr", ":sp $MYVIMRC<cr>")
-- Source (reload) init.lua
u.nmap("<leader>so", ":luafile $MYVIMRC<cr>")
-- u.nmap("<leader>so", ":source $MYVIMRC<cr>")

-- Packer (plugin) commands
u.nmap("<leader>pc", ":PackerCompile<cr>")
u.nmap("<leader>pi", ":PackerInstall<cr>")

-- Switch between the last two buffers
u.nmap("<leader><leader>", "<C-^>", { noremap = true })

-- -- Autocommands
-- -- Bind `q` to close the buffer for help files
vim.api.nvim_command("autocmd Filetype help nnoremap <buffer> q :q<CR>")
-- -- Enable wrapping in Markdown files, disable when leaving
vim.api.nvim_command("autocmd BufEnter *.{md,mdx} setlocal wrap")
vim.api.nvim_command("autocmd BufLeave *.{md,mdx} setlocal nowrap")
-- Enable spell checking in git commits and Markdown files
vim.api.nvim_command("autocmd BufEnter gitcommit,*.{md,mdx} setlocal spell")
vim.api.nvim_command("autocmd BufLeave gitcommit,*.{md,mdx} setlocal nospell")

-- Automatically regenerate compiled loader file for Packer,
-- when plugins.lua changes
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost ~/.config/nvim/lua/plugins/init.lua source <afile> | PackerCompile
  augroup end
]])

require("windows")
require("terminal")
require("plugins")
require("lsp")
