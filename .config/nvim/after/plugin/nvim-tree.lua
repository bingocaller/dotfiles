-- Necessary to initialise nvim-tree
-- following options are the default
require("nvim-tree").setup({
	actions = {
		open_file = {
			-- if true the tree will resize itself after opening a file
			resize_window = true,
			-- 0 by default, closes the tree when you open a file
			quit_on_open = true,
		},
	},
	-- show lsp diagnostics in the signcolumn
	diagnostics = {
		enable = true,
	},
	renderer = {
		-- 0 by default, will enable folder and file icon highlight for opened files/directories.
		highlight_opened_files = "all",
	},
	-- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
	view = {
		-- width of the window, can be either a number (columns) or a string in `%`
		width = "30%",
		-- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
		side = "right",
	},
})

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile<CR>")
