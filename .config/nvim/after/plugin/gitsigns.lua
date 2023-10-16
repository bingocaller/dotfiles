require("gitsigns").setup()

-- vim.keymap.set("n", "<leader>gs", ":Gitsigns<cr>")
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<cr>")
