return {
	-- Editing text
	{
		-- Sort things using a motion
		"christoomey/vim-sort-motion",
		keys = "gs",
	},
	{
		-- Switch things around using `cx`
		"tommcdo/vim-exchange",
		keys = {
			"cx",
			{ mode = "v", "cx" },
		},
	},
	{
		-- Abbreviation, Substitution, Coercion
		"tpope/vim-abolish",
		event = { "LazyFile", "VeryLazy" },
	},
	{
		-- Enable repeating lots more stuff
		"tpope/vim-repeat",
		keys = ".",
	},
	{
		-- Automatically set `'shiftwidth'`, `'expandtab'`, `'textwidth'`, etc.
		-- based on the current file, its context, and EditorConfig.
		"tpope/vim-sleuth",
		event = { "LazyFile", "VeryLazy" },
	},
	{
		-- Surround stuff with other stuff
		"tpope/vim-surround",
		keys = {
			"cs",
			"ds",
			"ys",
			{ mode = "v", "S" },
		},
	},
	{
		-- Lots of mappings
		"tpope/vim-unimpaired",
		event = { "LazyFile", "VeryLazy" },
	},
	{
		-- Split/join blocks of code
		"Wansmer/treesj",
		keys = {
			{
				"<leader>m",
				function()
					require("treesj").toggle()
				end,
				desc = "Treesj: toggle",
			},
		},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			use_default_keymaps = false,
			langs = LazyVim.has("treesj") and {
				svg = require("treesj.langs.utils").merge_preset(
					require("treesj.langs.html"),
					{}
				),
				xml = require("treesj.langs.utils").merge_preset(
					require("treesj.langs.html"),
					{}
				),
			} or {},
		},
	},

	-- Git & Hub
	-- {
	-- 	-- Edit and review GitHub issues and pull requests
	-- 	"pwntester/octo.nvim",
	-- 	requires = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 		-- OR 'ibhagwan/fzf-lua',
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	cmd = "Octo",
	-- 	opts = {
	-- 		default_merge_method = "squash",
	-- 	},
	-- },
	{
		"tpope/vim-fugitive",
		cmd = "G",
	},

	-- Tools for writing
	{
		-- Markdown batteries
		"ixru/nvim-markdown",
		ft = "markdown",
	},
	{
		-- Used for Markdown preview (instead of markdown-preview.nvim, which
		-- stopped working recently and seems unmaintained at the moment).
		"jannis-baum/vivify.vim",
		ft = "markdown",
	},
	{
		-- Zettelkasten functionality. Ties into `zk` binary/language server
		"mickael-menu/zk-nvim",
		ft = "markdown",
	},
}
