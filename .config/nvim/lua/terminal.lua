local u = require("utils")

-- --------------
-- Terminal stuff
-- --------------

-- Open terminal
u.nmap("<leader>t", ":terminal<cr>", { noremap = true })
-- Helpful terminal mode shortcuts
-- Switch to normal mode with <Esc>
-- tnoremap <Esc> <C-\><C-n>
-- Backup Esc event
-- tnoremap <A-[> <Esc>
u.tmap("<A-[>", "<C-\\><C-n>", { noremap = true })
-- Paste into terminal from register
u.tmap("<expr> <A-r>", "'<C-\\><C-n>\"'.nr2char(getchar()).'pi'", { noremap = true })
