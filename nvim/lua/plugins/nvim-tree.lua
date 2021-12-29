vim.g.nvim_tree_quit_on_open = 1 -- 0 by default, closes the tree when you open a file
vim.g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.

local nvim_tree = require("nvim-tree")
local u = require("utils")

-- Necessary to initialise nvim-tree
-- following options are the default
nvim_tree.setup({
  hijack_cursor = false,
  -- open the tree when running this setup function
  -- open_on_setup = true,
  -- show lsp diagnostics in the signcolumn
  diagnostics = {
    enable = true,
  },
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  view = {
    -- width of the window, can be either a number (columns) or a string in `%`
    width = "30%",
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = "right",
    -- if true the tree will resize itself after opening a file
    auto_resize = false,
  },
})

u.nmap("<C-n>", ":NvimTreeToggle<CR>", { noremap = true })
u.nmap("<leader>r", ":NvimTreeRefresh<CR>", { noremap = true })
u.nmap("<leader>n", ":NvimTreeFindFile<CR>", { noremap = true })
