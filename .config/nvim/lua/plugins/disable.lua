-- disable some LazyVim default plugins
return {
	{ "folke/flash.nvim", enabled = false },
	{ "folke/tokyonight.nvim", enabled = false },
	{ "lukas-reineke/headlines.nvim", enabled = false },
	{ "markdown-preview.nvim", enabled = false },
	{
		"folke/snacks.nvim",
		opts = {
			lazygit = { enabled = false },
			-- Disable indent line highlighting
			indent = { enabled = false },
			-- Disable “smooth” scrolling
			scroll = { enabled = false },
		},
	},
}
