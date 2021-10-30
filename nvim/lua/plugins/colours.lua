-- local nightfox = require("nightfox")

-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above
-- nightfox.setup({
--   styles = {
--     comments = "italic", -- change style of comments to be italic
--     keywords = "bold", -- change style of keywords to be bold
--     functions = "italic,bold", -- styles can be a comma separated list
--   },
--   inverse = {
--     match_paren = true, -- inverse the highlighting of match_parens
--   },
-- })
-- Load the configuration set above and apply the colorscheme
-- nightfox.load()

-- Tokyo Night settings
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.api.nvim_command("colorscheme tokyonight")

-- set Vim-specific sequences for RGB colors
-- vim.api.nvim_command('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
-- vim.api.nvim_command('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')

-- Add better Tabline colours
-- vim.api.nvim_command("hi TabLineFill guifg=#02233e guibg=fg")
-- vim.api.nvim_command("hi TabLine guibg=#023055 guifg=#4e6e88")
-- vim.api.nvim_command("hi TabLineSel guibg=bg guifg=fg")

-- highlight on yank
vim.api.nvim_command(
  'autocmd TextYankPost * silent! lua vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })'
)
