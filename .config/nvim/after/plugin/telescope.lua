local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
	defaults = {
		prompt_prefix = "󰍉 ",
		selection_caret = "› ",
	},

	pickers = {
		git_files = {
			theme = "ivy",
		},
		grep_string = {
			hidden = true,
			theme = "ivy",
		},
		find_files = {
			hidden = true,
			theme = "ivy",
		},
		live_grep = {
			hidden = true,
			theme = "ivy",
		},
		oldfiles = {
			theme = "ivy",
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
telescope.load_extension("gh")
telescope.load_extension("zoxide")

vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<C-h>", builtin.oldfiles, {})
vim.keymap.set("n", "<C-b>", builtin.buffers, {})
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
-- Mnemonic: Project Search
vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
vim.keymap.set("n", "<C-f>", builtin.grep_string, {})

vim.keymap.set("n", "=z", builtin.spell_suggest, {})

vim.keymap.set("n", "<leader>cd", telescope.extensions.zoxide.list)
