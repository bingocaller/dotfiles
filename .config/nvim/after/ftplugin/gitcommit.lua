-- Enable wrapping, spell-checking
vim.opt_local.wrap = true
vim.opt_local.spell = true

vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true

-- Set line length cut-off for body and highlight cut-off for title (body line
-- length limit is highlighted by default, see bingocaller/set.lua)
vim.opt_local.textwidth = 72
vim.opt_local.colorcolumn:append("51")

-- Start in insert mode at end of the first line. Basically, saves typing A
-- every time a commit is started.
vim.cmd("startinsert!")
