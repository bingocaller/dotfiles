local u = require("utils")

-- Don't highlight word under cursor (default: 1)
-- vim.api.nvim_command([[let g:Illuminate_highlightUnderCursor = 0]])
-- Time in milliseconds (default 0)
vim.api.nvim_command([[let g:Illuminate_delay = 500]])

u.nmap("<a-n>", '<cmd> lua require"illuminate".next_reference{wrap=true}<CR>', {noremap=true})
u.nmap("<a-p>", '<cmd> lua require"illuminate".next_reference{reverse=true,wrap=true}<CR>', {noremap=true})
