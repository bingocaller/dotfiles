local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
	defaults = {
		prompt_prefix = "❯ ",
		selection_caret = "› ",
	},

	pickers = {
		grep_string = {
			hidden = true,
		},
		find_files = {
			hidden = true,
		},
		live_grep = {
			hidden = true,
		},
		spell_suggest = {
			theme = "cursor",
		},
		planets = {
			show_pluto = true,
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")

vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<C-h>", builtin.oldfiles, {})
vim.keymap.set("n", "<C-b>", builtin.buffers, {})
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
vim.keymap.set("n", "=z", builtin.spell_suggest, {})
