-- haishanh/night-owl.vim
vim.opt.termguicolors = true

-- set Vim-specific sequences for RGB colors
vim.cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
vim.cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')
vim.cmd("colorscheme night-owl")

-- Add better Tabline colours
vim.cmd("hi TabLineFill guifg=#02233e guibg=fg")
vim.cmd("hi TabLine guibg=#023055 guifg=#4e6e88")
vim.cmd("hi TabLineSel guibg=bg guifg=fg")

-- highlight on yank
vim.cmd('autocmd TextYankPost * silent! lua vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })')
