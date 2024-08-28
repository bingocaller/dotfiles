require("gitsigns").setup({
	signs = {
		add = { text = "▎" },
		change = { text = "▎" },
		delete = { text = "" },
		topdelete = { text = "" },
		changedelete = { text = "▎" },
		untracked = { text = "▎" },
	}
})

-- vim.keymap.set("n", "<leader>gs", ":Gitsigns<cr>")
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<cr>")
