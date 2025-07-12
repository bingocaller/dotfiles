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
	},
	{
		-- Abbreviation, Substitution, Coercion
		"tpope/vim-abolish",
	},
	{
		-- Enable repeating lots more stuff
		"tpope/vim-repeat",
	},
	{
		-- Automatically set `'shiftwidth'`, `'expandtab'`, `'textwidth'`, etc.
		-- based on the current file, its context, and EditorConfig.
		"tpope/vim-sleuth",
	},
	{
		-- Surround stuff with other stuff
		"tpope/vim-surround",
	},
	{
		-- Lots of mappings
		"tpope/vim-unimpaired",
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
			---@type boolean Use default keymaps (<space>m - toggle, <space>j - join, <space>s - split)
			use_default_keymaps = false,
			---@type boolean Node with syntax error will not be formatted
			check_syntax_error = true,
			---If line after join will be longer than max value,
			---@type number If line after join will be longer than max value, node will not be formatted
			max_join_length = 120,
			---Cursor behavior:
			---hold - cursor follows the node/place on which it was called
			---start - cursor jumps to the first symbol of the node being formatted
			---end - cursor jumps to the last symbol of the node being formatted
			---@type 'hold'|'start'|'end'
			cursor_behavior = "hold",
			---@type boolean Notify about possible problems or not
			notify = true,
			---@type boolean Use `dot` for repeat action
			dot_repeat = true,
			---@type table Presets for languages. See the default presets in lua/treesj/langs.
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

	{
		"Equilibris/nx.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			-- See below for config options
			nx_cmd_root = "npx nx",
		},
		-- Plugin will load when you use these keys
		keys = {
			{
				"<leader>pn", -- Mnemonic: Project Nx
				"<cmd>Telescope nx actions<CR>",
				desc = "nx actions",
			},
		},
	},

	-- Tools for writing
	{
		"davidmh/mdx.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
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
