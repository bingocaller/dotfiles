-- Lualine takes care of this; no need to show it twice.
vim.opt.showmode = false

require("lualine").setup({
	options = {
		theme = "catppuccin",
		-- theme = "auto",
		component_separators = "│",
		section_separators = "",
	},
	sections = {
		lualine_b = {
			{
				"branch",
				icon = "",
			},
			"diff",
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
			},
		},
		lualine_z = {
			"location",
			"os.date('%H:%M')",
		},
	},
	extensions = { "fzf", "man", "nvim-tree", "quickfix" },
})
