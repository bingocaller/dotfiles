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
	extensions = { "nvim-tree" },
})
